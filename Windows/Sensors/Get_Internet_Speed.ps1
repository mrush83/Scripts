# Description: Returns internet download speed in MBps using IP-Toolbox 10Mb file. Larger file also available by swapping DownloadURL variable
# Execution Context: SYSTEM
# Execution Architecture: EITHER64OR32BIT
# Return Type: INTEGER

# Set the execution policy for the current process to Unrestricted, allowing the execution of scripts without any restrictions.
# This change applies only to the current script or session.
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force

$DownloadURL = "https://proof.ovh.net/files/10Mb.dat"
$downloadsize = 100
$TempFile = Join-Path -Path $env:TEMP -ChildPath '10Mb.dat'
$WebClient = New-Object Net.WebClient
$TimeTaken = Measure-Command { $WebClient.DownloadFile($DownloadURL, $TempFile) } | Select-Object -ExpandProperty TotalSeconds
$SpeedMbps = [math]::Round(($downloadsize / $TimeTaken) * 8)

#Write-Output $TempFile
Remove-Item $TempFile -Force

#Write-Output $downloadsize
#Write-Output $TimeTaken
"$SpeedMbps Mbps"