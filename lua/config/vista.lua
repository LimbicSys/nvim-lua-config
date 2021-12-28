vim.api.nvim_set_keymap("n", ";t", ":Vista!!<cr>", { noremap = true })

vim.api.nvim_set_keymap("n", "<m-t>", ":Vista finder<cr>", { noremap = true })

vim.g.visita_default_executive = "ctags"

vim.g.vista_echo_cursor = 1
vim.g.vista_echo_cursor_strategy = "floating_win"
vim.g.vista_disable_statusline = true
