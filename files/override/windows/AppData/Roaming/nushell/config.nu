$env.config.show_banner = false # 起動時のバナー
$env.config.shell_integration.osc133 = false # weztermとの相性が悪いので無効化

$env.SHELL = "nu"
$env.EDITOR = "nvim"
$env.FZF_DEFAULT_COMMAND = "fd"

def deploy-dotfiles [] {
  nu -c "cd ~/dotfiles; sudo dotter deploy -fy"
}

# Generate init scripts of the tools into the user autoload directory
# so that they follow updates of the tools (autoload directories are loaded after config.nu).
if (which mise | is-not-empty) {
  let autoload_dir = ($nu.user-autoload-dirs | first)
  mkdir $autoload_dir

  # Regenerate on every startup since the output contains a snapshot of PATH
  ^mise activate nu | save -f ($autoload_dir | path join "mise.nu")

  # Regenerate only when the tool has been (re)installed, since `mise which` is slow on Windows.
  # Tools are resolved by `mise which` since `mise exec` may try to install missing tools.
  let data_dir = if "MISE_DATA_DIR" in $env { $env.MISE_DATA_DIR } else { $env.LOCALAPPDATA | path join "mise" }
  let installs_dir = ($data_dir | path join "installs")
  let tools = [
    [name args];
    [starship [init nu]]
    [zoxide [init nushell]]
  ]
  for tool in $tools {
    let script = ($autoload_dir | path join $"($tool.name).nu")
    let tool_dir = ($installs_dir | path join $tool.name)
    if not ($tool_dir | path exists) {
      rm -f $script
    } else if (not ($script | path exists)) or ((ls -D $tool_dir | get 0.modified) > (ls $script | get 0.modified)) {
      let exe = (^mise which $tool.name | complete)
      if $exe.exit_code == 0 {
        ^($exe.stdout | str trim) ...$tool.args | save -f $script
      }
    }
  }
}

alias wsl = wsl --cd '~'
alias ls = eza --icons --git
