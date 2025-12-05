return {
	"nvim-lua/plenary.nvim",
	{ "nvim-tree/nvim-web-devicons", lazy = true },

	{
		"nvchad/ui",
		lazy = false,
		config = function()
			require "nvchad"
		end
	},

	{
		"nvchad/base46",
		lazy = false,
		build = function()
			require("base46").load_all_highlights()
		end,
	},

	"nvchad/volt", -- optional, needed for theme switcher
	-- or just use Telescope themes
    {
        "nvzone/floaterm",
        dependencies = "nvzone/volt",
        opts = {},
        cmd = "FloatermToggle",
    },
    {
        "nvzone/typr",
        dependencies = "nvzone/volt",
        opts = {},
        cmd = { "Typr", "TyprStats" },
    }
}
