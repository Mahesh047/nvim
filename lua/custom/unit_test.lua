local vim = vim
local Snacks = require("snacks")
local notes_state = {
	floating = {
		win = -1,
		buf = -1
	},

}
local function mergeAndReturnTable(table1, table2)
	local tablecopy = {}
	for k, v in pairs(table1) do
		tablecopy[k] = v
	end
	for k, v in pairs(table2) do
		tablecopy[k] = v
	end
	return tablecopy
end


local function open_notes_window(opts)
	opts = opts or {}
	-- local win = require("Snacks").win()
    local width = opts.width or math.floor(vim.o.columns * 0.8)
    local height = opts.height or math.floor(vim.o.lines * 0.8)
    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 2)
	local window_config = {
		relative = "editor",
		border = "rounded",
		style = "minimal",
		width = width,
		height = height,
		col = col,
		row = row,
	}

	if notes_state.floating.win == -1 then
		notes_state.floating.win = Snacks.win.new(window_config)
		notes_state.floating.buf = notes_state.floating.win.buf
		vim.api.nvim_set_option_value("modifiable", true,{})
	elseif vim.api.nvim_get_current_buf() == notes_state.floating.buf then
		vim.api.nvim_win_hide(0)
	else
		vim.api.nvim_open_win(notes_state.floating.win.buf, true, window_config)
	end


end

local function get_filename_without_extension(filepath)
  -- Extract just the filename from the path if there's a path
  local filename = filepath:match("([^/\\]+)$") or filepath
  
  -- Remove the extension
  local name_without_extension = filename:match("(.+)%..+$") or filename
  
  return name_without_extension
end

local function get_search_command(search_term)
	local search_command = get_filename_without_extension(search_term)
	search_command = "fd " .. "^test_" .. search_command .. ".*" .. " --type f --hidden --exclude .git"
	return search_command

end

local function perform_unit_tests()
	local bufnr = 22
	local command = nil
	local current_file_name = vim.fn.expand("%:t")
	command = get_search_command(current_file_name)

	local result = vim.fn.system(command)
	vim.api.nvim_buf_set_lines(bufnr,0,-1, false, vim.split(result, "\n"))
end
vim.api.nvim_create_user_command("UnitTests", perform_unit_tests, {})
vim.keymap.set("n", "<A-u>", perform_unit_tests,{desc = "Unit tests for the file"})
