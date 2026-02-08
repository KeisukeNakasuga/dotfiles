return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' },
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'c',
        'cpp',
        'python',
        'lua',
        'javascript',
        'typescript',
        'html',
        'css',
        'svelte',
        'vim',
        'vimdoc'
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      matchup = {
        enable = true
      },
      rainbow = {
        enable = true,
        extended_mode = false,
        max_file_line = 3000,
      },
    })
  end
}
