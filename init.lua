local opt = vim.opt

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.number = true
opt.relativenumber = true
opt.scrolloff = 3
opt.clipboard = "unnamedplus"

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
opt.smartindent = true
opt.smarttab = true
opt.expandtab = true
opt.termguicolors = true

vim.g.mapleader = ","
opt.pastetoggle = "<leader>q"
opt.foldmethod = "manual"
opt.mouse = "a"
opt.splitright = true
opt.splitbelow = true
opt.cursorline = true
opt.colorcolumn = {100}
opt.switchbuf = "useopen"

opt.signcolumn = "yes"
opt.hidden = true

-- Some servers have issues with backup files, see #649.
opt.backup = false
opt.writebackup = false

opt.cmdheight = 2

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
opt.updatetime = 300

-- Don't pass messages to |ins-completion-menu|.
opt.shortmess:append("c")

opt.laststatus = 2

local map_opts = {noremap = true}

-- use Ctrl+h/j/k/l to switch window
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", map_opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", map_opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", map_opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", map_opts)

-- buffer switch
vim.api.nvim_set_keymap("n", "[b", "<CMD>bprevious<CR>", map_opts)
vim.api.nvim_set_keymap("n", "]b", "<CMD>bnext<CR>", map_opts)

-- buffer switch
vim.api.nvim_set_keymap("n", "[t", "<CMD>tabpre<CR>", map_opts)
vim.api.nvim_set_keymap("n", "]t", "<CMD>tabnext<CR>", map_opts)

-- save
vim.api.nvim_set_keymap("n", "<C-s>", "<CMD>w<CR>", map_opts)

-- close window
vim.api.nvim_set_keymap("n", "<Leader>eq", "<CMD>q<CR>", map_opts)

-- delete buffer
vim.api.nvim_set_keymap("n", "<Leader>c", "<CMD>bdelete<CR>", map_opts)

-- TODO: make a toggle function
vim.api.nvim_set_keymap("n", "<Leader><Leader>r", "<CMD>set relativenumber<CR>", map_opts)
vim.api.nvim_set_keymap("n", "<Leader><Leader>n", "<CMD>set norelativenumber<CR>", map_opts)

vim.api.nvim_set_keymap("n", "<M-h>", "<CMD>nohlsearch<CR>", map_opts)

-- open quickfix
vim.api.nvim_set_keymap("n", ";c", "<CMD>copen<CR>", map_opts)

-- disable serach highlight
vim.api.nvim_set_keymap("n", "<M-h>", "<CMD>nohlsearch<CR>", map_opts)

vim.api.nvim_set_keymap("i", "jj", "<Esc>", map_opts)

vim.cmd(
  [[
  augroup SetDiffColor
    autocmd!
    autocmd VimEnter * highlight DiffAdd guifg=None guibg=#4B5632
    autocmd VimEnter * highlight DiffChange guifg=None guibg=#4B1818
    autocmd VimEnter * highlight DiffDelete guifg=None guibg=#6F1313
    autocmd VimEnter * highlight DiffText guifg=None guibg=#6F1313
  augroup END
]]
)

require("plugins")
require("zephyr")

-- local lsf = require("lfs")
-- local loadpath = "./lua"
-- for file in lfs.dir(loadpath) do
--   if file ~= "." and file ~= ".." and file ~= "init.lua" and file ~= "loadend.lua" then
--     local f = loadpath .. "/" .. file
--     local attr = lfs.attributes(f)
--     local filename = string.gsub(file, ".lua$", "")
--     if attr.mode == "file" and file ~= filename then
--       -- print("require("..path..'/'..file..")")
--       local loadf = path .. "/" .. filename
--       print("require " .. loadf)
--     -- require(loadf)
--     end
--   end
-- end
