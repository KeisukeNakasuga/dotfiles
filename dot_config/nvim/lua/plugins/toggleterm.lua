return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function ()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = 'float',
      close_on_exit = true,
      shell = vim.o.shell,  
    })

    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      hidden = true,
      direction = "float",
      on_open = function(term)
        -- ESC で lazygit を閉じる
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<Esc>", "<C-\\><C-n>iqq", { noremap = true, silent = true })
      end,
    })

    function _lazygit_toggle()
      lazygit:toggle()
    end

    vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "*",
      callback = function()
        vim.api.nvim_buf_set_keymap(0, "t", "<Esc>", "<C-\\><C-n>i<Cmd>ToggleTerm<CR>", { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(0, "n", "<Esc>", "<Cmd>ToggleTerm<CR>", { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(0, "i", "<Esc>", "<Cmd>ToggleTerm<CR>", { noremap = true, silent = true })
      end,
    })
  end
}
