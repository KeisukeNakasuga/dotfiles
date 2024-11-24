return { {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 40,
      }
    })

    local function is_open_nvim_tree_on_startup()
      local is_directory = vim.fn.isdirectory(vim.fn.expand('%:p')) == 1
      if is_directory or vim.fn.argc() == 0 then
        require("nvim-tree.api").tree.open()
      end
    end
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = is_open_nvim_tree_on_startup,
    })
  end,
  keys = {
    { "<C-n>", ":NvimTreeToggle<CR>", mode = "n", noremap = true, silent = true }
  }
} }
