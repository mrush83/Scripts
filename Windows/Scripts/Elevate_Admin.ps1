Set-ExecutionPolicy Unrestricted -Scope Process -Force
# New script from WS1 support
$currentUserName = (Get-WmiObject -Class "Win32_ComputerSystem").Username
$isAlreadyAdmin= (Get-LocalGroupMember -Group "Administrators" | Where-Object {$_.Name -eq $currentUserName}).Count -ne 0
if($isAlreadyAdmin -eq $false)
{
	Add-LocalGroupMember -Group "Administrators" -Member $currentUserName
    Write-Output $currentUserName "added as admin"
}
write-output "Is already admin:"$isAlreadyAdmin
if ($LASTEXITCODE -ne 0)
{
	Write-Host "The previous command failed with exit code $LASTEXITCODE."
    exit 0
}
exit 0