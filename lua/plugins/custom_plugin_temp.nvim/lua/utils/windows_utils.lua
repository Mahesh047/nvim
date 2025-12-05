local M ={}

M._list_of_buffers = {}

M.get_windows_list = function ()
    local wins = vim.api.nvim_list_wins()
    local win_list = {}
    for _, win in ipairs(wins) do
        local buf = vim.api.nvim_win_get_buf(win)
        table.insert(win_list, {win=win, buf=buf})
    end
    return win_list
end

M.create_a_small_window = function (opts)
    local win_info = opts.win
    local buf = vim.api.nvim_create_buf(false, true)
    local win_width = vim.api.nvim_win_get_width(win_info)
    local win_height = vim.api.nvim_win_get_height(win_info)
    local config = {
        relative = 'win',
        win = win_info,
        width = 2,
        height = 1,
        row = win_height - 4,
        col = 2,
        border = 'rounded',
        anchor = "SW",
        style = 'minimal',
    }
    local win = vim.api.nvim_open_win(buf, true, config)
    return {buf=buf, win=win}
end

M.draw_boxes = function ()
    local wins = M.get_windows_list()
    for i, win_info in ipairs(wins) do
        -- Create a small floating window for each existing window in the bottom left corner
        local opts = {
            win = win_info.win,
        }
        local small_win = M.create_a_small_window(opts)
        -- Write something to the small window buffer
        vim.api.nvim_buf_set_lines(small_win.buf, 0, -1, false, {tostring(i)})
        table.insert(M._list_of_buffers, small_win)
    end
    P(M._list_of_buffers)

end

M.delete_boxes = function ()
    for _, win_info in ipairs(M._list_of_buffers) do
        vim.api.nvim_win_close(win_info.win, true)
        vim.api.nvim_buf_delete(win_info.buf, {force=true})
    end
    M._list_of_buffers = {}
end

-- M.draw_boxes()
return M
