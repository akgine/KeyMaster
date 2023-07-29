#!/bin/bash

# Configuration
PASSWORD_FILE=~/.passwords.gpg

cat << "EOF"
| | / /          |  \/  |         | |
| |/ /  ___ _   _| .  . | __ _ ___| |_ ___ _ __
|    \ / _ \ | | | |\/| |/ _` / __| __/ _ \ '__|
| |\  \  __/ |_| | |  | | (_| \__ \ ||  __/ |
\_| \_/\___|\__, \_|  |_/\__,_|___/\__\___|_|
             __/ |
            |___/   Created By : A.K.G,  N.B.A,   P5,   T.O.E
EOF

# Function to add a new password
add_password() {
    read -p "Enter the service/website name: " service
    read -s -p "Enter the password: " password
    echo "Adding password for $service..."
    echo "$service:$password" >> "$PASSWORD_FILE"
    echo "Password added successfully!"
}

# Function to retrieve a password
get_password() {
    read -p "Enter the service/website name: " service
    password=$(grep -e "^$service:" "$PASSWORD_FILE" | cut -d ':' -f 2)
    if [[ -n "$password" ]]; then
        echo "Password for $service: $password"
    else
        echo "Password not found for $service."
    fi
}

# Main menu
while true; do
    echo "Password Manager"
    echo "1. Add a new password"
    echo "2. Retrieve a password"
    echo "3. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            add_password
            ;;
        2)
            get_password
            ;;
        3)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
done
