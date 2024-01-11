# Set the execution policy for the current process
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force

# Specify the list of app package names to check and remove
$appsToRemove = @(
    "*Clipchamp.Clipchamp*",
    "*Microsoft.3DBuilder*",
    "*Microsoft.Appconnector*",
    "*Microsoft.BingFinance*",
    "*Microsoft.BingNews*",
    "*Microsoft.BingSports*",
    "*Microsoft.BingTranslator*",
    "*Microsoft.BingWeather*",
    "*Microsoft.CommsPhone*",
    "*Microsoft.ConnectivityStore*",
    "*Microsoft.FreshPaint*",
    "*Microsoft.GamingApp*",
    "*Microsoft.GamingServices*",
    "*Microsoft.GetHelp*",
    "*Microsoft.Getstarted*",
    "*Microsoft.MinecraftUWP*",
    "*Microsoft.Microsoft3DViewer*",
    "*Microsoft.MicrosoftOfficeHub*",
    "*Microsoft.MicrosoftPowerBIForWindows*",
    "*Microsoft.MicrosoftSolitaireCollection*",
    "*Microsoft.MixedReality.Portal*",
    "*Microsoft.NetworkSpeedTest*",
    "*Microsoft.Office.OneNote*",
    "*Microsoft.OneConnect*",
    "*Microsoft.OneDriveSync*",
    "*Microsoft.People*",
    "*Microsoft.Print3D*",
    "*Microsoft.ScreenSketch*",
    "*Microsoft.SkypeApp*",
    "*Microsoft.StorePurchaseApp*",
    "*Teams*",
    "*Microsoft.Todos*",
    "*Microsoft.Wallet*",
    "*Microsoft.WindowsAlarms*",
    "*Microsoft.Windows.DevHome*",
    "*Microsoft.WindowsFeedbackHub*",
    "*Microsoft.WindowsMaps*",
    "*Microsoft.WindowsPhone*",
    "*Microsoft.WindowsReadingList*",
    "*Microsoft.Xbox.TCUI*",
    "*Microsoft.XboxApp*",
    "*Microsoft.XboxGamingOverlay*",
    "*Microsoft.XboxIdentityProvider*",
    "*Microsoft.XboxSpeechToTextOverlay*",
    "*Microsoft.YourPhone*",
    "*Microsoft.ZuneMusic*",
    "*Microsoft.ZuneVideo*",
    "*MicrosoftWindows.Client.WebExperience*"
)

# Specify the error array to store encountered errors
$errors = @()

# Loop through each app and attempt to remove it
foreach ($app in $appsToRemove) {
    $package = Get-AppxPackage -Name $app -ErrorAction SilentlyContinue
    $provisionedPackage = Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -like $app}

    if ($package -ne $null -or $provisionedPackage -ne $null) {
        try {
            Get-AppxPackage -Name $app | Remove-AppxPackage -ErrorAction Stop
            Write-Output "Successfully removed: $app"
        } catch {
            $errorDetails = "Error occurred while attempting to remove $($app): $_"
            Write-Output $errorDetails
            $errors += $errorDetails
        }
    } else {
        Write-Output "This application has already been removed: $app"
    }
}

# Output any errors encountered during the removal process
if ($errors.Count -gt 0) {
    Write-Output "Errors encountered during removal:"
    $errors | ForEach-Object { Write-Output $_ }
} else {
    Write-Output "Bloatware removed:"
    Write-Output "True"
}