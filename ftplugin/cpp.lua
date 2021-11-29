-- auto indent when type a at the beginning of a line
-- TODO: write a function to support filetype white list
vim.api.nvim_buf_set_keymap(0, "n", "a", "col('.') == 1 ? 'a<C-f>' : 'a'", {noremap = true, expr = true})
