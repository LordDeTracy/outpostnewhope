# Builds the Windows release zip of Outpost: New Hope.
# Usage: powershell -File make-release.ps1 [-Version 2.0]
param([string]$Version = "2.0")
$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
$bin = Join-Path $root "rebuild\build-release\Release"
$name = "OutpostNewHope-$Version-Windows"
$out = Join-Path $PSScriptRoot $name
if (Test-Path $out) { Remove-Item -Recurse -Force $out }
New-Item -ItemType Directory $out | Out-Null

# The game, its libraries and assets.
Copy-Item (Join-Path $bin "outpost-rebuild.exe") (Join-Path $out "OutpostNewHope.exe")
Get-ChildItem $bin -Filter *.dll | Copy-Item -Destination $out
Get-ChildItem $bin -Filter *.ttf | Copy-Item -Destination $out
foreach ($d in "music", "ophd", "terrain-packs", "ui") { Copy-Item -Recurse (Join-Path $bin $d) $out }

# The Microsoft C++ runtime (app-local, so no redistributable install is needed).
foreach ($d in "vcruntime140.dll", "vcruntime140_1.dll", "msvcp140.dll") {
    Copy-Item (Join-Path $env:WINDIR "System32\$d") $out
}

# The original game files (Sierra's Outpost 1.51, abandonware).
Copy-Item -Recurse (Join-Path $root "Outpost") (Join-Path $out "Outpost")

Copy-Item (Join-Path $PSScriptRoot "Play Outpost New Hope.bat") $out
Copy-Item (Join-Path $PSScriptRoot "README.txt") $out
Copy-Item (Join-Path $root "OutpostNewHope\LICENSE") (Join-Path $out "LICENSE.txt")
Copy-Item (Join-Path $root "rebuild\assets\ophd\LICENSE-OutpostHD.md") (Join-Path $out "LICENSE-OutpostHD.md")

$zip = "$out.zip"
if (Test-Path $zip) { Remove-Item -Force $zip }
Compress-Archive -Path $out -DestinationPath $zip -CompressionLevel Optimal
"{0}  {1:N0} MB" -f $zip, ((Get-Item $zip).Length / 1MB)
