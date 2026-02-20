return {
    {
        'amitds1997/remote-nvim.nvim',
        version = '*',               -- Pin to GitHub releases
        dependencies = {
            "nvim-lua/plenary.nvim", -- For standard functions
            "MunifTanjim/nui.nvim",  -- To build the plugin UI
        },
        lazy = true,
        cmd = {
            'RemoteStart',
            'RemoteStop',
            'RemoteInfo',
            'RemoteCleanup',
            'RemoteConfigDel',
            'RemoteLog',
            'UpdateRemotePlugins',
        },
        config = true
    }
}
