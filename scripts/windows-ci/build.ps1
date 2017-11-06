Write-Host "Building"

cd $PSScriptRoot/../..

Invoke-Expression $PSScriptRoot/version

New-Item bin -ItemType Directory -Force
go build -o bin/scheduler.exe

cd $PSScriptRoot