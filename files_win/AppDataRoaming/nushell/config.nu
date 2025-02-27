# Nushell Config File
#
# version = "0.89.0"

use cfg.nu

# The default config record. This is where much of your global configuration is setup.
$env.config = (cfg config)

def ls_grid [path? --all (-a) ] {
    let $path = if $path == null { '.' } else { $path }
    if $all {
        ls -a $path | grid -ci
    } else {
        ls $path | grid -ci
    }
}

alias lsg = ls_grid
