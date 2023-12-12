# Set the execution policy for the current process to Unrestricted, allowing the execution of scripts without any restrictions.
# This change applies only to the current script or session.
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force

# Check if Velociraptor is running

$serviceName = "Velociraptor"

# Get the status of the service
$serviceStatus = Get-Service -Name $serviceName -ErrorAction SilentlyContinue

# Check if the service exists and is running
if ($serviceStatus -ne $null -and $serviceStatus.Status -eq "Running") {
    #Write-Output "Velociraptor is running."
    $result = $true
} else {
    #Write-Output "Velociraptor is not running."
    $result = $false
}

# Return the result
Write-Output $result
