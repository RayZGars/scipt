write-Host "Starting thanks for using the script"

write-Host "  ██████╗  █████╗ ███╗   ███╗███████╗██████╗ "  


if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Output "You must run powershell -File C:/Users/yourusername/script.ps1 as an admin opening windows powershell as a admin"
    Start-Process -Verb runas -FilePath powershell.exe -ArgumentList "iwr -useb https://raw.githubusercontent.com/RayZGars/scipt/main/script.ps1 | iex"

   break
}

write-Host "Setting high peformance"

powercfg.exe -SETACTIVE 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

write-Host "Removing bloatware" 
 # Packages
  foreach ($package in @(
      "*Microsoft.BingNews*"
      "*Microsoft.BingWeather*"
      "*Microsoft.GamingApp*"
     "*Microsoft.OneDrive*"
           "*Microsoft.Maps*"
      "*Microsoft.Getstarted*"
      "*Microsoft.MicrosoftOfficeHub*"
      "*Microsoft.MicrosoftSolitaireCollection*"
      "*Microsoft.MicrosoftStickyNotes*"
      "*Microsoft.PowerAutomateDesktop*"
      "*Microsoft.Todos*"
      "*microsoft.windowscommunicationsapps*"
      "*Microsoft.WindowsFeedbackHub*"
      "*Microsoft.WindowsSoundRecorder*"
      "*Microsoft.Xbox.TCUI*"
      "*Microsoft.ZuneMusic*"
      "*Microsoft.ZuneVideo*"
      "*MicrosoftTeams*"

      "*MicrosoftWindows.Client.WebExperience*"
      "*Microsoft.GetHelp*"
    )) {
    Get-AppxPackage -AllUsers $package | Remove-AppxPackage
    Get-AppxProvisionedPackage -Online | Where-Object { $_.PackageName -Like $package } | ForEach-Object {
      Remove-AppxProvisionedPackage -Online -PackageName $_.PackageName
    } | Out-Null
  }
write-Host "Setting up Preference"



cmd /c pause


