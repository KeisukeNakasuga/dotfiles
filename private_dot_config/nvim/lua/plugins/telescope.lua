return {
  'nvim-telescope/telescope.nvim',
  dependencise = {
    'nvim-lua/plenary.nvim'
  },
  opts = {
    defaults = {
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
      },
      mappings = {
        i = {
          ['<C-u>'] = false,
          ['<C-d>'] = false,
        },
      },
    },
  },
  keys = {
    { '<leader>ff', function() require('telescope.builtin').find_files() end, desc = 'Telescope find files' },
    { '<leader>fg', function()
        require('telescope.builtin').live_grep({
          cwd = vim.fn.getcwd(),
          additional_args = function() return { "--glob", "!.git" } end
        })
      end, desc = 'Telescope live grep'
    },
    { '<leader>fb', function() require('telescope.builtin').buffers() end, desc = 'Telescope buffers' },
    { '<leader>fh', function() require('telescope.builtin').help_tags() end, desc = 'Telescope help tags' },
  },
}
