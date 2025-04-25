return {
--   {
--     'cocopon/iceberg.vim',
--     lazy = false,
--     priority = 1000,
--     opts = {},
--     config = function()
--       vim.cmd([[colorscheme iceberg]])
--     end,
--   },
  {
     'folke/tokyonight.nvim',
     lazy = false,
     priority = 1000,
     opts = {
      style = 'night',
      transparent = true,
      sidebars = 'transparent',
      floats = 'transparent'
    },
     config = function()
       vim.cmd([[colorscheme tokyonight-night]])
       vim.cmd([[
         highlight Normal guibg=NONE ctermbg=NONE
         highlight NormalNC guibg=NONE ctermbg=NONE
         highlight EndOfBuffer guibg=NONE ctermbg=NONE
         highlight NvimTreeNormal guibg=NONE ctermbg=NONE
         highlight NvimTreeNormalNC guibg=NONE ctermbg=NONE
         highlight NvimTreeEndOfBuffer guibg=NONE ctermbg=NONE
         ]])
       end,
   }
}
