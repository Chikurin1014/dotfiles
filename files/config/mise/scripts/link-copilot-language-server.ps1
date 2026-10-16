# postinstall of `npm:@github/copilot-language-server` on Windows.
# The package's `bin` points outside the package (`../dist/language-server.js`),
# so mise's npm installer creates no executable in `node_modules/.bin`.
# Hard-link the native binary of the platform package there instead,
# so that it is exposed on PATH and as a shim.
$ErrorActionPreference = 'Stop'

$installPath = $env:MISE_TOOL_INSTALL_PATH
$exe = Get-ChildItem -LiteralPath $installPath -Recurse -Force -Filter 'copilot-language-server.exe' |
    Where-Object { $_.Directory.Name -like 'copilot-language-server-win32-*' } |
    Select-Object -First 1
if (-not $exe) {
    throw "copilot-language-server.exe is not found in $installPath"
}

$bin = Join-Path $installPath 'node_modules\.bin'
New-Item -ItemType Directory -Force -Path $bin | Out-Null
New-Item -ItemType HardLink -Force -Path (Join-Path $bin $exe.Name) -Target $exe.FullName | Out-Null
