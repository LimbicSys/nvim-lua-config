require("substitute").setup()

vim.api.nvim_set_keymap("n", "sx", "<cmd>lua require('substitute.exchange').operator()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "sxx", "<cmd>lua require('substitute.exchange').line()<cr>", { noremap = true })
vim.api.nvim_set_keymap("x", "X", "<cmd>lua require('substitute.exchange').visual()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "sxc", "<cmd>lua require('substitute.exchange').cancel()<cr>", { noremap = true })
