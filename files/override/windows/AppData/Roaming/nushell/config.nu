# Nushell Config File
#
# version = "0.89.0"

use cfg.nu

# The default config record. This is where much of your global configuration is setup.
$env.config = (cfg config)

$env.FZF_DEFAULT_COMMAND = "fd"

alias ls = eza --icons --git
alias cat = bat
alias diff = difft
alias find = fd
alias grep = rg

source mise.nu
