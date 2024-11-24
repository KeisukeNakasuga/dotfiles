vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
        vim.wo.number = false      -- 通常の行番号を非表示
        vim.wo.relativenumber = false -- 相対行番号を非表示
    end,
})
