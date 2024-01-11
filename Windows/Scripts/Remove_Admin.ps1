$admin=(Get-WMIObject -Classname Win32_ComputerSystem).Username
Remove-LocalGroupMember -Group "Administrators" -Member $admin

if ($LASTEXITCODE -ne 0)
{
    Write-Host "The previous command failed with exit code $LASTEXITCODE."
    exit 0
}

exit 0