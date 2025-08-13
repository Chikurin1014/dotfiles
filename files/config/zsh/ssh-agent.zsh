if [ -f ~/.ssh-agent ]; then
    source ~/.ssh-agent > /dev/null
fi

if [ -z "$SSH_AGENT_PID" ] || ! kill -0 "$SSH_AGENT_PID" > /dev/null 2>&1; then
    ssh-agent > ~/.ssh-agent
    source ~/.ssh-agent > /dev/null
fi

for file in ~/.ssh/*.pub; do
    ssh-add "${file%.pub}" > /dev/null 2>&1
done
