$UserScriptPath = "$env:USERPROFILE\AppData\Roaming\powershell"

Get-ChildItem -Path $UserScriptPath -Filter '*.ps1' | ForEach-Object {
    . $_.FullName
}
