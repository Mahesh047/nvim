return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require('telescope').setup{
            -- pickers = {
            --     live_grep = {
            --         prompt_position = "middle",
            --         theme = "dropdown",
            --         layout_config={width=0.8}
            --     },
            -- },
            extensions = {
                fzf = {},
            }

        }
    end,
}
