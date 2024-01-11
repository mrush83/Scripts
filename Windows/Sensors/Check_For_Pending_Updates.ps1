# Set the execution policy for the current process to Unrestricted, allowing the execution of scripts without any restrictions.
# This change applies only to the current script or session.
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force

$session = New-Object -ComObject Microsoft.Update.Session
$searcher = $session.CreateUpdateSearcher()
$pendingUpdates = $searcher.Search("IsInstalled=0")

if ($pendingUpdates.Updates.Count -eq 0) {
    Write-Output "Windows is up to date."
} else {
    Write-Output "There are pending updates:"
    foreach ($update in $pendingUpdates.Updates) {
        Write-Output "$($update.Title)"
    }
}