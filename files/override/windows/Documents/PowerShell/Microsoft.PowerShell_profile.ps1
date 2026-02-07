$UserScriptPath = "$env:USERPROFILE\AppData\Roaming\powershell"

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
Get-ChildItem -Path $UserScriptPath -Filter '*.ps1' | ForEach-Object {
    . $_.FullName
}
Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope Process
