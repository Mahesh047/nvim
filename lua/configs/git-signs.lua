require('gitsigns').setup{
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end)

    -- Actions
    map('n', '<leader>gs', gitsigns.stage_hunk, {desc = "[g]itsigns [s]tage hunks"})
    map('n', '<leader>gr', gitsigns.reset_hunk, {desc = "[g]itsigns [r]eset hunks"})
    map('v', '<leader>gs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {desc = "[g]itsigns [s]tage hunk"})
    map('v', '<leader>gr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {desc = "[g]itsigns [r]eset hunk"})
    map('n', '<leader>gS', gitsigns.stage_buffer, {desc = "[g]itsigns [S]tage buffer"})
    map('n', '<leader>gu', gitsigns.undo_stage_hunk, {desc = "[g]itsigns [u]ndo stage hunk"})
    map('n', '<leader>gR', gitsigns.reset_buffer, {desc = "[g]itsigns [R]eset buffer"})
    map('n', '<leader>gp', gitsigns.preview_hunk, {desc = "[g]itsigns [p]review hunk"})
    map('n', '<leader>gP', gitsigns.preview_hunk_inline, {desc = "[g]itsigns [P]review hunk inline"})
    map('n', '<leader>gb', function() gitsigns.blame_line{full=true} end, {desc = "[g]itsigns [b]lame line"})
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
    map('n', '[g', gitsigns.prev_hunk, {desc = "[g]itsigns prev hunk"})
    map('n', ']g', gitsigns.next_hunk, {desc = "[g]itsigns next hunk"})

    map('n', '<leader>gd', gitsigns.diffthis)
    -- map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
        -- ---dkfafa
    -- map('n', '<leader>td', gitsigns.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
