local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values



local websites_list = {
	{ name = "Google", url = "https://google.com/search?q=" },
	{ name = "YouTube", url = "https://www.youtube.com/results?search_query=" },
	{ name = "GitHub", url = "https://github.com/search?q=" },
	{ name = "Stack Overflow", url = "https://stackoverflow.com/search?q=" },
	{ name = "DuckDuckGo", url = "https://duckduckgo.com/?q=" },
	{ name = "Wikipedia", url = "https://en.wikipedia.org/wiki/" },
	{ name = "RA8 user guide", url = "file:///C:/Users/U431502/OneDrive%20-%20Danfoss/Documents/Alsmart/RA8%20user%20manual.pdf#:~:text=" },
	{ name = "AlsmartECL docs", url = "https://danfoss.visualstudio.com/HD-RD-E/_search?text=embedded*&type=wiki&lp=dashboard-Project&pageSize=25" },
}

local site_select = function(opts)
	opts = opts or {}
	pickers.new(opts, {
		prompt_title = "Select a website",
		finder = finders.new_table({
			results = websites_list,
			entry_maker = function(entry)
				return {
					value = entry,
					display = entry.name,
					ordinal = entry.name,
				}
			end,
		}),
		sorter = conf.generic_sorter(opts),
		attach_mappings = function(prompt_bufnr, map)
			local open_selected_website = function()
				local selection = require("telescope.actions.state").get_selected_entry()
				require("telescope.actions").close(prompt_bufnr)
				vim.ui.input({prompt = "Search query: "}, function(input)
					if input == nil then
						return
					end
					local url = selection.value.url .. (input or "")
					vim.ui.open(url, { wait = false })
                    print(url)
				end)
			end
			map("i", "<CR>", open_selected_website)
			map("n", "<CR>", open_selected_website)
			return true
		end,
	}):find()
end
vim.api.nvim_create_user_command("UISelect", site_select, {})

vim.api.nvim_create_user_command("GPS",function ()
    local file_path = vim.fn.expand("%:p")
    print(file_path)
    vim.fn.setreg('+', file_path) -- write to clippoard
end
    , { nargs = 0 })




