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

    function _lazygit_toggle()
      vim.cmd([[wincmd h | while winnr() > 1 | wincmd h | endwhile]])
      local Terminal = require("toggleterm.terminal").Terminal           
      local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
      lazygit:toggle()
    end

    vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
  end
}
