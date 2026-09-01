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
  -- `:Lein`(leiningen)、`:Clj`(tools.deps)、`:Boot`(boot) でnREPL(cider-nrepl /
  -- refactor-nrepl ミドルウェア入り)を立ち上げ、Conjureが .nrepl-port 経由で自動接続する。
  --
  -- 本体の :Clj/:Lein/:Boot は vim-dispatch の :Start に投げるが、そのneovimアダプタは
  -- `tabnew` 決め打ちでREPLを新規タブに開いてしまい、split位置を選べない。
  -- 幸い `jack_in#*_cmd()` は起動コマンド文字列を返すだけの関数なので、
  -- :Start を経由せず自前で右側に縦分割してターミナルを開く形で同名コマンドを上書きする。
  -- (これによりvim-dispatch自体が不要になるため依存から外している)
  {
    'clojure-vim/vim-jack-in',
    ft = { 'clojure' },
    config = function()
      -- 右側に縦分割でREPLターミナルを開く。widthはウィンドウ幅の45%。
      -- 起動後はフォーカスを元のソースバッファに戻す(すぐ評価を始められるように)。
      local function jack_in(cmd_builder, args)
        local ok, cmd = pcall(vim.fn[cmd_builder], args)
        if not ok then
          vim.notify('jack-in: コマンド生成に失敗: ' .. tostring(cmd), vim.log.levels.ERROR)
          return
        end

        local src_win = vim.api.nvim_get_current_win()
        vim.cmd('vertical botright ' .. math.floor(vim.o.columns * 0.45) .. 'split')
        vim.cmd('enew')
        vim.fn.jobstart(cmd, { term = true })

        -- config/terminal.lua の TermOpen が startinsert を呼ぶが、その効果は
        -- メインループ復帰時に適用される。先にフォーカスを戻すと挿入モードだけが
        -- ソースバッファに残るため、scheduleで後追いして戻し stopinsert する。
        vim.schedule(function()
          if vim.api.nvim_win_is_valid(src_win) then
            vim.api.nvim_set_current_win(src_win)
          end
          vim.cmd('stopinsert')
        end)
      end

      vim.api.nvim_create_user_command('Clj', function(o)
        jack_in('jack_in#clj_cmd', o.args)
      end, { nargs = '*', desc = 'deps.edn の nREPL を右ペインで起動' })

      vim.api.nvim_create_user_command('Lein', function(o)
        jack_in('jack_in#lein_cmd', o.args)
      end, { nargs = '*', desc = 'Leiningen の nREPL を右ペインで起動' })

      vim.api.nvim_create_user_command('Boot', function(o)
        jack_in('jack_in#boot_cmd', o.args)
      end, { nargs = '*', desc = 'Boot の nREPL を右ペインで起動' })
    end,
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
