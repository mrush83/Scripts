# Set the execution policy for the current process to Unrestricted, allowing the execution of scripts without any restrictions.
# This change applies only to the current script or session.
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force

# Windows Battery Health Report
# Source: https://pastebin.com/4LRUea9g

$DesignCapacity = (Get-WmiObject -Class BatteryStaticData -Namespace ROOT\WMI).DesignedCapacity
# Write-Host "Design capacity: $DesignCapacity mAh"

$FullCharge = (Get-WmiObject -Class BatteryFullChargedCapacity -Namespace ROOT\WMI).FullChargedCapacity
# Write-Host "Full charge:`t $FullCharge mAh"

$BatteryHealth = ($FullCharge / $DesignCapacity) * 100
$BatteryHealth = [math]::Round($BatteryHealth)

#Write-Host "Battery health:`t $BatteryHealth%"

# Check if the battery health is greater than 40%
if ($BatteryHealth -gt 40) {
    Write-Output "Status_Good"
} else {
    Write-Output "Status_Bad"
}