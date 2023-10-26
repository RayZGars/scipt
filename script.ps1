write-Host "Starting thanks for using the script"

write-Host "  ██████╗  █████╗ ███╗   ███╗███████╗██████╗ "  


if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Output "You must run powershell -File C:/Users/yourusername/script.ps1 as an admin opening windows powershell as a admin"
    Start-Process -Verb runas -FilePath powershell.exe -ArgumentList "iwr -useb https://raw.githubusercontent.com/RayZGars/scipt/main/script.ps1 | iex"

   break
}

write-Host "Setting high peformance"

powercfg.exe -SETACTIVE 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

wirte-Host "Removing bloatware" 
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
  # Enable Clipboard History
  Set-ItemProperty "HKCU:\Software\Microsoft\Clipboard" -Name EnableClipboardHistory -Value 1

  # Mouse
  Set-ItemProperty "HKCU:\Control Panel\Mouse" -Name MouseSpeed -Value 0
  Set-ItemProperty "HKCU:\Control Panel\Mouse" -Name MouseSensitivity -Value 12

  # Enable Dark Mode
  Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name SystemUsesLightTheme -Value 0
  Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name AppsUseLightTheme -Value 0
# Cleaning help files
if (Test-Path $Env:programdata\*.lbool) {Remove-Item $Env:programdata\*.lbool}
if (Test-Path $Env:programdata\ET\*.lbool) {Remove-Item $Env:programdata\ET\*.lbool}
if (Test-Path $Env:programdata\*.lbool) {Remove-Item $Env:programdata\ET\*.lbool}
if (Test-Path $Env:programdata\ET\) {
}
else
{
    #Create directory if not exists
    New-Item $Env:programdata\ET\ -ItemType Directory
}
Write-Host ' [Setting] Turn Off Background Apps ' -F blue -B black
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled  /t REG_DWORD /d 1 /f | Out-Null
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v BackgroundAppGlobalToggle /t REG_DWORD /d 0 /f | Out-Null
engine;};


cmd /c pause


