# Set the execution policy for the current process to Unrestricted, allowing the execution of scripts without any restrictions.
# This change applies only to the current script or session.
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force

# Registry path for processor information
$registryPath = 'HKLM:\HARDWARE\DESCRIPTION\System\CentralProcessor\0'

# Retrieve the ProcessorNameString from the registry
$processorModel = Get-ItemProperty -Path $registryPath -Name ProcessorNameString

if ($processorModel -ne $null) {
    $processorName = $processorModel.ProcessorNameString

    if ($processorName -match 'Intel') {
        $processorName = $processorName -replace '.*i(\d+-\d+[^\w]*\w).*', 'i$1'
    } elseif ($processorName -match 'AMD') {
        $processorName = $processorName -replace '.*AMD\s+(\w+\s*\d+[^\w]*\w*).*', '$1'
    }

    Write-Output $processorName
} else {
    Write-Output "Failed to retrieve processor model from the registry."
}