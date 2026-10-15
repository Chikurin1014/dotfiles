# Use ssh-agent.service unless an agent is already given (e.g. forwarded by ssh)
if [[ -z $SSH_AUTH_SOCK && -S $XDG_RUNTIME_DIR/ssh-agent.socket ]]; then
    export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi
