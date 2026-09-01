return {
  'nvim-treesitter/nvim-treesitter',
  -- main ブランチ（Neovim 0.11+ 対応の新API）。master は凍結済みで 0.12 と非互換のため移行
  branch = 'main',
  -- main ブランチは lazy-loading 非対応。起動時に必ず読み込む
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').setup({})

    -- 使用するパーサーをインストール（非同期 / 既にあれば no-op）
    require('nvim-treesitter').install({
      'c',
      'cpp',
      'python',
      'lua',
      'javascript',
      'typescript',
      'tsx',
      'html',
      'css',
      'svelte',
      'vim',
      'vimdoc',
      'clojure',
    })

    -- main ブランチでは highlight が自動で有効にならないため、
    -- ファイルタイプごとに parser があれば treesitter ハイライトを開始する
    vim.api.nvim_create_autocmd('FileType', {
      callback = function(args)
        local ft = vim.bo[args.buf].filetype
        local lang = vim.treesitter.language.get_lang(ft)
        if not lang then
          return
        end
        -- parser が利用可能なときだけハイライトを開始
        if pcall(vim.treesitter.language.add, lang) then
          pcall(vim.treesitter.start, args.buf, lang)

          -- treesitter ベースのインデントを使うファイルタイプ。
          -- 標準 indent（GetTypescriptIndent 等）は switch内 break・アロー関数本体・
          -- メソッドチェーンの継続行を正しくインデントできないため、これらは treesitter に任せる。
          -- main ブランチの treesitter indent は experimental だが上記ケースで明確に優れる。
          local ts_indent_ft = {
            typescript = true,
            typescriptreact = true,
            javascript = true,
            javascriptreact = true,
          }
          if ts_indent_ft[ft] then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end
      end,
    })
  end,
}
