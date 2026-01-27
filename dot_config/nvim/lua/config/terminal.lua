-- Neovim内でターミナルを開いたときの挙動について設定をする
-- TermOpen: ターミナルバッファが開いた瞬間のイベントを設定する
vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
        -- ウィンドウ固有のオプションを設定
        vim.wo.number = false
        -- 相対行番号を非表示
        vim.wo.relativenumber = false
        -- ターミナルを開いたらすぐに文字入力モードにする
        vim.cmd("startinsert")
        -- サイン列を非表示
        vim.wo.signcolumn = "no"
    end,
})
