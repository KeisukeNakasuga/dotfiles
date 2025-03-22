return {
  'shellRaining/hlchunk.nvim',
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      line_num = {
        enable = true,
        use_treesitter = true,
        style = { "#FFD700" },
      },
      chunk = {
        enable = true,
      },
    })
  end
}
