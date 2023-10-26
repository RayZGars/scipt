write-Host "Starting thanks for using the script"

write-Host "                   ██████╗  █████╗ ███╗   ███╗███████╗██████╗                     " -ForegroundColor DarkCyan 
write-Host "                  ██╔════╝ ██╔══██╗████╗ ████║██╔════╝██╔══██╗                   " -ForegroundColor DarkCyan 
write-Host "                  ██║  ██╗ ███████║██╔████╔██║█████╗  ██████╔╝                   " -ForegroundColor DarkCyan 
write-Host "                  ██║  ╚██╗██╔══██║██║╚██╔╝██║██╔══╝  ██╔══██╗                  " -ForegroundColor DarkCyan 
write-Host "                  ╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗██║  ██║                 " -ForegroundColor DarkCyan 
write-Host "                   ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝                     " -ForegroundColor DarkCyan

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Output "You must run powershell -File C:/Users/yourusername/script.ps1 as an admin opening windows powershell as a admin"
    Start-Process -Verb runas -FilePath powershell.exe -ArgumentList "iwr -useb https://raw.githubusercontent.com/RayZGars/scipt/main/script.ps1 | iex"

   break
}

write-Host "Setting high peformance"

powercfg.exe -SETACTIVE 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

write-Host "Debloating removing pre-installed apps"

Get-AppxPackage *WindowsAlarms* | Remove-AppxPackage
Get-AppxPackage *AV1VideoExtension* | Remove-AppxPackage
Get-AppxPackage *Microsoft.549981C3F5F10* | Remove-AppxPackage
Get-AppxPackage *WindowsFeedbackHub* | Remove-AppxPackage
Get-AppxPackage *HEIFImageExtension* | Remove-AppxPackage
Get-AppxPackage *GetHelp* | Remove-AppxPackage
Get-AppxPackage *WindowsMaps* | Remove-AppxPackage
Get-AppxPackage *MicrosoftEdge* | Remove-AppxPackage
Get-AppxPackage *Todos* | Remove-AppxPackage
Get-AppxPackage *ZuneVideo* | Remove-AppxPackage
Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage
Get-AppxPackage *BingNews* | Remove-AppxPackage
Get-AppxPackage *OneDriveSync* | Remove-AppxPackage
Get-AppxPackage *Windows.Photos* | Remove-AppxPackage
Get-AppxPackage *SkypeApp* | Remove-AppxPackage
Get-AppxPackage *MicrosoftSolitaireCollection* | Remove-AppxPackage
Get-AppxPackage *SpotifyAB.SpotifyMusic* | Remove-AppxPackage
Get-AppxPackage *Teams* | Remove-AppxPackage
Get-AppxPackage *WindowsSoundRecorder* | Remove-AppxPackage
Get-AppxPackage *BingWeather* | Remove-AppxPackage
Get-AppxPackage *YourPhone* | Remove-AppxPackage



Function StartMenuTiles {
$key = Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CloudStore\Store\Cache\DefaultAccount\*start.tilegrid`$windows.data.curatedtilecollection.tilecollection\Current"
$data = $key.Data[0..25] + ([byte[]](202,50,0,226,44,1,1,0,0))
Set-ItemProperty -Path $key.PSPath -Name "Data" -Type Binary -Value $data
Stop-Process -Name "ShellExperienceHost" -Force -ErrorAction SilentlyContinue
}

cmd /c pause


