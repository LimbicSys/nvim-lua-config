vim.g.asyncrun_open = 6
vim.g.asyncrun_rootmarks = { ".git", ".svn", ".root", ".project", ".hg" }
vim.g.asynctasks_term_pos = "bottom"

local map_opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Leader>5", "<Cmd>wa <bar> AsyncTask file-run<CR>", map_opts)
vim.api.nvim_set_keymap("n", "<Leader>0", "<Cmd>wa <bar> AsyncTask file-build<CR>", map_opts)
vim.api.nvim_set_keymap("n", "<Leader>6", "<Cmd>wa <bar> AsyncTask project-run<CR>", map_opts)
vim.api.nvim_set_keymap("n", "<F7>", "<Cmd>wa <bar> AsyncTask project-build<CR>", map_opts)
