return {
  "RRethy/vim-illuminate",
  config = function()
    require("illuminate").configure({
      delay = 100,
      filetype_blacklist = {
        "DirDiff",
        "packer",
        "NvimTree",
        "toggleterm",
        "aerial",
        "Outline",
      },
      modes_blacklist = {
        "t",
      },
      providers = {
        "lsp",
        "treesitter",
        "regex",
      },
      min_count_to_highlight = 1,
    })
  end,
}
