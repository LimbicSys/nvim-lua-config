vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- auto indent when type a at the beginning of a line
vim.api.nvim_buf_set_keymap(0, "n", "a", "col('.') == 1 ? 'a<C-f>' : 'a'", {noremap = true, expr = true})
