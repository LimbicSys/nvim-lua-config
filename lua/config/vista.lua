vim.api.nvim_set_keymap("n", ";t", ":Vista!!<cr>", {noremap = true})

vim.api.nvim_set_keymap("n", "<m-t>", ":Vista finder<cr>", {noremap = true})

vim.g.visita_default_executive = "ctags"
