# Set the execution policy for the current process
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force

Get-AppxProvisionedPackage -Online | Where-Object { 
$_.DisplayName -like '*Clipchamp.Clipchamp*' -or
$_.DisplayName -like '*Microsoft.3DBuilder*' -or
$_.DisplayName -like '*Microsoft.Appconnector*' -or
$_.DisplayName -like '*Microsoft.BingFinance*' -or
$_.DisplayName -like '*Microsoft.BingNews*' -or
$_.DisplayName -like '*Microsoft.BingSports*' -or
$_.DisplayName -like '*Microsoft.BingTranslator*' -or
$_.DisplayName -like '*Microsoft.BingWeather*' -or
$_.DisplayName -like '*Microsoft.CommsPhone*' -or
$_.DisplayName -like '*Microsoft.ConnectivityStore*' -or
$_.DisplayName -like '*Microsoft.FreshPaint*' -or
$_.DisplayName -like '*Microsoft.GamingApp*' -or
$_.DisplayName -like '*Microsoft.GamingServices*' -or
$_.DisplayName -like '*Microsoft.GetHelp*' -or
$_.DisplayName -like '*Microsoft.Getstarted*' -or
$_.DisplayName -like '*Microsoft.MinecraftUWP*' -or
$_.DisplayName -like '*Microsoft.Microsoft3DViewer*' -or
$_.DisplayName -like '*Microsoft.MicrosoftOfficeHub*' -or
$_.DisplayName -like '*Microsoft.MicrosoftPowerBIForWindows*' -or
$_.DisplayName -like '*Microsoft.MicrosoftSolitaireCollection*' -or
$_.DisplayName -like '*Microsoft.MixedReality.Portal*' -or
$_.DisplayName -like '*Microsoft.NetworkSpeedTest*' -or
$_.DisplayName -like '*Microsoft.Office.OneNote*' -or
$_.DisplayName -like '*Microsoft.OneConnect*' -or
$_.DisplayName -like '*Microsoft.OneDriveSync*' -or
$_.DisplayName -like '*Microsoft.People*' -or
$_.DisplayName -like '*Microsoft.Print3D*' -or
$_.DisplayName -like '*Microsoft.ScreenSketch*' -or
$_.DisplayName -like '*Microsoft.SkypeApp*' -or
$_.DisplayName -like '*Microsoft.StorePurchaseApp*' -or
$_.DisplayName -like '*Teams*' -or
$_.DisplayName -like '*Microsoft.Todos*' -or
$_.DisplayName -like '*Microsoft.Wallet*' -or
$_.DisplayName -like '*Microsoft.WindowsAlarms*' -or
$_.DisplayName -like '*Microsoft.Windows.DevHome*' -or
$_.DisplayName -like '*Microsoft.WindowsFeedbackHub*' -or
$_.DisplayName -like '*Microsoft.WindowsMaps*' -or
$_.DisplayName -like '*Microsoft.WindowsPhone*' -or
$_.DisplayName -like '*Microsoft.WindowsReadingList*' -or
$_.DisplayName -like '*Microsoft.Xbox.TCUI*' -or
$_.DisplayName -like '*Microsoft.XboxApp*' -or
$_.DisplayName -like '*Microsoft.XboxGamingOverlay*' -or
$_.DisplayName -like '*Microsoft.XboxIdentityProvider*' -or
$_.DisplayName -like '*Microsoft.XboxSpeechToTextOverlay*' -or
$_.DisplayName -like '*Microsoft.YourPhone*' -or
$_.DisplayName -like '*Microsoft.ZuneMusic*' -or
$_.DisplayName -like '*Microsoft.ZuneVideo*' -or
$_.DisplayName -like '*MicrosoftWindows.Client.WebExperience*'
}