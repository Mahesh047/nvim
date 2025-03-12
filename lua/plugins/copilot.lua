return {
    {
        "github/copilot.vim",
        lazy = false,
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        lazy = false,
        dependencies = {
            { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
            { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
            { "MeanderingProgrammer/render-markdown.nvim" }, -- Add render-markdown as a dependency
        },
        opts = {
            -- See Configuration section for options
            model = "claude-3.7-sonnet"
        },
        -- Key mappings in normal mode
        keys = {
            { "<leader>kc", ":CopilotChat<CR>", desc = "CopilotChat - Open" },
            { "<leader>ke", ":CopilotChatExplain<CR>", desc = "CopilotChat - Explain code" },
            { "<leader>kt", ":CopilotChatTests<CR>", desc = "CopilotChat - Generate tests" },
            { "<leader>kr", ":CopilotChatReview<CR>", desc = "CopilotChat - Review code" },
            { "<leader>kb", ":CopilotChatBugs<CR>", desc = "CopilotChat - Find bugs" },
            { "<leader>kf", ":CopilotChatFix<CR>", desc = "CopilotChat - Fix code" },
            { "<leader>ko", ":CopilotChatOptimize<CR>", desc = "CopilotChat - Optimize code" },
            { "<leader>kd", ":CopilotChatDocstring<CR>", desc = "CopilotChat - Document code" },
        }
    },
}
