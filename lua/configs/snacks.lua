require('telescope').setup {
  defaults = {
    -- Your default configuration here
  },
  pickers = {
    -- Your custom pickers here
  },
  extensions = {
    -- Your extensions here
  }
}

-- Define a custom function to list scratch buffers
local telescope = require('telescope')
local finders = require('telescope.finders')
local pickers = require('telescope.pickers')
local sorters = require('telescope.sorters')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

local function list_scratch_buffers()
  local scratches = require('snacks').list() -- Get the list of scratch buffers

  pickers.new({}, {
    prompt_title = 'Scratch Buffers',
    finder = finders.new_table {
      results = scratches,
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry.name,
          ordinal = entry.name
        }
      end
    },
    sorter = sorters.get_generic_fuzzy_sorter(),
    attach_mappings = function(_, map)
      map('i', '<CR>', function(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        -- Open the selected scratch buffer
        require('snacks').open(selection.value.id)
      end)
      return true
    end
  }):find()
end

-- Map the custom function to a keybinding
vim.api.nvim_set_keymap('n', '<leader>sb', ':lua list_scratch_buffers()<CR>', { noremap = true, silent = true })
