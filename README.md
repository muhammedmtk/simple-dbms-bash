# Simple DBMS in Bash

A lightweight, educational database management system built entirely in Bash. Manage databases, create tables with columns, and perform CRUD operations (Create, Read, Update, Delete) directly from the terminal.

## 🎯 Features

### Database Management

- ✅ **Create Database** — Create new databases as directories
- ✅ **List Databases** — View all existing databases
- ✅ **Connect to Database** — Access a specific database
- ✅ **Drop Database** — Delete databases and all contents

### Table Operations

- ✅ **Create Table** — Create tables with custom columns
- ✅ **List Tables** — View all tables in a database
- ✅ **Drop Table** — Delete specific tables
- ✅ **Insert Rows** — Add data with validation
- ✅ **Select (View)** — Display table contents
- ✅ **Update Rows** — Modify existing data
- ✅ **Delete Rows** — Remove specific rows

## 🚀 Quick Start

### Prerequisites

- Bash 4.0+
- Linux/macOS/WSL

### Installation

```bash
git clone https://github.com/muhammedmtk/simple-dbms-bash.git
cd simple-dbms-bash
chmod +x run.sh db_main.sh db_tables.sh
```

### Run the Program

```bash
./run.sh
```

## 📖 Usage Guide

### Main Menu

```
==== main menu database ====
1) Create Database
2) List Database
3) Connect to Database
4) Drop Database
5) Exit
```

### Database Menu (After Connecting)

```
==== Database: mydb ====
1) Create Table
2) List Tables
3) Drop Table
4) Insert into Table
5) Select From Table
6) Delete From Table
7) Update Table
8) Back
```

### Example Workflow

1. **Create a database:**
   - Choose `1` → Enter database name: `students`

2. **Connect to database:**
   - Choose `3` → Enter name: `students`

3. **Create a table:**
   - Choose `1` → Enter table name: `class`
   - Enter columns: `id,name,age,grade`

4. **Insert data:**
   - Choose `4` → Enter table: `class`
   - Enter values: `1,Ahmed,20,A`

5. **View data:**
   - Choose `5` → Enter table: `class`
   - Displays all rows with columns

## 📁 Project Structure

```
simple-dbms-bash/
├── run.sh              # Main entry point
├── db_main.sh          # Database management functions
├── db_tables.sh        # Table and row operations
├── README.md           # This file
└── db_data/            # Data storage (auto-created)
    └── [databases]/    # Database folders
        └── [tables].data  # Table files
```

## 🛠️ How It Works

- **Databases** are stored as directories in `db_data/`
- **Tables** are stored as `.data` files within database directories
- **Columns** are stored in the first line of each table file (comma-separated)
- **Rows** are stored as comma-separated values on subsequent lines
- **Row numbers** are used for update and delete operations

### Example Table File (`db_data/students/class.data`)

```
id,name,age,grade
1,Ahmed,20,A
2,Fatima,19,B
3,Hassan,21,A+
```

## 📝 Notes

- Data validation ensures insert operations match column count
- Row numbering starts at 1 (header is hidden)
- All operations require pressing Enter to continue
- Use `5` or `8` to navigate back through menus

## 🔮 Future Improvements

- WHERE clause filtering for select operations
- Data type validation
- Backup and restore functionality
- Query language support

## 📄 License

This is an educational project. Feel free to use and modify as needed.
