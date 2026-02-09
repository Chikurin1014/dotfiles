# $SSHAgentService = Get-Service -Name 'ssh-agent' -ErrorAction SilentlyContinue
# if ($null -ne $SSHAgentService -and $SSHAgentService.Status -ne 'Running') {
#     Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
#     # $SSHAgentService | Set-Service -StartupType Automatic
#     $SSHAgentService | Start-Service 
#     Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope Process
# }
