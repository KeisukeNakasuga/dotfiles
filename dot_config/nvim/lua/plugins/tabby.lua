return {
  'nanozuki/tabby.nvim',
  -- event = 'VimEnter', -- if you want lazy load, see below
  dependencies = 'nvim-tree/nvim-web-devicons',
  keys = {
    { '<leader>ta', ":$tabnew<CR>", desc = 'Open a new tab' },
    { '<leader>tc', ":tabclose<CR>", desc = 'Close current tab' },
    { '<leader>to', ":tabonly<CR>", desc = 'Close all other tabs' },
    { '<leader>tn', ":tabn<CR>", desc = 'Go to the next tab' },
    { '<leader>tp', ":tabp<CR>", desc = 'Go to the previous tab' },
    { '<leader>tmp', ":-tabmove<CR>", desc = 'Move current tab to previous position' },
    { '<leader>tmn', ":+tabmove<CR>", desc = 'Move current tab to next position' },
  },
  config = function()
    -- configs...
  end,
}
