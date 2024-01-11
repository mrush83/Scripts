# Set the execution policy for the current process to Unrestricted, allowing the execution of scripts without any restrictions.
# This change applies only to the current script or session.
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force

# Function to search for the display name and return the DisplayVersion
function Get-DisplayVersion {
    param (
        [string]$displayName
    )

    # 32-bit registry path
    $registryPath32 = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\"

    # 64-bit registry path
    $registryPath64 = "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\"

    # Search for the display name in the 32-bit registry
    $key32 = Get-Item "$registryPath32*"
    $foundKey32 = $key32 | Get-ItemProperty | Where-Object { $_.DisplayName -eq $displayName }

    # Search for the display name in the 64-bit registry
    $key64 = Get-Item "$registryPath64*"
    $foundKey64 = $key64 | Get-ItemProperty | Where-Object { $_.DisplayName -eq $displayName }

    # If found, return the DisplayVersion
    if ($foundKey32 -ne $null) {
        return $foundKey32.DisplayVersion
    } elseif ($foundKey64 -ne $null) {
        return $foundKey64.DisplayVersion
    } else {
        #return "BigFix Client not found in the registry."
        Write-Output "BigFix Missing/Version Not Found"
    }
}

# Specify the display name to search for
$displayNameToSearch = "BigFix Client"

# Get and display the DisplayVersion
$displayVersion = Get-DisplayVersion -displayName $displayNameToSearch
Write-Output $displayVersion