-- ref: https://lazy.folke.io/installation

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- ~/.config/nvim/init.lua または、プラグイン設定を読み込んでいるファイル
vim.api.nvim_create_autocmd('VimEnter', {
  group = vim.api.nvim_create_augroup('LazyPluginCleanup', { clear = true }),
  callback = function()
    local js_debug_path = vim.fn.stdpath('data') .. '/lazy/microsoft_vscode-js-debug' -- Lazy.nvim の命名規則に注意
    js_debug_path = vim.fn.stdpath('data') .. '/lazy/vscode-js-debug'

    if vim.fn.isdirectory(js_debug_path) == 1 then
      -- Gitリポジトリであることを確認
      if vim.fn.isdirectory(js_debug_path .. "/.git") == 1 then
        print("Cleaning vscode-js-debug Git repository...")
        -- ローカルの変更を強制的に破棄
        local status_reset, err_reset = pcall(vim.fn.system, {
          "git", "-C", js_debug_path, "reset", "--hard", "HEAD"
        })
        if not status_reset then
          vim.notify("Error resetting vscode-js-debug: " .. err_reset, vim.log.levels.ERROR)
        end

        -- Untracked files を削除 (doc/tags のようなケースにも対応)
        local status_clean, err_clean = pcall(vim.fn.system, {
          "git", "-C", js_debug_path, "clean", "-fdx"
        })
        if not status_clean then
          vim.notify("Error cleaning vscode-js-debug: " .. err_clean, vim.log.levels.ERROR)
        end

        if status_reset and status_clean then
          print("vscode-js-debug repository cleaned on startup.")
        end
      end
    end

    -- lsp_signature.nvim の doc/tags も同様に処理する場合
    local lsp_signature_path = vim.fn.stdpath('data') .. '/lazy/lsp_signature.nvim'
    if vim.fn.isdirectory(lsp_signature_path) == 1 then
      local doc_tags_file = lsp_signature_path .. "/doc/tags"
      if vim.fn.filereadable(doc_tags_file) == 1 then
        vim.fn.delete(doc_tags_file)
        print("Removed: " .. doc_tags_file .. " on startup.")
      end
    end
  end,
})

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  install = { colorscheme = { 'iceberg' } },
  checker = { enabled = true },
})
