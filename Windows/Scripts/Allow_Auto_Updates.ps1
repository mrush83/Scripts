$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\"

# Check if the registry key exists
if (Test-Path -Path $registryPath) {
    # Delete the registry key
    Remove-Item -Path $registryPath -Force -Recurse
    Write-Host "Registry key has been deleted."
} else {
    Write-Host "Registry key does not exist."
}