return { -- Collection of various small independent plugins/modules
	{
		"nvim-mini/mini.nvim",
		lazy = false,
		config = function()
			-- Better Around/Inside textobjects
			--
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]parenthen
			--  - yinq - [Y]ank [I]nside [N]ext [']quote
			--  - ci'  - [C]hange [I]nside [']quote
			require("mini.ai").setup { n_lines = 500 }

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup()

			-- Keymaps
			require("mini.keymap").setup()
		end,
	},
	{
		"echasnovski/mini.splitjoin",
		lazy = false,
		config = function()
			local miniSplitJoin = require("mini.splitjoin")
			miniSplitJoin.setup({
				mappings = { toggle = "" }, -- Disable default mapping
			})
			vim.keymap.set({ "n", "x" }, "<leader>bj", function() miniSplitJoin.join() end, { desc = "Join arguments" })
			vim.keymap.set({"n", "x"}, "<leader>bk", function() miniSplitJoin.split() end, { desc = "Split arguments" })
		end,
	},
}
