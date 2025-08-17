$env.config = {
    show_banner: false # 起動時のバナー
    shell_integration: {
        osc133: false # weztermとの相性が悪いので無効化
    }
}

$env.EDITOR = "code"
$env.FZF_DEFAULT_COMMAND = "fd"

alias ls! = ls
alias ls = eza --icons --git
alias cat = bat
alias diff = difft
alias find! = find
alias find = fd
alias grep = rg
