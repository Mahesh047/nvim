return {
  {
    "github/copilot.vim",
    event = "InsertEnter",
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    lazy = true,
    cmd = {
      "CopilotChat",
    },
    dependencies = {
      { "github/copilot.vim" },                                          -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim",                    branch = "master" }, -- for curl, log and async functions
      { "MeanderingProgrammer/render-markdown.nvim" },                   -- Add render-markdown as a dependency
    },
    -- opts = {
    --     -- See Configuration section for options
    --     model = "claude-3.7-sonnet"
    -- },
    -- Key mappings in normal mode
    keys = {
      { "<leader>kc", ":CopilotChat<CR>",          desc = "CopilotChat - Open" },
      { "<leader>ke", ":CopilotChatExplain<CR>",   desc = "CopilotChat - Explain code" },
      { "<leader>kt", ":CopilotChatTests<CR>",     desc = "CopilotChat - Generate tests" },
      { "<leader>kr", ":CopilotChatReview<CR>",    desc = "CopilotChat - Review code" },
      { "<leader>kb", ":CopilotChatBugs<CR>",      desc = "CopilotChat - Find bugs" },
      { "<leader>kf", ":CopilotChatFix<CR>",       desc = "CopilotChat - Fix code" },
      { "<leader>ko", ":CopilotChatOptimize<CR>",  desc = "CopilotChat - Optimize code" },
      { "<leader>kd", ":CopilotChatDocstring<CR>", desc = "CopilotChat - Document code" },
    },
    config = function()
      require("CopilotChat").setup({
        model = "claude-3.7-sonnet",
        mappings = {
          complete = {
            insert = '<C-y>',
          },
        },
        -- Custome prompts
        prompts = {
          MermaidDiagrams = {
            -- Prompt for generating a mermaid diagram
            prompt = "You are an expert on the mermaid diagrams. Try to help me",
            mapping = "<leader>km",
          },
          -- CreateDocumentation = {
          --   -- Prompt for generating a mermaid diagram
          --   prompt =
          --   "Based on the contents of the file. Create a documentation following the same format. I want to use the content in the selection to be used as a documentation.\n\n```lua\n%s\n```\n\n",
          --   mapping = "<leader>kk",
          -- },
        },
      }
      )
    end
  },
}
