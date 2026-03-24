return {
    settings = {
        python = {
            pythonPath = vim.g.is_unix and
                '.venv/bin/python' or
                '.venv/Scripts/python.exe'
        }
    }
}
