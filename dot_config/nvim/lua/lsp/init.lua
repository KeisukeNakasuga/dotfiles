vim.diagnostic.config({
  virtual_text = true
})

vim.lsp.config('*', {
  root_markers = { '.git' }
})

local lua_ls_opts = require('lsp.lua_ls')
vim.lsp.config('lua_ls', lua_ls_opts)
vim.lsp.enable('lua_ls')

local clangd_opts = require('lsp.clangd')
vim.lsp.config('clangd', clangd_opts)
vim.lsp.enable('clangd')

local pyright_opts = require('lsp.pyright')
vim.lsp.config('pyright', pyright_opts)
vim.lsp.enable('pyright')

local ts_ls_opts = require('lsp.ts_ls')
vim.lsp.config('ts_ls', ts_ls_opts)
vim.lsp.enable('ts_ls')

local docker_compose_language_service_opts = require('lsp.docker_compose_language_service')
vim.lsp.config('docker_compose_language_service', docker_compose_language_service_opts)
vim.lsp.enable('docker_compose_language_service')

local dockerls_opts = require('lsp.dockerls')
vim.lsp.config('dockerls', dockerls_opts)
vim.lsp.enable('dockerls')

local yamlls_opts = require('lsp.yamlls')
vim.lsp.config('yamlls', yamlls_opts)
vim.lsp.enable('yamlls')

local svelte_opts = require('lsp.svelte')
vim.lsp.config('svelte', svelte_opts)
vim.lsp.enable('svelte')


-- inlay hint
vim.keymap.set("n", "<leader>uh", function()
  local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
  vim.lsp.inlay_hint.enable(not enabled, { bufnr = 0 })
end, { desc = "Toggle Inlay Hints" })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})
