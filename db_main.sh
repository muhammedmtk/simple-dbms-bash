#!/usr/bin/env bash

BASE_DIR="db_data"
mkdir -p "$BASE_DIR"

connect_db()
{
read -p "Enter database name to connect: " db_name

if [[ ! -d "$BASE_DIR/$db_name" ]]; then
echo "Database isn't found"
read -p "Please Enter..."
return
fi

echo "Connected to database: $db_name"
read -p "Press Enter..."
table_menu "$db_name"
}

drop_db() {
  read -p "Enter database name to drop: " db_name

  if [[ ! -d "$BASE_DIR/$db_name" ]]; then
    echo "Database does not exist"
    read -p "Press Enter..."
    return
  fi

  read -p "Are you sure? (y/n): " confirm
  if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
    rm -r "$BASE_DIR/$db_name"
    echo "Database dropped successfully"
  else 
    echo "Operation cancelled"
  fi

  read -p "Press Enter..."
}


list_db()
 {
echo "Available Databases:"
ls "$BASE_DIR" || echo "No databases found"
read -p "Press Enter..."	
}

create_db()
 {
  read -p "Enter database name: " db_name

  if [[ -z "$db_name" ]]; then
    echo "Database name must not be empty"
    read -p "Press Enter..."
    return
  fi

  if [[ -d "$BASE_DIR/$db_name" ]]; then
    echo "Database already exists"
  else
    mkdir "$BASE_DIR/$db_name"
    echo "Database created successfully"
  fi

  read -p "Press Enter..."
}

main_menu() {
  while true; do
    clear
    echo "==== main menu database ===="
    echo "1) Create Database"
    echo "2) List Database"
    echo "3) Connect to Database"
    echo "4) Drop Database"
    echo "5) Exit"
    echo
    read -p "Choose an option: " choice

    case "$choice" in
      1) create_db ;;
      2) list_db ;;
      3) connect_db;; 
      4) drop_db ;;
      5) echo "Bye"; exit 0;;
      *) echo "Invalid Choice"; sleep 1 ;;
    esac
  done
}


