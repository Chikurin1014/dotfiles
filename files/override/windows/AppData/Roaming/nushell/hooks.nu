# run before the prompt is shown
export def pre_prompt [] {
    [
        { null }
    ]
}
# run before the repl input is run
export def pre_execution [] {
    [
        { null }
    ]
}
# run if the PWD environment is different since the last repl input
export def env_change [] {
    {
    PWD: [
            {|before, after| null }
        ]
    }
}
# run to display the output of a pipeline
export def display_output [] {
    'if (term size).columns >= 100 { table -e } else { table }'
}
# return an error message when a command is not found
export def command_not_found [] {
    { null }
}
