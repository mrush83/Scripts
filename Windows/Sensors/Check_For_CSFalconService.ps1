# Set the execution policy for the current process to Unrestricted, allowing the execution of scripts without any restrictions.
# This change applies only to the current script or session.
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force

# Check if CSFalconService is running
$serviceName = "CSFalconService"

# Get the status of the service
$serviceStatus = Get-Service -Name $serviceName -ErrorAction SilentlyContinue

# Check if the service exists and is running
if ($serviceStatus -ne $null -and $serviceStatus.Status -eq "Running") {
    #Write-Output "CSFalconService is running."
    $result = $true
} else {
    #Write-Output "CSFalconService is not running."
    $result = $false
}

# Return the result
Write-Output $result