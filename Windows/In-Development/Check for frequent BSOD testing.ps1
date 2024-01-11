Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force

# Define variables
$computerName = $env:COMPUTERNAME
$eventLogName = 'System'
$eventType = 41  # Event ID for unexpected shutdown (blue screen)

# Get recent events from the System log
$events = Get-WinEvent -ComputerName $computerName -LogName $eventLogName -MaxEvents 100 | Where-Object { $_.Id -eq $eventType }

# Check if the number of events exceeds a threshold (e.g., 3)
$threshold = 3

if ($events.Count -ge $threshold) {
    Write-Host "Warning: The system has experienced $($events.Count) blue screen events in the recent log entries."
    Write-Host "Please investigate the cause of these events."
} else {
    Write-Host "No frequent blue screen events detected in the recent log entries."
}