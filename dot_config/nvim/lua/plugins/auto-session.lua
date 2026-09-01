return {
  'rmagatti/auto-session',
  lazy = false,
  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  config = function ()
    -- terminalを含めると:Clj等が開くREPLターミナル(EDNの{}や'を含む長いコマンド名)を
    -- セッションに書き出そうとして:mksessionのエスケープが壊れ、次回起動時にエラーになるため外す。
    vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,localoptions"
    require('auto-session').setup({
      log_level = 'info',
      auto_session_enable_last_session = false,
      auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
      auto_session_use_git_branch = true,
      auto_session_enabled = true,
      auto_save_enabled = true,
      auto_restore_enabled = true,
    })

    vim.api.nvim_create_autocmd("VimEnter", {
      pattern = "*",
      callback = function()
        if vim.fn.argc() == 0 then
          require("auto-session").AutoRestoreSession()
        end
      end,
    })
  end
}
