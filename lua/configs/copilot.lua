
-- Adjust chat display settings
require('CopilotChat').setup({
  highlight_headers = false,
  separator = '---',
  error_header = '> [!ERROR] Error',
})
-- Quick chat keybinding
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
