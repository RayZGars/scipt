write-Host "Starting thanks for using the script"

write-Host "G120-Script"  


if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Output "You must run powershell -File C:/Users/yourusername/script.ps1 as an admin opening windows powershell as a admin"
    Start-Process -Verb runas -FilePath powershell.exe -ArgumentList "iwr -useb https://raw.githubusercontent.com/RayZGars/scipt/main/script.ps1 | iex"

   break
}

write-Host "Setting high peformance"

powercfg.exe -SETACTIVE 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

write-Host "Removing bloatware" 

# Packages

Get-AppxPackage -name “Microsoft.ZuneMusic” | Remove-AppxPackage
Get-AppxPackage -name “Microsoft.Music.Preview” | Remove-AppxPackage

Get-AppxPackage -name “Microsoft.XboxIdentityProvider” | Remove-AppxPackage
Get-AppxPackage -name "Clipchamp" | Remove-AppxPackage
Get-AppxPackage -name “Microsoft.BingTravel” | Remove-AppxPackage

Get-AppxPackage -name “Microsoft.BingHealthAndFitness” | Remove-AppxPackage

Get-AppxPackage -name “Microsoft.BingFoodAndDrink” | Remove-AppxPackage

Get-AppxPackage -name “Microsoft.People” | Remove-AppxPackage

Get-AppxPackage -name “Microsoft.BingFinance” | Remove-AppxPackage

Get-AppxPackage -name “Microsoft.3DBuilder” | Remove-AppxPackage

Get-AppxPackage -name “Microsoft.WindowsCalculator” | Remove-AppxPackage

Get-AppxPackage -name “Microsoft.BingNews” | Remove-AppxPackage

Get-AppxPackage -name “Microsoft.XboxApp” | Remove-AppxPackage

Get-AppxPackage -name “Microsoft.BingSports” | Remove-AppxPackage

Get-AppxPackage -name “Microsoft.WindowsCamera” | Remove-AppxPackage

Get-AppxPackage -name “Microsoft.Getstarted” | Remove-AppxPackage

Get-AppxPackage -name “Microsoft.Office.OneNote” | Remove-AppxPackage

Get-AppxPackage -name “Microsoft.WindowsMaps” | Remove-AppxPackage

Get-AppxPackage -name “Microsoft.MicrosoftSolitaireCollection” | Remove-AppxPackage

Get-AppxPackage -name “Microsoft.MicrosoftOfficeHub” | Remove-AppxPackage

Get-AppxPackage -name “Microsoft.BingWeather” | Remove-AppxPackage

Get-AppxPackage -name “Microsoft.BioEnrollment” | Remove-AppxPackage

Get-AppxPackage -name “Microsoft.Windows.Photos” | Remove-AppxPackage

Get-AppxPackage -name “Microsoft.WindowsPhone” | Remove-AppxPackage

write-Host "Changing some settings"
Get-Process -Name svchost.exe,wininit.exe,lsass.exe | Stop-Process
write-Host "Stopped unnsecarry serveices"
Set-ComputerProperty -Name TotalSwapFileSpace -Value 2048
write-Host "Made Virtual RAM higher"
Clean-Mgr
write-Host "Cleaned temp folder"
Defrag-Volume C: -Verbose
write-Host "Make your C: drive faster"
Powercfg -HighPerformance
write-Host "Set peformance to high"
Get-AppxPackage -AllUsers | Remove-AppxPackage -AllUsers
write-Host "Removed unnecessary apps and services"
Get-ScheduledTask | Where-Object {$_.TaskPath -like "*\Startup\*"} | Disable-ScheduledTask
write-Host "Disabled startup apps"

Disable-Service Superfetch
write-Host "Disabled Superfetch freed up system resources"
Get-Process | Where-Object {$_.CPU -gt 5} | Set-Priority BelowNormal
write-Host "Made unnecessary processes priority Low"
Get-Process | Where-Object {$_.CPU -gt 10} | Stop-Process
write-Host "Stopped unnecessary procceses"
Clear-StandbyList




cmd /c pause


