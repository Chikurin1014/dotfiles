$SSHAgentService = Get-Service -Name 'ssh-agent' -ErrorAction SilentlyContinue
if ($null -ne $SSHAgentService -and $SSHAgentService.Status -ne 'Running') {
    # $SSHAgentService | Set-Service -StartupType Automatic
    Start-Service 'ssh-agent'
}
