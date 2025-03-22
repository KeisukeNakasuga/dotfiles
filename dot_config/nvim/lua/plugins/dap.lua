return {
  {
    'mfussenegger/nvim-dap',
    lazy = true,
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      'mxsdev/nvim-dap-vscode-js',
      'mfussenegger/nvim-dap-python',
      {
        'microsoft/vscode-js-debug',
        build = 'npm install --legacy-peer-deps && npm run compile',
      },
      {
        'williamboman/mason.nvim',
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          table.insert(opts.ensure_installed, 'js-debug-adapter')
        end,
      },
    },
    config = function()
      local dap = require('dap')
      dap.set_log_level('TRACE')

      -- clang
      dap.adapters.gdb = {
        type = 'executable',
        command = 'gdb',
        args = { '--interpreter=dap' }
      }
      dap.configurations.c = {
        {
          name = 'Launch file (gdb)',
          type = 'gdb',
          request = 'launch',
          program = function()
            local default = vim.fn.getcwd() .. '/build/main'
            return vim.fn.input('Path to executable: ', default, 'file')
          end,
          cwd = '${workspaceFolder}',
          stopAtEntry = false,
          args = function()
            local input = vim.fn.input('Program arguments: ')
            return { input }
          end,
        },
      }

      -- python
      local function get_uv_python()
        local cwd = vim.fn.getcwd()
        local uv_python = cwd .. '/.venv/bin/python'
        if vim.fn.filereadable(uv_python) == 1 then
          return uv_python
        else
          -- 見つからなかったら一応デフォルトのPythonパスを返す
          return '/usr/bin/python'
        end
      end

      local dap_python = require('dap-python')
      dap_python.setup(get_uv_python())

      -- js, ts
      dap.adapters['pwa-node'] = {
        type = 'server',
        host = 'localhost',
        port = '${port}',
        executable = {
          command = 'node',
          args = {
            require('mason-registry').get_package('js-debug-adapter'):get_install_path()
            .. '/js-debug/src/dapDebugServer.js',
            '${port}',
          },
        },
      }
      local js_ts_configurations = {
        {
          name = 'Launch file',
          type = 'pwa-node',
          request = 'launch',
          program = '${file}',
          cwd = '${workspaceFolder}',
        },
        {  -- TODO attach with remote process
          name = 'Attach',
          type = 'pwa-node',
          request = 'attach',
          address = 'localhost',
          port = 9229,
          processId = require('dap.utils').pick_process,
          cwd = '${workspaceFolder}',
        },
        {
          name = 'Debug Jest Tests',
          type = 'pwa-node',
          request = 'launch',
          runtimeExecutable = 'node',
          runtimeArgs = {
            './node_modules/jest/bin/jest.js',
            '--runInBand',
          },
          rootPath = '${workspaceFolder}',
          cwd = '${workspaceFolder}',
          console = 'integratedTerminal',
          internalConsoleOptions = 'neverOpen',
        },
        {
          name = 'Launch NestJS',
          type = 'pwa-node',
          request = 'launch',
          runtimeExecutable = 'node',
          runtimeArgs = {
            '--inspect-brk',
            '${workspaceFolder}/dist/main.js',
          },
          cwd = '${workspaceFolder}',
          protocol = 'inspector',
          console = 'integratedTerminal',
        }
      }
      dap.configurations.javascript = js_ts_configurations
      dap.configurations.typescript = js_ts_configurations
      dap.configurations.typescriptreact = js_ts_configurations
    end
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'nvim-neotest/nvim-nio',
    },
    config = function()
      require('dapui').setup({
        icons = { expanded = '', collapsed = '' },
        layouts = {
          {
            elements = {
              { id = 'watches', size = 0.20 },
              { id = 'stacks', size = 0.20 },
              { id = 'breakpoints', size = 0.20 },
              { id = 'scopes', size = 0.40 },
            },
            size = 64,
            position = 'right',
          },
          {
            elements = {
              'repl',
              'console',
            },
            size = 0.20,
            position = 'bottom',
          },
        },
      })
    end
  }
}
