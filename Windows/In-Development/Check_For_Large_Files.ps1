# Set the execution policy to allow script execution
Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned -Force

# Get the current username if needed
$currentUsername = $env:USERNAME

# Define the path variable
#$targetPath = "C:\Users\$currentUsername\Downloads" # Sample file path
$targetPath = "C:\"

# Define the file size threshold variable
$fileSizeThreshold = 1GB

# Initialize an array to store errors
$errors = @()

# Initialize variables to track total count and size
$totalCount = 0
$totalSize = 0

# Attempt to get files larger than the specified threshold, capturing non-terminating errors
try {
    $largeFiles = Get-ChildItem -Path $targetPath -Recurse -ErrorAction Continue -ErrorVariable nonTerminatingErrors |
        Where-Object { $_.Length -gt $fileSizeThreshold } |
        ForEach-Object {
            # Increment total count
            $totalCount++
            # Increment total size
            $totalSize += $_.Length
            # Output selected file information
            $_ | Select-Object @{Name='FileName';Expression={$_.Name}},
                               @{Name='Location';Expression={$_.FullName}},
                               @{Name='Size (GB)';Expression={$_.Length / $fileSizeThreshold -as [int]}}
        }
    # Add non-terminating errors to the $errors array
    $errors += $nonTerminatingErrors
}
catch {
    # If a terminating error occurs, capture it and add to the errors array
    $errors += $_
}

# Output the list of files larger than the specified threshold with filename, location, and size
$largeFiles | Format-Table -AutoSize

# Output total count and size
Write-Output "`nTotal Count of Large Files: $totalCount"
Write-Output "Total Size of Large Files: $($totalSize / 1GB -as [int]) GB"

# Output any errors that occurred during the process
if ($errors.Count -gt 0) {
    Write-Output "`nErrors:`n"
    $errors | ForEach-Object { Write-Output $_.Exception.Message }
}

# Clear variables if needed
Clear-Variable -Name largeFiles, errors, nonTerminatingErrors, currentUsername, targetPath, fileSizeThreshold, totalCount, totalSize
