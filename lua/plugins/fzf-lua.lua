return {
	"ibhagwan/fzf-lua",
	dependencies = { "echasnovski/mini.icons" },
	opts = {},
	keymap = {
		fzf = {
			true,
			["ctrl-q"] = "select-all+accept",
		}
	},
    files = {
        find_opts = "--follow --unrestricted -L . -type f -not -path '*/\\.git/*'",
    },
	-- files = {
	-- 	follow = true,
	-- 	toggle_ignore_flag = "--no-ignore", -- flag toggled in `actions.toggle_ignore`
	-- 	toggle_hidden_flag = "--hidden",    -- flag toggled in `actions.toggle_hidden`
	-- 	toggle_follow_flag = "-L",          -- flag toggled in `actions.toggle_follow`
	-- },
    fzf_opts = {
        ["--follow"] = "true",
    },

	config = function()

		require("fzf-lua").setup{
			"telescope",

        }
	end,

}
