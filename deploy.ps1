# Set up the dotfiles on Windows: packages (Scoop), dotfiles (Dotter) and tools (mise)
#
# Usage (as a normal user, since Scoop refuses to be installed by an administrator):
#   powershell -ExecutionPolicy Bypass -File deploy.ps1
#
# This script also works on Windows PowerShell 5.1, which is the only PowerShell on a fresh Windows.

$ErrorActionPreference = 'Stop'
$SrcDir = $PSScriptRoot

function Test-Command([string]$Name) {
    [bool](Get-Command $Name -ErrorAction SilentlyContinue)
}

# Run a native command and throw if it fails (native commands do not stop on errors by themselves)
function Invoke-Native([scriptblock]$Command) {
    & $Command
    if ($LASTEXITCODE -ne 0) { throw "Failed (exit code $LASTEXITCODE): $Command" }
}

# Return the path to the Dotter binary pinned in .dotter/manifest.toml (Dotter installed elsewhere is not used)
function Get-DotterCommand {
    if ($env:PROCESSOR_ARCHITECTURE -ne 'AMD64') {
        throw "Dotter has no binary for Windows/$env:PROCESSOR_ARCHITECTURE"
    }
    $asset = 'dotter-windows-x64-msvc.exe'

    $manifest = Get-Content (Join-Path $SrcDir '.dotter\manifest.toml')
    $version = $manifest | ForEach-Object { if ($_ -match '^version = "(.*)"$') { $Matches[1] } } | Select-Object -First 1
    $sha256 = $manifest | ForEach-Object { if ($_ -match "^`"$([regex]::Escape($asset))`" = `"(.*)`"$") { $Matches[1] } } | Select-Object -First 1
    if (-not $version -or -not $sha256) { throw ".dotter/manifest.toml has no version or SHA-256 for $asset" }

    # Download the binary unless the one downloaded before matches the manifest
    $bin = Join-Path $SrcDir '.dotter\bin\dotter.exe'
    if (-not (Test-Path $bin) -or (Get-FileHash -Algorithm SHA256 $bin).Hash -ne $sha256) {
        Write-Host "Downloading Dotter $version ($asset)"
        New-Item -ItemType Directory -Force (Split-Path $bin) | Out-Null
        $tmp = "$bin.tmp"
        Invoke-WebRequest -UseBasicParsing -Uri "https://github.com/SuperCuber/dotter/releases/download/$version/$asset" -OutFile $tmp
        if ((Get-FileHash -Algorithm SHA256 $tmp).Hash -ne $sha256) {
            Remove-Item $tmp
            throw "Checksum mismatch for $asset"
        }
        Move-Item -Force $tmp $bin
    }
    return $bin
}

# Creating symbolic links needs administrator rights or Developer Mode
function Test-SymlinkPermission {
    $principal = [Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()
    if ($principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) { return $true }
    $devMode = Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock' `
        -Name AllowDevelopmentWithoutDevLicense -ErrorAction SilentlyContinue
    return [bool]($devMode -and $devMode.AllowDevelopmentWithoutDevLicense -eq 1)
}

function Main {
    # Windows PowerShell 5.1 may not enable TLS 1.2 by default
    [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

    # ---- Packages (Scoop) ----
    if (-not (Test-Command scoop)) {
        Write-Host 'Installing Scoop (https://scoop.sh)'
        Invoke-RestMethod -UseBasicParsing https://get.scoop.sh | Invoke-Expression
        $scoopDir = if ($env:SCOOP) { $env:SCOOP } else { Join-Path $HOME 'scoop' }
        $env:PATH = "$(Join-Path $scoopDir 'shims');$env:PATH"
    }
    # Adding buckets needs Git
    if (-not (Test-Command git)) { scoop install git }
    scoop import (Join-Path $SrcDir 'scoop.json')

    # ---- Dotfiles (Dotter) ----
    # Initialize git submodules which are not initialized yet (e.g. nvim-config).
    # Initialized ones are left as is not to discard local changes.
    $status = Invoke-Native { git -C $SrcDir submodule status }
    foreach ($line in $status) {
        if ($line -match '^-\S+\s+(\S+)') { Invoke-Native { git -C $SrcDir submodule update --init -- $Matches[1] } }
    }

    $localConfig = Join-Path $SrcDir '.dotter\local.toml'
    if (-not (Test-Path $localConfig)) {
        Write-Host 'Creating .dotter/local.toml'
        # Write UTF-8 without BOM (Out-File of Windows PowerShell 5.1 writes UTF-16 or a BOM)
        [IO.File]::WriteAllLines($localConfig, [string[]]@('includes = [".dotter/windows.toml"]', 'packages = ["default", "windows"]'))
    }

    $dotter = Get-DotterCommand
    $dotterArgs = @('deploy', '--force', '--noconfirm')
    # Some templates read user.toml by a path relative to the repository root
    Push-Location $SrcDir
    try {
        if (Test-SymlinkPermission) {
            Invoke-Native { & $dotter @dotterArgs }
        } else {
            Write-Host 'Running Dotter as administrator to create symbolic links (or enable Developer Mode)'
            $process = Start-Process -FilePath $dotter -ArgumentList $dotterArgs -WorkingDirectory $SrcDir `
                -Verb RunAs -Wait -PassThru
            if ($process.ExitCode -ne 0) { throw "Dotter failed (exit code $($process.ExitCode))" }
        }
    } finally {
        Pop-Location
    }

    # ---- Tools (mise, installed by Scoop) ----
    Push-Location $HOME
    try {
        Invoke-Native { mise install --yes }
    } finally {
        Pop-Location
    }
}

# Run unless dot-sourced (e.g. to test the functions)
if ($MyInvocation.InvocationName -ne '.') { Main }
