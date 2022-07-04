local augroup = require("easy-augroup")
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
opt.foldmethod = "indent"
-- opt.foldenable = false
-- opt.foldcolumn = "auto"
opt.foldlevel = 99
opt.mouse = "a"
opt.splitright = true
opt.splitbelow = true
opt.cursorline = true
opt.colorcolumn = { 100 }
opt.switchbuf = "useopen"

opt.signcolumn = "yes"
opt.hidden = true

-- Some servers have issues with backup files, see #649.
opt.backup = false
opt.writebackup = false

opt.cmdheight = 1

opt.updatetime = 1000

-- Don't pass messages to |ins-completion-menu|.
opt.shortmess:append("c")

-- don't give the intro message when starting Vim
opt.shortmess:append("I")

opt.laststatus = 2

vim.cmd("autocmd BufNewFile,BufRead *.json setlocal filetype=jsonc")

local map_opts = { noremap = true, silent = true }

-- use Ctrl+h/j/k/l to switch window
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", map_opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", map_opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", map_opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", map_opts)

-- buffer switch
-- vim.api.nvim_set_keymap("n", "[b", "<CMD>bprevious<CR>", map_opts)
-- vim.api.nvim_set_keymap("n", "]b", "<CMD>bnext<CR>", map_opts)

-- buffer switch
vim.api.nvim_set_keymap("n", "[t", "<CMD>tabpre<CR>", map_opts)
vim.api.nvim_set_keymap("n", "]t", "<CMD>tabnext<CR>", map_opts)

-- save
vim.api.nvim_set_keymap("n", "<space>fs", "<CMD>w<CR>", map_opts)

-- close window
vim.api.nvim_set_keymap("n", "<Leader>eq", "<CMD>q<CR>", map_opts)

-- delete buffer
vim.api.nvim_set_keymap("n", "<Leader>c", "<CMD>bdelete<CR>", map_opts)

vim.api.nvim_set_keymap("n", "<Leader><Leader>r", "<CMD>set relativenumber<CR>", map_opts)
vim.api.nvim_set_keymap("n", "<Leader><Leader>n", "<CMD>set norelativenumber<CR>", map_opts)

vim.api.nvim_set_keymap("n", "<M-h>", "<CMD>nohlsearch<CR>", map_opts)

-- open quickfix
vim.api.nvim_set_keymap("n", ";c", "<CMD>copen<CR>", map_opts)

-- disable serach highlight
vim.api.nvim_set_keymap("n", "<M-h>", "<CMD>nohlsearch<CR>", map_opts)

vim.api.nvim_set_keymap("i", "jj", "<Esc>", map_opts)

-- better indent in visual mode
vim.api.nvim_set_keymap("x", ">", ">gv", map_opts)
vim.api.nvim_set_keymap("x", "<", "<gv", map_opts)

vim.api.nvim_set_keymap("n", "d", '"_d', map_opts)
vim.api.nvim_set_keymap("n", "dd", '"_dd', map_opts)
vim.api.nvim_set_keymap("n", "D", '"_D', map_opts)
vim.api.nvim_set_keymap("x", "d", '"_d', map_opts)
vim.api.nvim_set_keymap("n", "c", '"_c', map_opts)

augroup.create_hl_group("SetDiffColor", {
  { name = "DiffAdd", value = { fg = "None", bg = "#4b5632" } },
  { name = "DiffChange", value = { fg = "None", bg = "#4b1818" } },
  { name = "DiffDelete", value = { fg = "None", bg = "#6f1313" } },
  { name = "DiffText", value = { fg = "None", bg = "#6f1313" } },
})

-- Highlight on yank
augroup.create_cmd_group("HighlightYank", {
  {
    event = "TextYankPost",
    opts = {
      pattern = "*",
      callback = function()
        vim.highlight.on_yank()
      end,
    },
  },
})

-- auto indent when type a at the beginning of a line
function _G.handleNormalA()
  local keys = "a"
  if vim.fn.col(".") ~= 1 then
    return keys
  end
  local ft = vim.bo.filetype
  -- does not work on some filetype, e.g. markdown
  local white_list = {
    "c",
    "cpp",
    "go",
    "python",
    "lua",
    "sh",
    "java",
    "rust",
    "json",
  }
  if vim.tbl_contains(white_list, ft) then
    keys = vim.api.nvim_replace_termcodes("a<C-f>", true, true, true)
  end
  return keys
end

vim.api.nvim_set_keymap("n", "a", "v:lua.handleNormalA()", { noremap = true, expr = true })

vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  once = true,
  callback = require("open-recent").open_recent,
})
