# Set the execution policy for the current process to Unrestricted, allowing the execution of scripts without any restrictions.
# This change applies only to the current script or session.
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force

# Check BitLocker encryption status
try {
    $encryptionStatus = Get-BitLockerVolume -MountPoint "C:" -ErrorAction Stop | Select-Object -ExpandProperty ProtectionStatus
    $errorStatus = $null
}
catch {
    $errorStatus = $_.Exception.Message
    $encryptionStatus = $null
}

# Check the encryption status and display the result
if ($encryptionStatus -eq "On") {
    $isEncrypted = $true
} else {
    $isEncrypted = $false
}

# Output the result
if ($errorStatus -ne $null) {
    Write-Output $errorStatus
} else {
    Write-Output $isEncrypted
}