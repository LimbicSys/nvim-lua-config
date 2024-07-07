require("fzf-lua").setup({})

vim.keymap.set("n", "<C-e>", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
vim.keymap.set("n", "<C-t>", "<cmd>lua require('fzf-lua').tags()<CR>", { silent = true })
vim.keymap.set("n", "<M-t>", "<cmd>lua require('fzf-lua').btags()<CR>", { silent = true })
vim.keymap.set("n", "<M-f>", "<cmd>lua require('fzf-lua').grep_project()<CR>", { silent = true })
vim.keymap.set("n", "<leader>h", "<cmd>lua require('fzf-lua').oldfiles()<CR>", { silent = true })
vim.keymap.set("n", "<M-b>", "<cmd>lua require('fzf-lua').buffers()<CR>", { silent = true })

vim.api.nvim_create_user_command("Maps", "lua require('fzf-lua').keymaps()", {})
-- old fzf-vim config
-- vim.api.nvim_set_keymap("n", "<space>pf", "<Cmd>Files<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<C-e>", "<Cmd>Files<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<C-t>", "<Cmd>Tags<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<M-t>", "<Cmd>BTags<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<M-f>", "<Cmd>Rg<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<space>/", "<Cmd>Rg<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<C-s>", "<Cmd>Lines<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<Leader>h", "<Cmd>History<CR>", {noremap = true})
-- vim.api.nvim_set_keymap("n", "<M-b>", "<Cmd>Buffers<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<space><", "<Cmd>Buffers<CR>", { noremap = true })

-- vim.g.fzf_gitignore_map = "<Leader>gi"

-- vim.g.fzf_tags_command = "ctags -R --exclude=.ccls-cache/*"
