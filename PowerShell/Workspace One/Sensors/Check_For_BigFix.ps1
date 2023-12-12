# Set the execution policy for the current process to Unrestricted, allowing the execution of scripts without any restrictions.
# This change applies only to the current script or session.
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force

# Check if BESClient is running

$serviceName = "BESClient"

# Get the status of the service
$serviceStatus = Get-Service -Name $serviceName -ErrorAction SilentlyContinue

# Check if the service exists and is running
if ($serviceStatus -ne $null -and $serviceStatus.Status -eq "Running") {
    #Write-Output "BESClient is running."
    $result = $true
} else {
    #Write-Output "BESClient is not running."
    $result = $false
}

# Return the result
Write-Output $result
