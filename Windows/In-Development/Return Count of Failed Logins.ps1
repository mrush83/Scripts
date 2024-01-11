# Description: Returns the number of instances of Failed Logins (4625) found in Security Event Log
# Execution Context: SYSTEM
# Execution Architecture: EITHER64OR32BIT
# Return Type: INTEGER
# V@riables: Log,Security; Id,4625
# future add ability to use variable to specify the log and event id to return

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force


#Variables to modify
$StartTime = (Get-Date).AddDays(-7) #1 day prior to now
$EndTime = Get-Date
$Log = 'Security'
$Id = '4625'

$filterTable = @{'StartTime' = $StartTime
'EndTime' = $EndTime
'LogName' = $Log
'Id' = $Id
}
$Events = Get-WinEvent -FilterHashTable $filterTable -ea 'SilentlyContinue'

if($Events){return $Events.count}else{return 0}