$UserScriptPath = "$env:USERPROFILE\AppData\Roaming\powershell"

if (Test-Path $UserScriptPath) {
    Get-ChildItem -Path $UserScriptPath -Filter '*.ps1' | ForEach-Object {
        . $_.FullName
    }
}
