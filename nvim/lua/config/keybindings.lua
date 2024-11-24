-- ターミナル
-- 新規タブでターミナルモードを起動
vim.api.nvim_set_keymap('n', 'tt', '<cmd>terminal<CR>', { noremap = true, silent = true })
-- 下分割でターミナルモードを起動
vim.api.nvim_set_keymap('n', 'tx', '<cmd>belowright new<CR><cmd>terminal<CR>', { noremap = true, silent = true })
-- 縦分割で右側にターミナルモードを起動
vim.api.nvim_set_keymap('n', 'tv', '<cmd>rightbelow vsplit<CR><cmd>terminal<CR>', { noremap = true, silent = true })
-- ターミナルモードで行番号を非表示にする
vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
        vim.wo.number = false      -- 通常の行番号を非表示
        vim.wo.relativenumber = false -- 相対行番号を非表示
    end,
})