return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'ahmedkhalf/project.nvim'
  },
  config = function(_, opts)
    local telescope = require('telescope')
    telescope.setup(opts)

    telescope.load_extension('projects')

    require('project_nvim').setup({
      detection_methods = { "lsp", "pattern" },
      patterns = { ".git", "package.json" }
    })
  end,
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
    { '<leader>fm', function() require('telescope.builtin').man_pages() end, desc = 'Telescope man pages' },
    { '<leader>fp', function() require('telescope').extensions.projects.projects{} end, desc = 'Search project' }
  },
}


