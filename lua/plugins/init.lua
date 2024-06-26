return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
	-- Highlight todo, notes, etc in comments
	{ "folke/todo-comments.nvim", lazy = false, dependencies = { "nvim-lua/plenary.nvim" }, opts = { signs = false } },
	{ -- Collection of various small independent plugins/modules
		"echasnovski/mini.nvim",
		config = function()
			-- Better Around/Inside textobjects
			--
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]parenthen
			--  - yinq - [Y]ank [I]nside [N]ext [']quote
			--  - ci'  - [C]hange [I]nside [']quote
			require("mini.ai").setup({ n_lines = 500 })

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup()

			-- Simple and easy statusline.
			--  You could remove this setup call if you don't like it,
			--  and try some other statusline plugin
			require("mini.statusline").setup()

			-- ... and there is more!
			--  Check out: https://github.com/echasnovski/mini.nvim
		end,
	},
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
        -- Automatically install LSPs and related tools to stdpath for neovim
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",

        -- Useful status updates for LSP.
        -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
        { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
      require "configs.lsp-config"
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("telescope").load_extension("lazygit")
    end,
  },
  { -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

        ---@diagnostic disable-next-line: missing-fields
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "bash", "c", "html", "lua", "markdown", "vim", "vimdoc" },
            -- Autoinstall languages that are not installed
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })

        -- There are additional nvim-treesitter modules that you can use to interact
        -- with nvim-treesitter. You should go explore a few and see what interests you:
        --
        --    - Incremental selection: Included, see :help nvim-treesitter-incremental-selection-mod
        --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
        --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    end
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    lazy = false,

  },
  {
      'tzachar/local-highlight.nvim',
      lazy = false,
      config = function()
        require('local-highlight').setup()
      end
  },
  {
    "iamcco/markdown-preview.nvim",
    lazy = false,
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "natecraddock/workspaces.nvim",
    lazy = false,
    config = function ()
      require("workspaces").setup({
        hooks = {
            open_pre = {
              -- If recording, save current session state and stop recording
              "SessionsStop",

              -- delete all buffers (does not save changes)
              "silent %bdelete!",
            },
            open = {
              function ()
                require("sessions").load(nil, { silent = true })
              end,
              "NvimTreeOpen",
            },
        }
      })
      require("telescope").load_extension("workspaces")
    end,
  },
  {
    "natecraddock/sessions.nvim",
    lazy = false,
    config = function ()
      require("sessions").setup({
        -- autocmd events which trigger a session save
        --
        -- the default is to only save session files before exiting nvim.
        -- you may wish to also save more frequently by adding "BufEnter" or any
        -- other autocmd event
        events = { "VimLeave" },

        -- default session filepath
        --
        -- if a path is provided here, then the path argument for commands and API
        -- functions will use session_filepath as a default if no path is provided.
        session_filepath = ".nvim/session",

        -- treat the default session filepath as an absolute path
        -- if true, all session files will be stored in a single directory
        absolute = false,
    })
    end,
  },

  --
  -- {
  -- 	"williamboman/mason.nvim",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"lua-language-server", "stylua",
  -- 			"html-lsp", "css-lsp" , "prettier"
  -- 		},
  -- 	},
  -- },
  --
  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css"
  		},
  	},
  },
}
