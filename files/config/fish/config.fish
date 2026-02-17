set -gx SSH_AUTH_SOCK       "$XDG_RUNTIME_DIR/ssh-agent.socket"
set -gx FZF_DEFAULT_COMMAND fd

abbr --add deploy-dotfiles ~/dotfiles/deploy.sh
abbr --add l               eza --icons --git
abbr --add df              difft

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
            builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

if status is-interactive
    mise activate fish | eval
    starship init fish | source
end
