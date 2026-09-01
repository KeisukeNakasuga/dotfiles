return {
  'pmizio/typescript-tools.nvim',
  ft = { 'typescript', 'typescriptreact' },
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {
    server = {},
    settings = {
      expose_as_code_action = true,
    },
  },
  config = function()
    vim.api.nvim_create_autocmd('VimEnter', {
      callback = function()
        if pcall(require, 'typescript-tools') then
          if type(require('typescript-tools').setup) == 'function' then
             require('typescript-tools').setup(require('typescript-tools.config').opts)
          end
        end
      end,
      once = true,
    })
  end,
}
