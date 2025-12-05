local M = {}

local stackmap = require("utils.stackmap")
local stackmap = require("utils.windows_utils")

M.setup = function()
    -- do nothing
end

M._state = {
    screens_config = {},
    keymaps = {},
    options = {}
}
local function create_floating_window(config, enter)
    if enter == nil then
        enter = false
    end


    -- local buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
    -- local win = vim.api.nvim_open_win(buf, enter or false, config)

    return { buf = 10, win = 20 }
end

M.create_screens = function (windows_config, keymaps)
    for window, config in pairs(windows_config) do
        M._state.screens_config[window]= create_floating_window(config,true)
    end
    -- stackmap.push("Testing",'n',keymaps)
    -- M._state.keymaps = keymaps
    P(M._state)
    -- P(stackmap._stack)
end

M.destroy_screens = function ()

    local screens_config=M._state.screens_config
    -- for window, config in pai
    -- stackmap.pop("Testing",'n')
end

M.windowsconfig = {
    main_window = {
        config = {
            relative='editor',
            row=3,
            col=3,
            width=vim.o.columns - 6,
            height=vim.o.lines - 6,
            border = "rounded"
        },
    },
    task_window = {
        config = {
            relative='win',
            row=3,
            col=3,
            width=20,
            height=10,
            border = "rounded"
        },
    }
}

M.keymaps = {
  ["<leader>st"] = "echo 'Hello'",
  ["<leader>sz"] = "echo 'Goodbye'",
}
M.jump_window = function (window_name)
    local screen = M._state.screens_config[window_name]
    if screen then
        vim.api.nvim_set_current_win(screen.win)
    else
        print("No such window: " .. window_name)
    end
end

vim.api.nvim_create_user_command("CScreens", function ()
    M.destroy_screens()
end, {})

-- M.create_screens(M.windowsconfig, M.keymaps)


-- local buf = vim.api.nvim_create_buf(false,true)
-- local win = vim.api.nvim_open_win(buf, true, config)
-- local buflist = vim.api.nvim_list_bufs()
-- print(vim.inspect(buflist))


return M
