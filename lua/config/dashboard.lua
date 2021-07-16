vim.g.dashboard_default_executive = "fzf"

-- nmap <Leader>ss :<C-u>SessionSave<CR>
-- nmap <Leader>sl :<C-u>SessionLoad<CR>
-- nmap <Leader>nf :<C-u>DashboardNewFile<CR>

-- nnoremap <silent> <Leader>fh :History<CR>
-- " nnoremap <silent> <Leader>ff :Files<CR>
-- nnoremap <silent> <Leader>tc :Colors<CR>
-- nnoremap <silent> <Leader>fa :Rg<CR>
-- nnoremap <silent> <Leader>fb :Marks<CR>
-- nnoremap <silent> <Leader>nf :<C-u>DashboardNewFile<CR>

vim.api.nvim_set_keymap("n", "<Leader>ss", "<Cmd><C-u>SessionSave<CR>", {})
vim.api.nvim_set_keymap("n", "<Leader>sl", "<Cmd><C-u>SessionLoad<CR>", {})
-- vim.api.nvim_set_keymap("n", "<Leader>nf", "<Cmd><C-u>DashboardNewFile<CR>")

-- local map_opt = {silent = true, noremap = true}
-- vim.api.nvim_set_keymap("n", "<Leader>fh", "<Cmd>History<CR>", map_opt)
-- vim.api.nvim_set_keymap("n", "<Leader>tc", "<Cmd>Colors<CR>", map_opt)
-- vim.api.nvim_set_keymap("n", "<Leader>fa", "<Cmd>Rg<CR>", map_opt)
-- vim.api.nvim_set_keymap("n", "<Leader>fb", "<Cmd>Marks<CR>", map_opt)

vim.g.dashboard_custom_shortcut = {
  last_session = "Leader s l",
  find_history = "Leader f h",
  find_file = "    Ctrl e", -- make them aligned
  new_file = "Leader n f",
  change_colorscheme = "Leader t c",
  find_word = "Leader f a",
  book_marks = "Leader f b"
}
