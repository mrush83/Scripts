# Set the execution policy for the current process to Unrestricted, allowing the execution of scripts without any restrictions.
# This change applies only to the current script or session.
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force

# Clear the console and provide a brief pause for visibility
Clear-Host

$pendingReboot = $false  # Initialize to false

# If any of the specified registry keys indicate a pending reboot, set $pendingReboot to true and notify the user
$pendingRebootKeys = @{
    'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing' = 'Component Based Servicing';
    'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update' = 'Auto Update';
    'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager' = 'Session Manager'
}  

# Iterate through each registry key path to check for pending reboots
foreach ($keyName in $pendingRebootKeys.Keys) {
    $keyPath = $pendingRebootKeys[$keyName]

    if (Test-Path $keyPath) {
        $pendingReboot = $true  # Set to true if the specified registry key exists
        Write-Output "Pending reboot detected in registry key: $keyName ($($pendingRebootKeys[$keyName]))"
        Get-ItemProperty -Path $keyPath -Name PendingFileRenameOperations -ErrorAction SilentlyContinue
    }
}

# Sets $pendingReboot to true for code testing. Disabled in production.
# $pendingReboot = $true

# Check Pending Reboot Status
if ($pendingReboot) {
    # Console output for testing. Disabled in production
    #Write-Output "`nPending Reboots Detected, system reboot required."
    #Write-Output "WARNING: The computer will shut down in 60 seconds. Save your work!"

    # Display a custom warning dialog
    [System.Windows.Forms.MessageBox]::Show("WARNING: The computer will restart in 60 seconds. Save your work!", "Restart Warning", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)

    # Delay for 60 seconds (uncomment if you want to enable)
    #Start-Sleep -Seconds 60

    # Initiate the shutdown (uncomment if you want to enable)
    #Stop-Computer -Restart -Force
} else {
    Write-Output "No pending reboot detected."
}

# Return the status for use in further scripts or actions
# $pendingReboot
