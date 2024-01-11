# Set the execution policy for the current process to Unrestricted, allowing the execution of scripts without any restrictions.
# This change applies only to the current script or session.
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force

# Check the current status of Secure Boot
$secureBootStatus = Confirm-SecureBootUEFI
$secureBootStatus