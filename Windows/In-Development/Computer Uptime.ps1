Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force

$uptime = Get-WmiObject Win32_OperatingSystem | Select-Object LastBootUpTime
$uptimeDuration = (Get-Date) - [System.Management.ManagementDateTimeConverter]::ToDateTime($uptime.LastBootUpTime)

Write-Host "System Uptime: $($uptimeDuration.Days) days, $($uptimeDuration.Hours) hours, $($uptimeDuration.Minutes) minutes"