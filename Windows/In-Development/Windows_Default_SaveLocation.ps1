# Set execution policy for the current session (may be needed in restrictive environments)
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force

# Get the username of the logged-in user
$userName = $env:USERNAME

# Specify the path to the Box Drive folder using the obtained username
$saveLocation = "C:\Users\$userName\Work"

# Check if the folder exists
if (-not (Test-Path -Path $saveLocation -PathType Container)) {
    # Create the folder if it doesn't exist
    New-Item -Path $saveLocation -ItemType Directory -Force
    #Write-Output "Folder created: $saveLocation"
}

# Change the default save location for documents
[Microsoft.Win32.Registry]::SetValue('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders', 'Personal', $saveLocation)

# Output a message indicating the change
#Write-Output "Default save location changed to: $saveLocation"