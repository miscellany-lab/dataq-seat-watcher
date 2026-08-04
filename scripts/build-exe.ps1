param(
    [switch]$Clean
)

$ErrorActionPreference = "Stop"
$ProjectRoot = Split-Path -Parent $PSScriptRoot
Set-Location $ProjectRoot

if ($Clean) {
    Remove-Item -Recurse -Force -ErrorAction SilentlyContinue build, dist
}

python -m PyInstaller dataq_seat_watcher.spec --noconfirm

$Exe = Join-Path $ProjectRoot "dist\DataQ Seat Watcher.exe"
if (-not (Test-Path $Exe)) {
    throw "Build completed but exe was not found: $Exe"
}

Write-Host "Built: $Exe"
