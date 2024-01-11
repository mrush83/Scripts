# Set the execution policy for the current process to Unrestricted, allowing the execution of scripts without any restrictions.
# This change applies only to the current script or session.
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force

# Attempt to get the version of CrowdStrike Windows Sensor
$package = Get-Package "CrowdStrike Windows Sensor*" -ErrorAction SilentlyContinue

# Check if the package was found
if ($package) {
    # If found, display the version
    $version = $package.version
    Write-Output "Version is: $version"
} else {
    # If not found, display an error message
    Write-Output "Version is: Null, Software not found"
}
