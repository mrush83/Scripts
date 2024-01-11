# Description: Returns the last date and time that the device failed the OMA-DM sync.
# Execution Context: SYSTEM
# Return Type: OBJECT or STRING

# Set the execution policy for the current process to Unrestricted, allowing the execution of scripts without any restrictions.
# This change applies only to the current script or session.
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force

# Clear the console and provide a brief pause for visibility
Clear-Host

# Specify the registry key path
$registryPath = "HKLM:\SOFTWARE\Microsoft\Provisioning\OMADM\Accounts\"

# Check if the registry key exists
if (Test-Path $registryPath) {
    try {
        # Get the registry key
        $registryKey = Get-Item -LiteralPath $registryPath

        # Check if any subkeys were found
        if ($registryKey.SubKeyCount -eq 0) {
            Write-Output "MDM not installed or not running properly"
        }

        # Iterate through each subkey
        foreach ($subkeyName in $registryKey.GetSubKeyNames()) {
            $subkeyPath = Join-Path -Path $registryPath -ChildPath $subkeyName
            $subkeyPath = Join-Path -Path $subkeyPath -ChildPath 'Protected\ConnInfo'

            # Get the values for the specified registry entries
            $serverLastFailureTime = (Get-ItemProperty -LiteralPath $subkeyPath -Name ServerLastFailureTime -ErrorAction SilentlyContinue).ServerLastFailureTime
            $serverLastSuccessTime = (Get-ItemProperty -LiteralPath $subkeyPath -Name ServerLastSuccessTime -ErrorAction SilentlyContinue).ServerLastSuccessTime
            $serverLastAccessTime = (Get-ItemProperty -LiteralPath $subkeyPath -Name ServerLastAccessTime -ErrorAction SilentlyContinue).ServerLastAccessTime

            # Display the values only if they exist
            if ($serverLastFailureTime -ne $null -or $serverLastSuccessTime -ne $null -or $serverLastAccessTime -ne $null) {
                # Convert and display ServerLastFailureTime
                if ($serverLastFailureTime -ne $null) {
                    $dateObject = [DateTime]::ParseExact($serverLastFailureTime, "yyyyMMddTHHmmssZ", [System.Globalization.CultureInfo]::InvariantCulture)
                    $formattedDate = $dateObject.ToString("yyyy-MM-dd HH:mm:ss")
                    Write-Host "ServerLastFailureTime: $formattedDate"
                }

                # Convert and display ServerLastSuccessTime
                if ($serverLastSuccessTime -ne $null) {
                    $dateObject = [DateTime]::ParseExact($serverLastSuccessTime, "yyyyMMddTHHmmssZ", [System.Globalization.CultureInfo]::InvariantCulture)
                    $formattedDate = $dateObject.ToString("yyyy-MM-dd HH:mm:ss")
                    Write-Host "ServerLastSuccessTime: $formattedDate"
                }

                # Convert and display ServerLastAccessTime
                if ($serverLastAccessTime -ne $null) {
                    $dateObject = [DateTime]::ParseExact($serverLastAccessTime, "yyyyMMddTHHmmssZ", [System.Globalization.CultureInfo]::InvariantCulture)
                    $formattedDate = $dateObject.ToString("yyyy-MM-dd HH:mm:ss")
                    Write-Host "ServerLastAccessTime: $formattedDate"
                }
            }
        }
    } catch {
        Write-Host "Error: $_"
    }
} else {
    Write-Host "Registry key does not exist: $registryPath"
}