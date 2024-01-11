cd\
Get-NetAdapterBinding -Name "*" -ComponentID ms_tcpip6
timeout /t 5
Disable-NetAdapterBinding -Name "*" -ComponentID ms_tcpip6
Get-NetAdapterBinding -Name "*" -ComponentID ms_tcpip6
timeout /t 5