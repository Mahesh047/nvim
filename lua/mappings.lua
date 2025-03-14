require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
-- map("n", "<C-u>", "<C-u>zz", { desc = "Scroll down" })
-- Good neovim keymaps



-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- Enable telescope extensions, if they are installed
pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")

-- See `:help telescope.builtin`
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>ww", "<cmd>Telescope workspaces<cr>", { desc = "[W]orkspace selection" })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set("n", "<leader>/", function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
    }))
end, { desc = "[/] Fuzzily search in current buffer" })

-- Also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set("n", "<leader>s/", function()
    builtin.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
    })
end, { desc = "[S]earch [/] in Open Files" })

-- Shortcut for searching your neovim configuration files
vim.keymap.set("n", "<leader>sn", function()
    builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })

--Source the current lua files using source %
vim.keymap.set("n", "<leader>so", "<cmd>source %<cr>", { desc = "Source current lua file" })
-- Find and center
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
-- Keymaps for copilot
vim.keymap.set("n", "<leader>cc", "<cmd>Copilot panel<cr>", { desc = "Open Copilot panel" })
-- vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
--

-- vim.keymap.set("n", "<M-1>", function() harpoon:list():select(1) end)
-- vim.keymap.set("n", "<M-2>", function() harpoon:list():select(2) end)
-- vim.keymap.set("n", "<M-3>", function() harpoon:list():select(3) end)
-- vim.keymap.set("n", "<M-4>", function() harpoon:list():select(4) end)
-- Quickfix keymaps
vim.keymap.set("n","<M-j>", "<cmd>cnext<CR>zzzv")
vim.keymap.set("n","<M-k>", "<cmd>cprev<CR>zzzv")
-- Move text is visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") 
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
