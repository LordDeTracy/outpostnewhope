# Refreshes this repository folder from the working folders of D:\Project Outpost.
# Run it before committing:  powershell -ExecutionPolicy Bypass -File sync.ps1
$ErrorActionPreference = 'Stop'
$repo = $PSScriptRoot
$root = Split-Path $repo -Parent

function Mirror($from, $to, [string[]]$excludeDirs = @(), [string[]]$excludeFiles = @()) {
    $args = @("$root\$from", "$repo\$to", '/MIR', '/NFL', '/NDL', '/NJH', '/NJS', '/NP')
    if ($excludeDirs.Count) { $args += '/XD'; $args += $excludeDirs }
    if ($excludeFiles.Count) { $args += '/XF'; $args += $excludeFiles }
    robocopy @args | Out-Null
    if ($LASTEXITCODE -ge 8) { throw "robocopy failed for $from ($LASTEXITCODE)" }
}

# The game: source, assets, tests and tools (no builds, saves or settings).
Mirror 'rebuild' 'rebuild' @('build', 'build-asan', 'build-cleanup', 'build-debug', 'build-release', 'saves') @('REBUILD.INI', '*.OPS')
# The original Outpost 1.51 game files the rebuild reads at runtime.
Mirror 'Outpost' 'Outpost'
# The decompilation: findings, plans and the reverse-engineering references.
Mirror 'specs' 'specs'
Mirror 'reference' 'reference' @('extracted')
foreach ($t in 'ne-analyzer', 'resource-extractor', 'map-viewer', 'ops-reader', 'dat-dumper') {
    Mirror "tools\$t" "tools\$t" @('bin', 'obj', '__pycache__', 'node_modules')
}
# The release packaging script (not the built packages).
Mirror 'release' 'release' @('OutpostNewHope-*') @('*.zip')
Write-Host "Synced into $repo"
exit 0
