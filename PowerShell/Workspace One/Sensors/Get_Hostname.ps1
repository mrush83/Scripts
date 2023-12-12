# Set the execution policy for the current process to Unrestricted, allowing the execution of scripts without any restrictions.
# This change applies only to the current script or session.
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force

# When creating a 'Sensor' Dashboard in Workspace One the ability to see the hostname is not available.
# We will create a sensor to grab the hostname so we can see it on the dashboard.
Write-Output $env:COMPUTERNAME
