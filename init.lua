vim.g.mapleader = " "

-- put this in your main init.lua file ( before lazy setup )
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
    { import = "plugins" },
}, lazy_config)

dofile(vim.g.base46_cache .. "defaults")
-- dofile(vim.g.base46_cache .. "statusline")


vim.schedule(function()
    require "mappings"
    require "options"
    require "custom.notes"
    require "custom.unit_test"
    require "custom.custom_user_commands"
    require("chadrc")
end)

vim.lsp.enable({ "clangd", "lua_ls", "pyright" })
