return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "RutaTang/quicknote.nvim",
    config = function()
      -- you must call setup to let quicknote.nvim works correctly
      require("quicknote").setup {}
      require("telescope").setup {
        extensions = {
          quicknote = {
            defaultScope = "Global",
          },
        },
      }

      require("telescope").load_extension "quicknote"
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
  },

  {
    "AnotherProksY/ez-window",
    lazy = false,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "configs.git-signs"
    end,
  },
  -- Highlight todo, notes, etc in comments
  { "folke/todo-comments.nvim", lazy = false, dependencies = { "nvim-lua/plenary.nvim" }, opts = { signs = false } },
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
      require "configs.lspconfig"
      require("lspconfig").clangd.setup {
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern(
            "Makefile",
            "configure.ac",
            "configure.in",
            "config.h.in",
            "meson.build",
            "meson_options.txt",
            "build.ninja"
          )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
            fname
          ) or require("lspconfig.util").find_git_ancestor(fname)
        end,
      }
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
      require("telescope").load_extension "lazygit"
    end,
  },
  {
    "tzachar/local-highlight.nvim",
    lazy = false,
    config = function()
      require("local-highlight").setup()
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    lazy = false,
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "natecraddock/workspaces.nvim",
    lazy = false,
    config = function()
      require("workspaces").setup {
        hooks = {
          open_pre = {
            -- If recording, save current session state and stop recording
            "SessionsStop",

            -- delete all buffers (does not save changes)
            "silent %bdelete!",
          },
          open = {
            function()
              require("sessions").load(nil, { silent = true })
            end,
            "NvimTreeOpen",
          },
        },
      }
      require("telescope").load_extension "workspaces"
    end,
  },
  {
    "natecraddock/sessions.nvim",
    lazy = false,
    config = function()
      require("sessions").setup {
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
      }
    end,
  },

  --
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "mason.nvim",
    },
    config = function()
      require("mason-lspconfig").setup()
      require("mason-lspconfig").setup_handlers {
        function(server_name)
          require("lspconfig")[server_name].setup {}
        end,
      }
    end,
  },
}
