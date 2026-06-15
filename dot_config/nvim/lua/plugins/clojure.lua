return {
  -- Conjure: Clojure等のLisp系言語向け対話的REPL開発環境。
  -- nREPLに接続し、フォーム/バッファ/選択範囲を評価、結果をログバッファに表示。
  -- `<localleader>ee` で現在のフォームを評価、`<localleader>eb` でバッファ全体を評価など。
  {
    'Olical/conjure',
    ft = { 'clojure' },
    init = function()
      vim.g['conjure#mapping#doc_word'] = 'gK'
      vim.g['conjure#filetype#scheme'] = false
      vim.g['conjure#filetype#fennel'] = false
      vim.g['conjure#filetype#janet'] = false
      vim.g['conjure#filetype#lua'] = false
      vim.g['conjure#filetype#python'] = false
      vim.g['conjure#log#hud#width'] = 0.6
      vim.g['conjure#log#hud#height'] = 0.5
    end,
  },

  -- vim-jack-in: Leiningen/deps.edn/boot プロジェクトのnREPLを Neovim から起動。
  -- `:Lein`(leiningen)、`:Clj`(tools.deps)、`:Boot`(boot) コマンドでREPLを自動起動し、
  -- Conjureが自動接続できる状態にする。tpope/vim-dispatch を非同期実行基盤として使用。
  {
    'clojure-vim/vim-jack-in',
    ft = { 'clojure' },
    dependencies = {
      -- vim-dispatch: 非同期コマンド実行フレームワーク。
      'tpope/vim-dispatch',
      -- vim-dispatch-neovim: vim-dispatch を Neovim の :terminal で動作させるアダプタ。
      'radenling/vim-dispatch-neovim',
    },
  },

  -- nvim-paredit: S式単位の構造的編集 (slurp / barf / raise / wrap / splice 等)。
  -- treesitterのASTを用いるため、誤った括弧操作を防ぎつつ括弧の移動・包含関係を編集できる。
  -- 例: `>)` で次の要素をフォームに取り込む(slurp)、`<)` で末尾要素を外に出す(barf)。
  {
    'julienvincent/nvim-paredit',
    ft = { 'clojure', 'scheme', 'lisp', 'fennel' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('nvim-paredit').setup({
        use_default_keys = true,
        indent = {
          enabled = true,
        },
      })
    end,
  },
}
