param(
    [Parameter(Mandatory = $true)]
    [string]$BuildDirectory,
    [string]$Version = "v0.1.0-playtest"
)

$ErrorActionPreference = 'Stop'
$repo = Split-Path -Parent $PSScriptRoot
$stage = Join-Path $repo "dist\LegaiaRecomp-$Version"
$zip = Join-Path $repo "dist\LegaiaRecomp-windows-x64-$Version.zip"

if (-not (Test-Path (Join-Path $BuildDirectory 'LegaiaRecomp.exe'))) {
    throw "LegaiaRecomp.exe was not found in $BuildDirectory"
}
if (-not (Test-Path (Join-Path $BuildDirectory 'SDL2.dll'))) {
    throw "SDL2.dll was not found in $BuildDirectory"
}

Remove-Item -Recurse -Force $stage -ErrorAction SilentlyContinue
Remove-Item -Force $zip -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Force -Path $stage, (Join-Path $stage 'bios'), (Join-Path $stage 'disc'), (Join-Path $stage 'game'), (Join-Path $stage 'saves') | Out-Null

Copy-Item (Join-Path $BuildDirectory 'LegaiaRecomp.exe') $stage
Copy-Item (Join-Path $BuildDirectory 'SDL2.dll') $stage
Copy-Item (Join-Path $repo 'README.md'), (Join-Path $repo 'game.toml'), (Join-Path $repo 'Run LegaiaRecomp.bat') $stage
Copy-Item (Join-Path $repo 'bios\README.md') (Join-Path $stage 'bios')
Copy-Item (Join-Path $repo 'disc\README.md') (Join-Path $stage 'disc')
Copy-Item (Join-Path $repo 'game\README.md') (Join-Path $stage 'game')

Compress-Archive -Path $stage -DestinationPath $zip -CompressionLevel Optimal
Write-Host "Created $zip"
