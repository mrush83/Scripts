# Set the execution policy for the current process to Unrestricted, allowing the execution of scripts without any restrictions.
# This change applies only to the current script or session.
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force

# Check if Velociraptor is running
# Get the serial number using WMI
$serialNumber = Get-CimInstance Win32_BIOS | Select-Object -ExpandProperty SerialNumber

# Display the serial number
Write-Output $serialNumber 