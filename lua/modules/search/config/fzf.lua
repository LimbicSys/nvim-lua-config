vim.api.nvim_set_keymap("n", "<space>pf", "<Cmd>Files<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-t>", "<Cmd>Tags<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<M-t>", "<Cmd>BTags<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<M-f>", "<Cmd>Rg<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>/", "<Cmd>Rg<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<C-s>", "<Cmd>Lines<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<Leader>h", "<Cmd>History<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<M-b>", "<Cmd>Buffers<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space><", "<Cmd>Buffers<CR>", { noremap = true })

vim.g.fzf_gitignore_map = "<Leader>gi"

vim.g.fzf_tags_command = "ctags -R --exclude=.ccls-cache/*"
