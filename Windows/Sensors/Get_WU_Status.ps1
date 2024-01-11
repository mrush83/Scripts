# Set the execution policy for the current process to Unrestricted, allowing the execution of scripts without any restrictions.
# This change applies only to the current script or session.
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force

$testnet = Test-NetConnection -ComputerName www.catalog.update.microsoft.com -CommonTCPPort HTTP
if($testnet.TcpTestSucceeded -eq "True"){}Else{return "No Connection"}

$Session = New-Object -ComObject Microsoft.Update.Session
$UpdateSearcher = $Session.CreateUpdateSearcher()
$UpdateHistory = $UpdateSearcher.QueryHistory(0,100)

$Criteria = "IsHidden=0 and IsInstalled=0 and IsAssigned=1"
$SearchResult = $UpdateSearcher.Search($Criteria).Updates

$Sysinfo = New-Object -ComObject Microsoft.Update.SystemInfo
$pending = $Sysinfo.RebootRequired

$status = 0
if ($SearchResult.Count -ne 0) {
  $status = "Out-of-Date"
  foreach ($newupd in $SearchResult) {
    $UpdateID = $newupd.Identity.UpdateID
    $updhistoryitem = $UpdateHistory | Where-Object {$_.UpdateIdentity.UpdateID -match $UpdateID}
    if($updhistoryitem){
      if($updhistoryitem.ResultCode -eq 4) {$status = 4}
    }
  }
}

if($pending -eq $true){return "Pending Reboot"}
elseif($status -eq 4){return "Update-Failed"}
elseif($status -ne 0){return "Out-of-Date"}
elseif($status -eq 0){return "Up-to-Date"}
else{return "No Status"}