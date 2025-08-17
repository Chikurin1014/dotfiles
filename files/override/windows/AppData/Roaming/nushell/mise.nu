$env.Path = ($env.Path | prepend 'C:\Users\Chikurin\scoop\apps\mise\current\bin')
export-env {
  $env.MISE_SHELL = "nu"
  let mise_hook = {
    condition: { "MISE_SHELL" in $env }
    code: { mise_hook }
  }
  add-hook hooks.pre_prompt $mise_hook
  add-hook hooks.env_change.PWD $mise_hook
}

def --env add-hook [field: cell-path new_hook: any] {
  let old_config = $env.config? | default {}
  let old_hooks = $old_config | get $field --ignore-errors | default []
  $env.config = ($old_config | upsert $field ($old_hooks ++ [$new_hook]))
}

def "parse vars" [] {
  $in | from csv --noheaders --no-infer | rename 'op' 'name' 'value'
}

export def --env --wrapped main [command?: string, --help, ...rest: string] {
  let commands = ["deactivate", "shell", "sh"]

  if ($command == null) {
    ^"C:\\Users\\Chikurin\\scoop\\apps\\mise\\current\\bin\\mise.exe"
  } else if ($command == "activate") {
    $env.MISE_SHELL = "nu"
  } else if ($command in $commands) {
    ^"C:\\Users\\Chikurin\\scoop\\apps\\mise\\current\\bin\\mise.exe" $command ...$rest
    | parse vars
    | update-env
  } else {
    ^"C:\\Users\\Chikurin\\scoop\\apps\\mise\\current\\bin\\mise.exe" $command ...$rest
  }
}

def --env "update-env" [] {
  for $var in $in {
    if $var.op == "set" {
      if $var.name == 'PATH' {
        $env.PATH = ($var.value | split row (char esep))
      } else {
        load-env {($var.name): $var.value}
      }
    } else if $var.op == "hide" {
      hide-env $var.name
    }
  }
}

def --env mise_hook [] {
  ^"C:\\Users\\Chikurin\\scoop\\apps\\mise\\current\\bin\\mise.exe" hook-env -s nu
    | parse vars
    | update-env
}