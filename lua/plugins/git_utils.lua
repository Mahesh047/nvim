return {
    {

        "lewis6991/gitsigns.nvim",
        event = "BufReadPost",
        config = function()
            require "configs.git-signs"
        end,
    },
    {
        "sindrets/diffview.nvim",
        event = "BufReadPre",
        config = function()
            require("diffview").setup()
        end,
    }
}
