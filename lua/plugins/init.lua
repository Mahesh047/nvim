return {
    {
        dir = "C:/Users/U431502/AppData/Local/nvim/lua/plugins/custom_plugin_temp.nvim",
        lazy = false,
        config = function()
            require("custom_plugin_temp")
        end
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = {
            formatters_by_ft = {
                javascript = { "prettier" }, typescript = { "prettier" },
                html = { "prettier" },
                css = { "prettier" },
                json = { "prettier" },
                markdown = { "prettier" },
                lua = { "stylua" },
            },
        },
        config = function()
            require "configs.conform"
        end,
    },
    -- {
    --     "AnotherProksY/ez-window",
    --     lazy = false,
    -- },
    {
        "tzachar/local-highlight.nvim",
        lazy = false,
        config = function()
            require("local-highlight").setup()
        end,
    },
    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
        ---@module 'render-markdown'
        opts = {},
        config = function()
            require('render-markdown').setup({
                render_modes = true,
                file_types = { 'markdown', 'copilot-chat' },
            })
        end
    },

    {                       -- Useful plugin to show you pending keybinds.
        'folke/which-key.nvim',
        event = 'VimEnter', -- Sets the loading event to 'VimEnter'
        opts = {
            delay = 0,
            icons = {
                mappings = vim.g.have_nerd_font,
                keys = vim.g.have_nerd_font and {} or {
                    Up = '<Up> ',
                    Down = '<Down> ',
                    Left = '<Left> ',
                    Right = '<Right> ',
                    C = '<C-…> ',
                    M = '<M-…> ',
                    D = '<D-…> ',
                    S = '<S-…> ',
                    CR = '<CR> ',
                    Esc = '<Esc> ',
                    ScrollWheelDown = '<ScrollWheelDown> ',
                    ScrollWheelUp = '<ScrollWheelUp> ',
                    NL = '<NL> ',
                    BS = '<BS> ',
                    Space = '<Space> ',
                    Tab = '<Tab> ',
                    F1 = '<F1>',
                    F2 = '<F2>',
                    F3 = '<F3>',
                    F4 = '<F4>',
                    F5 = '<F5>',
                    F6 = '<F6>',
                    F7 = '<F7>',
                    F8 = '<F8>',
                    F9 = '<F9>',
                    F10 = '<F10>',
                    F11 = '<F11>',
                    F12 = '<F12>',
                },
            },
        },
    },
    {
        'tpope/vim-repeat',
        lazy = false,
    },
}
