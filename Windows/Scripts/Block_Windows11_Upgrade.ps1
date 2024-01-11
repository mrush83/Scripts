# This section of the script will check to see if the registry keys exsist.
# If any registry keys are missing the script will add them.

# This section of the script will check to see if the registry keys exist.
# If any registry keys are missing, the script will add them.

$key1 = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate"
$valueName1 = "DisableOSUpgrade"
$value1 = "0"

if (Test-Path $key1){
    Write-Host "The registry value $key1 exists."
} else{
    New-Item -Path $key1 -Force | Out-Null
} 

if (Test-Path "$key1\$valueName1"){
    Write-Host "The registry value $valueName1 exists in $key1."
} else{
    New-ItemProperty -Path $key1 -Name $valueName1 -Value $value1 -PropertyType DWord -Force | Out-Null
}

$key2 = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate"
$valueName2 = "ProductVersion"
$value2 = "Windows 10"

if (Test-Path $key2){
    Write-Host "The registry value $key2 exists."
} else{
    New-Item -Path $key2 -Force | Out-Null
} 

if (Test-Path "$key2\$valueName2"){
    Write-Host "The registry value $valueName2 exists in $key2."
} else{
    New-ItemProperty -Path $key2 -Name $valueName2 -Value $value2 -PropertyType String -Force | Out-Null
}

$key3 = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate"
$valueName3 = "DisableWindowsUpdateAccess"
$value3 = "0"

if (Test-Path $key3){
    Write-Host "The registry value $key3 exists."
} else{
    New-Item -Path $key3 -Force | Out-Null
} 

if (Test-Path "$key3\$valueName3"){
    Write-Host "The registry value $valueName3 exists in $key3."
} else{
    New-ItemProperty -Path $key3 -Name $valueName3 -Value $value3 -PropertyType DWord -Force | Out-Null
}

$key4 = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU"
$valueName4 = "NoAutoUpdate"
$value4 = "0"

if (Test-Path $key4){
    Write-Host "The registry value $key4 exists."
} else{
    New-Item -Path $key4 -Force | Out-Null
} 

if (Test-Path "$key4\$valueName4"){
    Write-Host "The registry value $valueName4 exists in $key4."
} else{
    New-ItemProperty -Path $key4 -Name $valueName4 -Value $value4 -PropertyType DWord -Force | Out-Null
}
# End registry key checks
##############################################################################################################

# Sets the regisrty values to allow OS upgrades
$registryPath1 = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate"
$valueName1 = "DisableOSUpgrade"
$value1 = "0"

# Sets the regisrty values to BLOCK Windows 11 OS upgrades
$registryPath2 = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate"
$valueName2 = "ProductVersion"
$value2 = "Windows 10"

# Sets the regisrty values to allow the use of Windows Updates
$registryPath3 = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate"
$valueName3 = "DisableWindowsUpdateAccess"
$value3 = "0"

# Sets the regisrty values to allow auto updates 
$registryPath4 = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU"
$valueName4 = "NoAutoUpdate"
$value4 = "0"

Set-ItemProperty -Path $registryPath1 -Name $valueName1 -Value $value1
Set-ItemProperty -Path $registryPath2 -Name $valueName2 -Value $value2
Set-ItemProperty -Path $registryPath3 -Name $valueName3 -Value $value3
Set-ItemProperty -Path $registryPath4 -Name $valueName4 -Value $value4

if ($LASTEXITCODE -ne 0)
{
    Write-Host "The previous command failed with exit code $LASTEXITCODE."
    exit 0
}

exit 0