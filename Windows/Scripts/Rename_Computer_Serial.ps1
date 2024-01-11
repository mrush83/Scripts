$serial = (Get-WmiObject -Class Win32_BIOS).SerialNumber
$computerName = (Get-WmiObject -Class Win32_ComputerSystem).Name

# Check if script is running as administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
    # Restart script as administrator
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}

if($computerName -ne $serial)
{
  Rename-Computer -NewName $serial -Force
}

if ($LASTEXITCODE -ne 0) {
    Write-Host "The command failed, the new name is the same as the current name. Exit code $LASTEXITCODE."
    exit 0
}

exit 0