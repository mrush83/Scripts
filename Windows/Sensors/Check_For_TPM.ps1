# Set the execution policy for the current process to Unrestricted, allowing the execution of scripts without any restrictions.
# This change applies only to the current script or session.
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force

# Check if TPM 2.0 is enabled
$tpm = Get-WmiObject -Namespace "Root\CIMv2\Security\MicrosoftTpm" -Class Win32_Tpm

if ($tpm) {
    if ($tpm.SpecVersion -ge "2.0") {
        Write-Output "TPM 2.0 is enabled on this system."
    } else {
        Write-Output "TPM is present, but it's not version 2.0."
    }
} else {
    Write-Output "No TPM found on this system."
}