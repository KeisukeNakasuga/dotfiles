return {
  'lewis6991/gitsigns.nvim',
  opt = {},
  config = function ()
    require('gitsigns').setup {
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 100,
        ignore_white_space = false,
      }
    }
    vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = "#bbbbbb", italic = true })
  end,
}
