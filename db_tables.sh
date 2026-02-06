#!/usr/bin/env bash

create_table() {
  db="$1"
  read -p "Enter table name: " table
  if [[ -z "$table" ]]; then
    echo "Table name must not be empty"
    read -p "Press Enter..."
    return
  fi
  file="$BASE_DIR/$db/$table.data"
  if [[ -e "$file" ]]; then
    echo "Table already exists"
  else
    read -p "Enter column names (comma-separated): " columns
    echo "$columns" > "$file"
    echo "Table created with columns: $columns"
  fi
  read -p "Press Enter..."
}

list_tables() {
  db="$1"
  echo "Tables:"
  shopt -s nullglob
  files=("$BASE_DIR/$db"/*.data)
  if [[ ${#files[@]} -eq 0 ]]; then
    echo "No tables found"
  else
    for f in "${files[@]}"; do
      basename "$f"
    done
  fi
  read -p "Press Enter..."
}

drop_table() {
  db="$1"
  read -p "Enter table name to drop: " table
  file="$BASE_DIR/$db/$table.data"
  if [[ ! -e "$file" ]]; then
    echo "Table does not exist"
  else
    rm "$file"
    echo "Table dropped"
  fi
  read -p "Press Enter..."
}

insert_row() {
  db="$1"
  read -p "Enter table name to insert into: " table
  file="$BASE_DIR/$db/$table.data"
  if [[ ! -e "$file" ]]; then
    echo "Table not found"
    read -p "Press Enter..."
    return
  fi
  columns=$(head -1 "$file")
  echo "The columns in order: $columns"
  col_count=$(echo "$columns" | tr ',' '\n' | wc -l)
  read -p "Enter values (comma-separated, $col_count values): " values
  value_count=$(echo "$values" | tr ',' '\n' | wc -l)
  if [[ $value_count -ne $col_count ]]; then
    echo "Error: Expected $col_count values, got $value_count"
  else
    echo "$values" >> "$file"
    echo "Row inserted"
  fi
  read -p "Press Enter..."
}

show_table() {
  db="$1"
  read -p "Enter table name to show: " table
  file="$BASE_DIR/$db/$table.data"
  if [[ ! -e "$file" ]]; then
    echo "Table not found"
  else
    echo "==== Table: $table ===="
    cat "$file" || echo "No data"
  fi
  read -p "Press Enter..."
}

delete_row() {
  db="$1"
  read -p "Enter table name: " table
  file="$BASE_DIR/$db/$table.data"
  if [[ ! -e "$file" ]]; then
    echo "Table not found"
    read -p "Press Enter..."
    return
  fi
  echo "Current rows:"
  tail -n +2 "$file" | cat -n || echo "No rows"
  read -p "Enter row number to delete: " row_num
  if [[ -z "$row_num" || ! "$row_num" =~ ^[0-9]+$ ]]; then
    echo "Invalid row number"
  else
    sed -i "$((row_num + 1))d" "$file"
    echo "Row deleted"
  fi
  read -p "Press Enter..."
}

update_row() {
  db="$1"
  read -p "Enter table name: " table
  file="$BASE_DIR/$db/$table.data"
  if [[ ! -e "$file" ]]; then
    echo "Table not found"
    read -p "Press Enter..."
    return
  fi
  echo "Current rows:"
  tail -n +2 "$file" | cat -n || echo "No rows"
  read -p "Enter row number to update: " row_num
  if [[ -z "$row_num" || ! "$row_num" =~ ^[0-9]+$ ]]; then
    echo "Invalid row number"
  else
    read -p "Enter new values (comma-separated): " new_data
    sed -i "$((row_num + 1))s/.*/$new_data/" "$file"
    echo "Row updated"
  fi
  read -p "Press Enter..."
}

table_menu() {
  db="$1"
  while true; do
    clear
    echo "==== Database: $db ===="
    echo "1) Create Table"
    echo "2) List Tables"
    echo "3) Drop Table"
    echo "4) Insert into Table"
    echo "5) Select From Table"
    echo "6) Delete From Table"
    echo "7) Update Table"
    echo "8) Back"
    read -p "Choose an option: " choice
    case "$choice" in
      1) create_table "$db" ;;
      2) list_tables "$db" ;;
      3) drop_table "$db" ;;
      4) insert_row "$db" ;;
      5) show_table "$db" ;;
      6) delete_row "$db" ;;
      7) update_row "$db" ;;
      8) return ;;
      *) echo "Invalid Choice"; sleep 1 ;;
    esac
  done
}
