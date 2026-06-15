set -gx SSH_AUTH_SOCK       "$XDG_RUNTIME_DIR/ssh-agent.socket"
set -gx FZF_DEFAULT_COMMAND fd

alias ls              "eza --icons --git"
alias deploy-dotfiles "~/dotfiles/deploy.sh"

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    command rm -f -- "$tmp"
end

if status is-interactive
    mise activate fish | source
    starship init fish | source
    zoxide init fish | source

    if command -q nix-your-shell
        nix-your-shell fish | source
    end
end
