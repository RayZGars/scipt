write-Host "Starting"

winget install -e --id Mozilla.Firefox

write-Host "Done installing "

write-Host "Setting high peformance"

powercfg.exe -SETACTIVE 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c



write-Host "Worked"

