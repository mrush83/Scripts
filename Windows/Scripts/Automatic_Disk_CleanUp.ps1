# ==================================================================================================================
# Pre-Cleanup available disk space
# cmdlet to query Windows Management Instrumentation (WMI) to retrieve information about a logical disk drive
$driveInfo = Get-WmiObject -Query "SELECT * FROM Win32_LogicalDisk WHERE DriveType = 3 AND DeviceID = 'C:'"
$freeSpaceGB = [math]::Round($driveInfo.FreeSpace / 1GB, 2)
$pre_clean = ("Pre: " + $freeSpaceGB.ToString("F2") + " GB")
# ==================================================================================================================

# Define paths to folders with temporary files to delete
$foldersToDelete = @(
    "c:\windows\Temp",
    "$env:USERPROFILE\AppData\Local\Temp"
    # Optional folder cleanup 
    "$env:USERPROFILE\Downloads"
)

# Function to handle errors and display messages
function Handle-Error {
    param(
        [string]$message
    )
    #Write-Output "Error: $message" -ForegroundColor Red
}

# Empty the Recycle Bin
try {
    Clear-RecycleBin -Force -ErrorAction Stop
    #Write-Output "Recycle Bin cleared successfully."
} catch {
    Handle-Error "Failed to clear the Recycle Bin: $($_.Exception.Message)"
}

# Delete temporary files and folders
ForEach ($folder in $foldersToDelete) {
    if (Test-Path $folder -PathType Container) {
        try {
            #Write-Output "Deleting files in $folder..."
            Remove-Item -Path "$folder\*" -Force -Recurse -ErrorAction SilentlyContinue
            #Write-Output "Files in $folder deleted successfully."
        } catch {
            Handle-Error "Failed to delete files in $($folder): $($_.Exception.Message)"
        }
    } else {
        #Write-Output "Folder $($folder) not found. Skipping."
    }
}

# ==================================================================================================================
# Post-Cleanup available disk space
$driveInfo = Get-WmiObject -Query "SELECT * FROM Win32_LogicalDisk WHERE DriveType = 3 AND DeviceID = 'C:'"
$freeSpaceGB = [math]::Round($driveInfo.FreeSpace / 1GB, 2)
$post_clean = ("Post: " + $freeSpaceGB.ToString("F2") + " GB")
# ==================================================================================================================

Write-Output ($pre_clean + "/" + $post_clean)