vim.bo.tabstop = 2
vim.bo.softtabstop = 2
vim.bo.shiftwidth = 2

-- auto indent when type a at the beginning of a line
vim.api.nvim_buf_set_keymap(0, "n", "a", "col('.') == 1 ? 'a<C-f>' : 'a'", {noremap = true, expr = true})
