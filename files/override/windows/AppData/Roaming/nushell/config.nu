$env.config = {
    show_banner: false # 起動時のバナー
    shell_integration: {
        osc133: false # weztermとの相性が悪いので無効化
    }
}

$env.SHELL = "nu"
$env.EDITOR = "nvim"
$env.FZF_DEFAULT_COMMAND = "fd"

def deploy-dotfiles [] {
  nu -c "cd ~/dotfiles; sudo dotter deploy -fy"
}
alias wsl = wsl --cd '~'
alias ls = eza --icons --git
