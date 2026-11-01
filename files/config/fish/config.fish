# Use ssh-agent.service unless an agent is already given (e.g. forwarded by ssh)
if not set -q SSH_AUTH_SOCK; and test -S "$XDG_RUNTIME_DIR/ssh-agent.socket"
    set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
end
set -gx FZF_DEFAULT_COMMAND fd

abbr -a ls "eza --icons --git"
abbr -a l "eza --icons --git -alh"
abbr -a la "eza --icons --git -lAh"
abbr -a ll "eza --icons --git -l"

alias deploy-dotfiles "~/dotfiles/deploy.sh"

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    command rm -f -- "$tmp"
end

if status is-interactive
    if command -q mise
        mise activate fish | source
    end

    if command -q direnv
        direnv hook fish | source
    end

    starship init fish | source

    zoxide init fish | source
    abbr --add cd z
    abbr --add cdi zi
end
