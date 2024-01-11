# Description: Returns Java Version e.g. 8.0.1910.12

# Set the execution policy for the current process to Unrestricted, allowing the execution of scripts without any restrictions.
# This change applies only to the current script or session.
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force

try {
    $javaVersions = Get-CimInstance -Query "SELECT * FROM Win32_Product WHERE Name LIKE 'Java%'"

    if ($javaVersions.Count -gt 0) {
        #$javaver = $javaVersions[0].Version
        $javaver = "True"
    } else {
        $javaver = "False"
    }
} catch {
    $javaver = "False"
}

cls
$javaver.ToString()