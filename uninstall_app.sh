#!/bin/bash

# Uninstall App Script for macOS
# This script finds and deletes all related files of a specified app, with detailed feedback.

# Function to print a separator line
print_separator() {
    echo "------------------------------------------------------"
}

# Function to prompt the user for the app name
get_app_name() {
    echo "Enter the name of the app you want to uninstall (case-sensitive): "
    read APP_NAME
    if [ -z "$APP_NAME" ]; then
        echo "No app name entered. Exiting."
        exit 1
    fi
}

# Function to confirm with the user before proceeding
confirm_uninstallation() {
    echo "You have entered: $APP_NAME"
    echo "Are you sure you want to uninstall $APP_NAME and delete all its related files? (y/n): "
    read CONFIRM
    if [[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]]; then
        echo "Uninstallation canceled."
        exit 1
    fi
}

# Function to search and delete files in specified directories
delete_related_files() {
    local DIR=$1
    local APP_NAME=$2

    # Find and delete files, while providing feedback
    find "$DIR" -name "*$APP_NAME*" -print -exec rm -rf {} + 2>/dev/null | while read -r FILE; do
        echo "Deleted: $FILE"
    done
}

# Function to search common directories for related files
uninstall_app() {
    print_separator
    echo "Searching and deleting files related to $APP_NAME..."

    # Define an array of directories to search for related files
    declare -a DIRS=(
        "$HOME/Library/Application Support"
        "$HOME/Library/Caches"
        "$HOME/Library/Preferences"
        "$HOME/Library/Logs"
        "$HOME/Library/Containers"
        "$HOME/Library/Saved Application State"
        "/Library/LaunchAgents"
        "/Library/LaunchDaemons"
        "/Library/Extensions"
    )

    # Loop through directories and delete related files
    for DIR in "${DIRS[@]}"; do
        if [ -d "$DIR" ]; then
            echo "Checking in $DIR..."
            delete_related_files "$DIR" "$APP_NAME"
        fi
    done

    # Delete the app from the Applications folder if it exists
    if [ -d "/Applications/$APP_NAME.app" ]; then
        echo "Deleting $APP_NAME.app from the Applications folder..."
        rm -rf "/Applications/$APP_NAME.app"
        echo "Deleted: /Applications/$APP_NAME.app"
    else
        echo "$APP_NAME.app not found in the Applications folder."
    fi

    print_separator
    echo "Uninstallation complete. All related files should be removed."
}

# Function to display help information
display_help() {
    echo "Usage: ./uninstall_app.sh"
    echo
    echo "This script helps you to uninstall a specified app and delete all its related files."
    echo "You will be prompted to enter the app's name and confirm the uninstallation."
    echo
}

# Main script execution
print_separator
echo "Welcome to the Uninstall App Script for macOS!"
print_separator

# Display help if needed
if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    display_help
    exit 0
fi

# Get the app name and confirm uninstallation
get_app_name
confirm_uninstallation

# Proceed with uninstallation
uninstall_app
