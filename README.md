# Uninstall App Script for macOS

This script helps you completely uninstall a specified app on macOS, including deleting all its related files from common system directories. The script searches for files associated with the app and removes them, providing detailed feedback throughout the process.

## Features

- Searches and deletes files related to the specified app in common macOS directories.
- Deletes the app from the "Applications" folder if it exists.
- Provides detailed feedback on the files being removed.
- Prompts for confirmation before proceeding to ensure safety.
- Modular structure for easy maintenance and extension.

## Prerequisites

- macOS (Apple Silicon or Intel)
- Bash (default on macOS)

## Steps to Run the Script

Follow these steps to use the uninstall script:

1. **Download the Script**

   Download the script file and save it as `uninstall_app.sh` in a convenient location, such as your home directory.

2. **Make the Script Executable**

   Open a Terminal window and navigate to the directory where the script is located. Make the script executable by running the following command:

   ```bash
   chmod +x uninstall_app.sh
   ```

3. **Run the Script**

   Execute the script with the following command:

   ```bash
   ./uninstall_app.sh
   ```

4. **Follow the Prompts**

   - You will be prompted to enter the name of the app you want to uninstall. This name is case-sensitive, so make sure to type it exactly as it appears.
   - Confirm the uninstallation when prompted to proceed with deleting the app and its related files.

5. **Optional: Display Help**

   You can display help information by running the script with the `--help` or `-h` option:

   ```bash
   ./uninstall_app.sh --help
   ```

## Important Notes

- **Caution:** The script will permanently delete files. Double-check the app name before confirming the uninstallation.
- **Manual Review:** While the script covers most common locations, some apps may have files in less common directories. It's a good idea to manually check for any leftover files after running the script.
- **System Integrity:** If the app installed any system extensions, use caution and ensure that deleting the related files will not affect the stability of your macOS.

## Troubleshooting

- If you encounter a "permission denied" error, try running the script with `sudo`:

   ```bash
   sudo ./uninstall_app.sh
   ```

- For any issues or bugs, please ensure you have the latest version of macOS and the script. If the problem persists, review the system logs for any relevant errors.

## Disclaimer

This script is provided "as is," without warranty of any kind. Use it at your own risk, and make sure you have a backup of important data before proceeding.
