Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force

$proxySettings = Get-ItemProperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings'

if ($proxySettings.ProxyEnable -eq 1) {
    Write-Host "Proxy Enabled: $($proxySettings.ProxyEnable)"
    Write-Output "Proxy Server: $($proxySettings.ProxyServer)"
} else {
    Write-Output "Proxy NOT in use"
}