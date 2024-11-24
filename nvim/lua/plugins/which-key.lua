return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {},
  keys = {
    -- Customize default
    {
      '<Esc>',
      [[<C-\><C-n>]],
      mode = 't',
      desc = 'Exit terminal mode to normal mode'
    },
    -- Move window pane
    {
        '<M-h>',
        '<C-w>h',
        mode = 'n',
        desc = 'Move to left window',
    },
    {
        '<M-j>',
        '<C-w>j',
        mode = 'n',
        desc = 'Move to below window',
    },
    {
        '<M-k>',
        '<C-w>k',
        mode = 'n',
        desc = 'Move to above window',
    },
    {
        '<M-l>',
        '<C-w>l',
        mode = 'n',
        desc = 'Move to right window',
    },
    -- Which key
    {
      '<leader>?',
      function()
        require('which-key').show({ global = false })
      end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
    -- barbar
    {
      '<Tab>',
      '<cmd>BufferNext<CR>',
      desc = 'Move to next tab (Barbar)'
    },
    {
      '<S-Tab>',
      '<cmd>BufferPrevious<CR>',
      desc = 'Move to prev tab (Barbar)'
    },
    -- Gitsigns
    {
      ']c',
      function()
        return vim.wo.diff and ']c' or '<cmd>Gitsigns next_hunk<CR>'
      end,
      expr = true,
      desc = 'Next hunk (Gitsigns)',
    },
    {
      '[c',
      function()
        return vim.wo.diff and '[c' or '<cmd>Gitsigns prev_hunk<CR>'
      end,
      expr = true,
      desc = 'Previous hunk (Gitsigns)',
    },
    {
      '<leader>hs',
      function ()
        require('gitsigns').stage_hunk()
      end,
      desc = 'Stage hunk (Gitsigns)',
    },
    {
       '<leader>hu',
       '<cmd>Gitsigns undo_stage_hunk<CR>',
       desc = 'Undo stage hunk (Gitsigns)',
    },
    {
      '<leader>hr',
      '<cmd>Gitsigns reset_hunk<CR>',
      desc = 'Reset hunk (Gitsigns)',
    },
    {
      '<leader>hR',
      '<cmd>Gitsigns reset_buffer<CR>',
      desc = 'Reset buffer (Gitsigns)',
    },
    {
      '<leader>hp',
      '<cmd>Gitsigns preview_hunk<CR>',
      desc = 'Preview hunk (Gitsigns)',
    },
    {
      '<leader>hb',
      '<cmd>Gitsigns blame_line<CR>',
      desc = 'Blame line (Gitsigns)',
    },
    {
      '<leader>h',
      group = 'Git',
    },
    -- DAP
    {
      '<leader>6',
      '<cmd>lua require\'dap\'.continue()<CR>',
      desc = 'Continue (DAP)',
    },
    {
      '<leader>7',
      '<cmd>lua require\'dap\'.step_over()<CR>',
      desc = 'Step Over (DAP)',
    },
    {
      '<leader>8',
      '<cmd>lua require\'dap\'.step_into()<CR>',
      desc = 'Step Into (DAP)',
    },
    {
      '<leader>9',
      '<cmd>lua require\'dap\'.step_out()<CR>',
      desc = 'Step Out (DAP)',
    },
    {
      '<leader>;',
      '<cmd>lua require\'dap\'.toggle_breakpoint()<CR>',
      desc = 'Toggle Breakpoint (DAP)',
    },
    {
      '<leader>\'',
      '<cmd>lua require\'dap\'.set_breakpoint(vim.fn.input(\'Breakpoint condition: \'))<CR>',
      desc = 'Set Conditional Breakpoint (DAP)',
    },
    {
      '<leader>i',
      '<cmd>lua require\'dap\'.set_breakpoint(nil, nil, vim.fn.input(\'Log point message: \'))<CR>',
      desc = 'Set Log Point (DAP)',
    },
    {
      '<leader>d',
      '<cmd>lua require\'dapui\'.toggle()<CR>',
      desc = 'Toggle DAP UI (DAP)',
    },
    {
      '<leader><leader>d',
      '<cmd>lua require\'dapui\'.eval()<CR>',
      desc = 'Evaluate Expression (DAP)',
    },
  },
}
