local g = vim.g
-- キーマップの支点をスペースキーに設定
g.mapleader = " "
g.maplocalleader = "\\"
-- .editorconfigファイルがある場合、その設定を優先
g.editorconfig = true

local opt = vim.opt
-- 行番号を表示
opt.number = true
-- 改行時に前の行のインデントを継続
opt.autoindent = true
-- tabを押した時にスペースを入力
opt.expandtab = true
-- 自動インデントの幅をスペース2つ分にする
opt.shiftwidth = 2
-- ファイルの保存/バックアップの設定
opt.directory = os.getenv("HOME") .. "/.vim/swap//"
-- 永続的なundo操作を有効化
opt.undofile = true
-- フォント設定
opt.guifont = "Hack Nerd font:h10"
local undodir = vim.fn.expand("$HOME/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p")
end
opt.undodir = undodir
-- Neovim内でヤンクしたテキストをOSのクリップボードにも反映する
opt.clipboard = "unnamedplus"
-- 検索時に大文字小文字を区別しない
opt.ignorecase = true
-- 大文字を入力したときだけ区別する
opt.smartcase = true
