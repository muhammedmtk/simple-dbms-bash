#!/usr/bin/env bash

main_menu()
{
while true; do
clear 
echo "====main menu for dbms===="
echo "1) Create Database"
echo "2) List Database"
echo "3) Exit"
echo
read -p "Choose an option: " choice

case "$choice" in
1)
echo "Creating database"; read -p "please enter...";;
2)
echo ""; read -p "please enter...";;
3)
echo "Bye"; exit 0;;
*)echo "Invalid choice"; sleep 1;;
esac
done 
}





