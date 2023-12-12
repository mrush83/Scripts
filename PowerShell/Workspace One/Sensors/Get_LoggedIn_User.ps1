# Description: Return current logged in user

# Set the execution policy for the current process to Unrestricted, allowing the execution of scripts without any restrictions.
# This change applies only to the current script or session.
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force

# Use -ErrorAction SilentlyContinue to ignore errors
$ErrorActionPreference = "SilentlyContinue"

$domainuser = Get-WmiObject -Class "Win32_ComputerSystem" | select username
$user = ($domainuser.username).Substring($domainuser.username.IndexOf('\')+1)

$user
