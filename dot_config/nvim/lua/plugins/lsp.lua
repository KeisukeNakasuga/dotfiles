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
          'clangd',
          'pyright',
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
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap=true, silent=true })
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
      local luasnip = require("luasnip")
      local cmp = require('cmp')

      cmp.setup({
        completion = {
          autocomplete = { require('cmp.types').cmp.TriggerEvent.TextChanged },
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end
        },
        mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping(function(fallback)
           if cmp.visible() then
             cmp.select_next_item()
           elseif luasnip.expand_or_jumpable() then
             luasnip.jump(1)
           else
             fallback()
           end
         end, { "i", "s" }),  -- i:insert mode, s: snippet mode
        }),
        sources = {
          { name = 'nvim_lsp' },
          { name = 'vsnip' },
          { name = 'luasnip' },
          { name = 'buffer' },
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
  },
  {
    'nvimdev/lspsaga.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('lspsaga').setup({
        finder = {
          keys = {
            quit = { 'q', '<ESC>' },
          }
        }
      })
    end,
    keys = {
      { 'K', '<cmd>Lspsaga hover_doc<CR>', desc = 'Hover documentation', mode = 'n' },
      { 'gr', '<cmd>Lspsaga finder<CR>', desc = 'Lspsaga finder (def+ref)', mode = 'n' },
      { 'gp', '<cmd>Lspsaga peek_definition<CR>', desc = 'Peek definition', mode = 'n' },
      { 'ga', '<cmd>Lspsaga code_action<CR>', desc = 'Code action', mode = 'n' },
      { 'gn', '<cmd>Lspsaga rename<CR>', desc = 'rename', mode = 'n' },
      { 'ge', '<cmd>Lspsaga show_line_diagnostics<CR>', desc = 'show_line_diagnostics', mode = 'n' },
      { 'gd', '<cmd>Lspsaga goto_definition<CR>', desc = 'Go to definition', mode = 'n' },
      { '[e', '<cmd>Lspsaga diagnostic_jump_next<CR>', desc = 'jump next', mode = 'n' },
      { ']e', '<cmd>Lspsaga diagnostic_jump_prev<CR>', desc = 'jump prev', mode = 'n' },
      { '<leader>lo', '<cmd>Lspsaga outline<CR>', desc = 'Show Outline', mode = 'n' },
    }
  }
}
