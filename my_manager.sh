#!/bin/bash

# File Management System

# Function to display the menu
show_menu() {
    echo "File Management System"
    echo "1. List files and directories"
    echo "2. Create a new directory"
    echo "3. Create a new file"
    echo "4. Delete a file or directory"
    echo "5. Copy a file or directory"
    echo "6. Move a file or directory"
    echo "7. View file contents"
    echo "8. Search for a file or directory"
    echo "9. Change permissions"
    echo "10. Exit"
    echo -n "Enter your choice: "
}

# Function to list files and directories
list_files() {
    echo "Current directory contents:"
    ls -la
}

# Function to create a new directory
create_directory() {
    echo -n "Enter directory name: "
    read dirname
    mkdir "$dirname"
    echo "Directory '$dirname' created."
}

# Function to create a new file
create_file() {
    echo -n "Enter file name: "
    read filename
    touch "$filename"
    echo "File '$filename' created."
}

# Function to delete a file or directory
delete_item() {
    echo -n "Enter name of file or directory to delete: "
    read item
    if [ -e "$item" ]; then
        rm -ri "$item"
        echo "Item '$item' deleted."
    else
        echo "Item '$item' does not exist."
    fi
}

# Function to copy a file or directory
copy_item() {
    echo -n "Enter source name: "
    read source
    echo -n "Enter destination: "
    read destination
    if [ -e "$source" ]; then
        cp -ri "$source" "$destination"
        echo "Item '$source' copied to '$destination'."
    else
        echo "Source '$source' does not exist."
    fi
}

# Function to move a file or directory
move_item() {
    echo -n "Enter source name: "
    read source
    echo -n "Enter destination: "
    read destination
    if [ -e "$source" ]; then
        mv -i "$source" "$destination"
        echo "Item '$source' moved to '$destination'."
    else
        echo "Source '$source' does not exist."
    fi
}

# Function to view file contents
view_file() {
    echo -n "Enter file name to view: "
    read filename
    if [ -f "$filename" ]; then
        less "$filename"
    else
        echo "File '$filename' does not exist."
    fi
}

# Function to search for a file or directory
search_item() {
    echo -n "Enter search term: "
    read term
    echo "Search results:"
    find . -name "*$term*" 2>/dev/null
}

# Function to change permissions
change_permissions() {
    echo -n "Enter file or directory name: "
    read item
    if [ -e "$item" ]; then
        echo -n "Enter new permissions (e.g., 755): "
        read perms
        chmod "$perms" "$item"
        echo "Permissions for '$item' changed to '$perms'."
    else
        echo "Item '$item' does not exist."
    fi
}

# Main loop
while true; do
    show_menu
    read choice
    case $choice in
        1) list_files ;;
        2) create_directory ;;
        3) create_file ;;
        4) delete_item ;;
        5) copy_item ;;
        6) move_item ;;
        7) view_file ;;
        8) search_item ;;
        9) change_permissions ;;
        10) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid option. Please try again." ;;
    esac
    echo
done
