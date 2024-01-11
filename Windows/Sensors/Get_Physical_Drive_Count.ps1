# Set the execution policy for the current process to Unrestricted, allowing the execution of scripts without any restrictions.
# This change applies only to the current script or session.
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force

# Description: Returns the number of Physical Disks in the device, excluding network and removable drives
# Execution Context: SYSTEM
# Return Type: STRING

# Get all physical disks
$physicalDisks = Get-PhysicalDisk

# Filter out network and removable drives
$filteredDisks = $physicalDisks | Where-Object { 
    $driveType = (Get-WmiObject Win32_DiskDrive | Where-Object { $_.DeviceID -eq $_.PNPDeviceID }).MediaType
    $isLocalDisk = $_.OperationalStatus -eq 'OK' -and $driveType -ne 'External Hard Disk Media'
    
    if ($_.BusType -eq 'USB' -or $driveType -eq 'Removable Media' -or !$isLocalDisk) {
        $false
    } else {
        $true
    }
}

# Count the remaining physical disks
$diskCount = $filteredDisks.Count

if ($diskCount -gt 1) {
    Write-Output "True"
} else {
    Write-Output "False"
}