$registryKeyPath = 'HKLM:\SYSTEM\CurrentControlSet\Services\Velociraptor'
$binaryPathValue = Get-ItemProperty -Path $registryKeyPath | Select-Object -ExpandProperty 'ImagePath'
if ($binaryPathValue -eq '"C:\Program Files\Velociraptor\Velociraptor.exe" service run') {
    # Do nothing, as the value is already set correctly
} else {
    $Value = '"C:\Program Files\Velociraptor\Velociraptor.exe" service run'
    Set-ItemProperty -Path $registryKeyPath -Name 'ImagePath' -Value $Value
    Restart-Service -Name Velociraptor -Force
}