local M = {}

local _make_bufnr = 0
local _make_winid = 0

M.get_window_config = function ()
    return _make_bufnr, _make_winid
end
M.drawWindow = function ()
    _make_bufnr = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_command("botright split")
    _make_winid = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_config(_make_winid, {
        height = math.floor(vim.o.lines/4)or 10,
    })
    vim.api.nvim_win_set_buf(_make_winid,_make_bufnr)
    return _make_bufnr, _make_winid
end

M._bottowRowConfig = {
    split = 'below',
    height = 10,
}

vim.api.nvim_buf_create_user_command(0, "Makesplit",function ()
    M.drawWindow()
end,{})

-- M.drawWindow()

return M
