return {
  'nvim-telescope/telescope.nvim',
  dependencise = {
    'nvim-lua/plenary.nvim'
  },
  keys = {
    { '<leader>ff', function() require('telescope.builtin').find_files() end, desc = 'Telescope find files' },
    { '<leader>fg', function() require('telescope.builtin').live_grep() end, desc = 'Telescope live grep' },
    { '<leader>fb', function() require('telescope.builtin').buffers() end, desc = 'Telescope buffers' },
    { '<leader>fh', function() require('telescope.builtin').help_tags() end, desc = 'Telescope help tags' },
  },
  config = function ()
    require('telescope').setup({
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false, -- Ctrl+u を無効化
            ['<C-d>'] = false, -- Ctrl+d を無効化
          },
        },
      },
    })
  end
}
