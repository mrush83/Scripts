# Set the execution policy for the current process to Unrestricted, allowing the execution of scripts without any restrictions.
# This change applies only to the current script or session.
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force

$driveInfo = Get-WmiObject -Query "SELECT * FROM Win32_LogicalDisk WHERE DriveType = 3 AND DeviceID = 'C:'"
$freeSpaceGB = [math]::Round($driveInfo.FreeSpace / 1GB, 2)

if ($freeSpaceGB -ge 45) {
    Write-Output $true
} else {
    Write-Output $false
}