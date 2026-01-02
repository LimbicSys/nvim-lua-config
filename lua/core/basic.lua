local augroup = require("easy-augroup")
local opt = vim.opt
local o = vim.o

o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.smartcase = true
o.number = true
o.relativenumber = true
o.scrolloff = 3
o.clipboard = "unnamedplus"

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.autoindent = true
o.smartindent = true
o.smarttab = true
o.expandtab = true
o.termguicolors = true

vim.g.mapleader = ","
o.foldmethod = "indent"
-- opt.foldenable = false
-- opt.foldcolumn = "auto"
o.foldlevel = 99
o.mouse = "a"
o.splitright = true
o.splitbelow = true
o.cursorline = true
-- opt.colorcolumn = { 100 }
o.switchbuf = "useopen"

o.signcolumn = "yes"
o.hidden = true

-- Some servers have issues with backup files, see #649.
o.backup = false
o.writebackup = false

o.cmdheight = 1

o.updatetime = 1000

-- Don't pass messages to |ins-completion-menu|.
opt.shortmess:append("c")

-- don't give the intro message when starting Vim
opt.shortmess:append("I")

o.laststatus = 3

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

-- tab switch
vim.api.nvim_set_keymap("n", "[t", "<CMD>tabpre<CR>", map_opts)
vim.api.nvim_set_keymap("n", "]t", "<CMD>tabnext<CR>", map_opts)

-- save
vim.api.nvim_set_keymap("n", "<space>fs", "<CMD>w<CR>", map_opts)
vim.api.nvim_set_keymap("n", "<C-s>", "<CMD>w<CR>", map_opts)

-- close window
-- vim.api.nvim_set_keymap("n", "<Leader>eq", "<CMD>q<CR>", map_opts)

-- delete buffer
-- vim.api.nvim_set_keymap("n", "<Leader>c", "<CMD>bdelete<CR>", map_opts)

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

local function edit_cur_dir_file()
  local buf_name = vim.fn.bufname()
  local cur_dir = vim.fn.fnamemodify(buf_name, ":h")
  return ":e " .. cur_dir .. "/"
end

vim.keymap.set("n", "<space>.", edit_cur_dir_file, { expr = true })

augroup.create_hl_group("SetDiffColor", {
  { name = "DiffAdd", value = { fg = "None", bg = "#4b5632" } },
  { name = "DiffChange", value = { fg = "None", bg = "#4b1818" } },
  { name = "DiffDelete", value = { fg = "None", bg = "#6f1313" } },
  { name = "DiffText", value = { fg = "None", bg = "#6f1313" } },
})

-- Highlight on yank
-- use yanky.nvim setting
-- augroup.create_cmd_group("HighlightYank", {
--   {
--     event = "TextYankPost",
--     opts = {
--       pattern = "*",
--       callback = function()
--         vim.highlight.on_yank()
--       end,
--     },
--   },
-- })

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

local function diagnostic_set_min_severity(min_severity)
  vim.diagnostic.config({
    underline = {
      severity = { min = min_severity },
    },
    virtual_text = {
      severity = { min = min_severity },
    },
    signs = {
      severity = { min = min_severity },
    },
  })
end

vim.diagnostic.config({ virtual_text = false })

local function diagnostic_severity_error()
  diagnostic_set_min_severity(vim.diagnostic.severity.ERROR)
end

local function diagnostic_severity_warning()
  diagnostic_set_min_severity(vim.diagnostic.severity.WARN)
end

local function diagnostic_severity_info()
  diagnostic_set_min_severity(vim.diagnostic.severity.INFO)
end

local function diagnostic_severity_hint()
  diagnostic_set_min_severity(vim.diagnostic.severity.HINT)
end

-- work on all buffers
vim.api.nvim_create_user_command("DiagSeverityError", diagnostic_severity_error, {})
vim.api.nvim_create_user_command("DiagSeverityWarning", diagnostic_severity_warning, {})
vim.api.nvim_create_user_command("DiagSeverityInfo", diagnostic_severity_info, {})
vim.api.nvim_create_user_command("DiagSeverityHint", diagnostic_severity_hint, {})

-- work on current buffer
vim.api.nvim_create_user_command("DiagHide", function()
  vim.diagnostic.hide()
end, {})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "]g", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, opts)
vim.keymap.set("n", "[g", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, opts)
vim.keymap.set("n", "<space>a", vim.diagnostic.setloclist, opts)
