return {
    {
        'amitds1997/remote-nvim.nvim',
        version = '*',                                       -- Pin to GitHub releases
        specs = {
            { 'nvim-lua/plenary.nvim',         lazy = true }, -- For standard functions
            { 'MunifTanjim/nui.nvim',          lazy = true }, -- To build the plugin UI
            { 'nvim-telescope/telescope.nvim', lazy = true }, -- For picking b/w different remote methods
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
