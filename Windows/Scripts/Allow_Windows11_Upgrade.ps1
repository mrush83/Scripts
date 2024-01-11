Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force
# Define the registry key to delete
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate"

# Check if the registry key exists
if (Test-Path -Path $registryPath) {
    # Delete the registry key and all its subkeys
    Remove-Item -Path $registryPath -Recurse
    Write-Host "Registry key and subkeys deleted successfully."
} else {
    Write-Host "Registry key not found. Nothing to delete."
}