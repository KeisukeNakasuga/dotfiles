return {
  {
    'williamboman/mason.nvim',
    config = function ()
      require('mason').setup()
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      local mason_lspconfig = require('mason-lspconfig')
      mason_lspconfig.setup({
        ensure_installed = {
          'ts_ls',
          'svelte',
          'lua_ls',
          'yamlls',
          'docker_compose_language_service',
          'dockerls',
        },
        automatic_installation = true,
      })
      mason_lspconfig.setup_handlers({ function (server_name)
        local opt = {
          capabilities = require('cmp_nvim_lsp').default_capabilities(
            vim.lsp.protocol.make_client_capabilities()
          ),
          on_attach = function (client, bufnr)
            -- キーバインド設定は neovim/nvim-lspconfig の方に記載
          end
        }
        require('lspconfig')[server_name].setup(opt)
      end })
    end
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/vim-vsnip',
      'hrsh7th/vim-vsnip-integ',
      'hrsh7th/cmp-vsnip',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim',
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        completion = {
          autocomplete = { require('cmp.types').cmp.TriggerEvent.TextChanged },
        },
        mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = 'nvim_lsp' },
        },
      })
    end
  },
  {
    'neovim/nvim-lspconfig',
    keys = {
      { 'gd', vim.lsp.buf.definition, desc = 'Go to definition', mode = 'n' },
      { 'K',  vim.lsp.buf.hover, desc = 'Hover documentation', mode = 'n' },
      { 'gi', vim.lsp.buf.implementation, desc = 'Go to implementation', mode = 'n' },
      { 'gr', vim.lsp.buf.references, desc = 'List references', mode = 'n' },
    }
  }
}
