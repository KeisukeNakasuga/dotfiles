return {
  'rmagatti/auto-session',
  lazy = false,
  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  config = function ()
    vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
    require('auto-session').setup({
      log_level = 'info',
      auto_session_enable_last_session = true,
      auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
    })
  end
}
