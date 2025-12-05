-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll down" })
map({ "n", "x" }, "<leader>fm", function()
	require("conform").format { lsp_fallback = true }
end, { desc = "general format file" })
-- tabufline
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })

map("n", "<tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

map("n", "<leader>T", "<cmd>tabnext<CR>", { desc = "tab goto next" })
map("n", "<leader>B", "<cmd>UISelect<CR>", { desc = "Open website" })

map("n", "<leader>x", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })
map("n", "<leader>X", function()
  require("nvchad.tabufline").closeAllBufs(false)
end, { desc = "buffer close" })
-- Good neovim keymaps

--Oil.nvim keymaps
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
vim.keymap.set('i', '<C-h>', '<Left>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-j>', '<Down>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-k>', '<Up>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-l>', '<Right>', { noremap = true, silent = true })


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- Enable telescope extensions, if they are installed
pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")

-- See `:help telescope.builtin`
local builtin = require("telescope.builtin")
local fzf = require('fzf-lua')
vim.keymap.set("n", "<leader>sh", fzf.helptags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", fzf.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", fzf.files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>ss", fzf.builtin, { desc = "[S]earch [S]elect FzfLua" })
vim.keymap.set("n", "<leader>sw", fzf.grep_cword, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>st", fzf.tabs, { desc = "[S]earch [T]abs" })
vim.keymap.set("n", "<leader>sG", builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sm", fzf.marks, { desc = "[S]earch by [M]arks" })

vim.keymap.set("n", "<leader>sg", function()
	require("configs.telescope.multigrep").live_multigrep()
end, { desc = "[S]earch by Multi[G]rep" })

vim.keymap.set("n", "<leader>sd", fzf.diagnostics_document, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", fzf.buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>ww", "<cmd>Telescope workspaces<cr>", { desc = "[W]orkspace selection" })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set("n", "<leader>/", fzf.lgrep_curbuf, { desc = "[/] Fuzzily search in current buffer" })

-- Shortcut for searching your neovim configuration files
vim.keymap.set("n", "<leader>sn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })

--Source the current lua files using source %
vim.keymap.set("n", "<leader>so", "<cmd>source %<cr>", { desc = "Source current lua file" })
vim.keymap.set("n", "<leader>sl", ":.lua<cr>", { desc = "Source current lua file" })
vim.keymap.set("v", "<leader>sl", ":lua<cr>", { desc = "Source current lua file" })
-- Find and center
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
-- Keymaps for copilot
vim.keymap.set("n", "<leader>cc", "<cmd>Copilot panel<cr>", { desc = "Open Copilot panel" })
vim.keymap.set('n', '<leader>kkq', function()
  local input = vim.fn.input("Quick Chat: ")
  if input ~= "" then
    require("CopilotChat").ask(input, {
      selection = require("CopilotChat.select").buffer
    })
  end
end, { desc = "CopilotChat - Quick chat" })

vim.keymap.set('n', '<leader>kkp', function()
  local actions = require("CopilotChat.actions")
  require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
end, { desc = "CopilotChat - Prompt actions" })

-- Add a keybinding to select model
vim.keymap.set('n', '<leader>kkm', function()
    local chat = require("CopilotChat")
  require("CopilotChat.integrations.telescope").pick(chat.select_model())
end, { desc = "CopilotChat - Select model" })
--

-- vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
-- vim.keymap.set("n", "<M-1>", function() harpoon:list():select(1) end)
-- vim.keymap.set("n", "<M-2>", function() harpoon:list():select(2) end)
-- vim.keymap.set("n", "<M-3>", function() harpoon:list():select(3) end)
-- vim.keymap.set("n", "<M-4>", function() harpoon:list():select(4) end)
-- Quickfix keymaps
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>zzzv")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>zzzv")
-- Move text is visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")



local maps = function(keys, func, desc)
	vim.keymap.set("n", keys, func, { desc = "LSP: " .. desc })
end

maps("gd", require("fzf-lua").lsp_definitions, "[G]oto [D]efinition")

maps("gr", require("fzf-lua").lsp_references, "[G]oto [R]eferences")

maps("gI", require("fzf-lua").lsp_implementations, "[G]oto [I]mplementation")
maps("<leader>D", require("fzf-lua").lsp_typedefs, "Type [D]efinition")
maps("<leader>ds", require("fzf-lua").lsp_document_symbols, "[D]ocument [S]ymbols")
-- maps("<leader>ws", require("fzf-lua").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

--TODO: Implement this feature
-- map("<leader>wf", function()
--   require("fzf-lua").lsp_document_symbols { symbols = { "function" } }
-- end, "[W]orkspace [F]unctions")

-- Rename the variable under your cursor
--  Most Language Servers support renaming across files, etc.
maps("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

-- Execute a code action, usually your cursor needs to be on top of an error
-- or a suggestion from your LSP for this to activate.
maps("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

-- Opens a popup that displays documentation about the word under your cursor
--  See `:help K` for why this keymap
maps("K", vim.lsp.buf.hover, "Hover Documentation")

-- WARN: This is not Goto Definition, this is Goto Declaration.
--  For example, in C this would take you to the header
maps("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

-- The following two autocommands are used to highlight references of the
-- word under your cursor when your cursor rests there for a little while.
--    See `:help CursorHold` for information about when this is executed

-- When you move your cursor, the highlights will be cleared (the second autocommand).
-- client = vim.lsp.get_client_by_id(event.data.client_id)
-- if client and client.server_capabilities.documentHighlightProvider then
--   vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
--     buffer = event.buf,
--     callback = vim.lsp.buf.document_highlight,
--   })
--
--   vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
--     buffer = event.buf,
--     callback = vim.lsp.buf.clear_references,
--   })
-- end

-- vim.api.nvim_create_autocmd("LspAttach", {
--
--   group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
--   callback = function(event)
--     local client = vim.lsp.get_client_by_id(event.data.client_id)
--     if not client then
--       return
--     end
--     P(client)
--     if client.server_capabilities.inlayHintProvider then
--       -- TODO :Make sure this inlay is enabled only to the buffer
--       vim.lsp.inlay_hint.enable(true)
--     end
--   end,
-- })
--
--

-- Mini.keymaps
local map_combo = require("mini.keymap").map_combo
mode = {"n", "x", "i", "c" }
map_combo( mode, "jk", "<BS><BS><Esc>", { desc = "Exit mode" })

-- Make mappings
vim.keymap.set("n", "<leader>m", function()
  require("custom.async_make").make()
end, { desc = "Make project" })

vim.keymap.set("n", "<leader>M", function()
    local path = {"C:\\Program Files\\SEGGER\\JLink_V798b\\JFlash.exe",
        "-open",
        "C:\\Workspace\\Alsmart.ECL.MainController.Main\\Output\\VSCode\\AlsmartECL_MainAndBootloader.hex",
        "-auto",
        "-min",
        "-exit"
    }
    vim.system(path)
end, { desc = "Make project" })
