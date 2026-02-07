let mise_path = $env.USERPROFILE | path join "scoop" "apps" "mise" "current" "bin"
let mise_exe = $mise_path | path join "mise.exe"

$env.Path = ($env.Path | prepend $mise_path)

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
  let old_hooks = $old_config | get $field --optional | default []
  $env.config = ($old_config | upsert $field ($old_hooks ++ [$new_hook]))
}

def "parse vars" [] {
  $in | from csv --noheaders --no-infer | rename 'op' 'name' 'value'
}

export def --env --wrapped main [command?: string, --help, ...rest: string] {
  let commands = ["deactivate", "shell", "sh"]

  if ($command == null) {
    ^($mise_exe)
  } else if ($command == "activate") {
    $env.MISE_SHELL = "nu"
  } else if ($command in $commands) {
    ^($mise_exe) $command ...$rest
    | parse vars
    | update-env
  } else {
    ^($mise_exe) $command ...$rest
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
  ^($mise_exe) hook-env -s nu
    | parse vars
    | update-env
}
