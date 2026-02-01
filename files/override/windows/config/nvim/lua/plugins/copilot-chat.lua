return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim", branch = "master" },
        },
        lazy = true,
        cmd = {
            'CopilotChat',
            'CopilotChatOpen',
            'CopilotChatClose',
            'CopilotChatToggle',
            'CopilotChatStop',
            'CopilotChatReset',
            'CopilotChatSave',
            'CopilotChatLoat',
            'CopilotChatPrompts',
            'CopilotChatModels',
        },
        opts = {
            window = {
                layout = 'vertical',
                width = 0.4,
                title = 'Github Copilot Chat'
            },

            headers = {
                user = '👤 You',
                assistant = '🤖 Copilot',
                tool = '🔧 Tool',
            },

            separator = '━━',
            auto_fold = true, -- Automatically folds non-assistant messages
        },
        config = function(_, opts)
            require('CopilotChat').setup(opts)
            vim.api.nvim_create_autocmd('BufEnter', {
                pattern = 'copilot-*',
                callback = function()
                    vim.opt_local.relativenumber = false
                    vim.opt_local.number = false
                    vim.opt_local.conceallevel = 0
                end,
            })
        end
    },
}
