# Detection Script — Microsoft.WindowsDesktop.App 8.0.28
# Intune Win32 App: Custom Script Detection
#
# Detected  : exits 0 with stdout output
# Not found  : exits 1 (no output)

$ErrorActionPreference = 'SilentlyContinue'

$dotnetExe = Join-Path $env:ProgramFiles 'dotnet\dotnet.exe'

if (-not (Test-Path $dotnetExe)) {
    exit 1
}

$runtimes = & $dotnetExe --list-runtimes 2>&1

$match = $runtimes | Where-Object { $_ -like 'Microsoft.WindowsDesktop.App 8.*' }

if ($match) {
    Write-Output "Detected: $match"
    exit 0
}

exit 1
