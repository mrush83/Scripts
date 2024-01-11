# Set the execution policy for the current process
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force

# Display a message indicating the script's purpose
#Write-Output "Running WSUS / Update Fix Script"

# Stop BITS (Background Intelligent Transfer Service) and Windows Update services
net stop bits
net stop wuauserv

# Delete specific registry entries related to Windows Update
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v AccountDomainSid /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v PingID /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v SusClientId /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v SusClientIDValidation /f

# Remove the SoftwareDistribution folder, which stores temporary update files
Remove-Item "C:\WINDOWS\SoftwareDistribution" -Recurse -Force -ErrorAction SilentlyContinue

# Start BITS and Windows Update services
net start bits
net start wuauserv

# Trigger the Windows Update client to reset authorization and check for updates
wuauclt /resetauthorization /detectnow

# Use PowerShell to trigger the Windows Update client to check for updates
(New-Object -ComObject Microsoft.Update.AutoUpdate).DetectNow()