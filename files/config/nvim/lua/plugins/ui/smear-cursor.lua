return {
    {
        "sphamba/smear-cursor.nvim",
        lazy = true,
        event = { 'CursorHold' },
        opts = {
            stiffness = 0.7,
            trailing_stiffness = 0.65,
            never_draw_over_target = false,
        }
    }
}
