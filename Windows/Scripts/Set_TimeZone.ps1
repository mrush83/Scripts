# Start set to 4 controls the behavior of the Windows Time Zone Auto-Update feature.
# Setting the value of Start to 3 disables the Windows Time Zone Auto-Update feature,
# which automatically updates the system's time zone based what time zone is set.
# When this feature is disabled, users are able to manually change and set their own time zone.
# By default, the value of Start is set to 4, which enables the Windows Time Zone Auto-Update feature.
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\tzautoupdate" -Name "Start" -Value 4 -ErrorAction SilentlyContinue

# Check for errors and display a message
if ($?) {
    Write-Host "Time zone auto update registry key updated successfully."
} else {
    Write-Host "An error occurred while updating time zone auto update registry key." -ForegroundColor Red
}

if ($LASTEXITCODE -ne 0)
{
    Write-Host "The previous command failed with exit code $LASTEXITCODE."
    exit 0
}

exit 0