local luasnip = require("luasnip")

luasnip.snippets = {}

require("luasnip.loaders.from_vscode").lazy_load({
  paths = { "~/.local/share/nvim/site/pack/packer/start/friendly-snippets" },
})

local opts = { expr = true }

vim.api.nvim_set_keymap("i", "<C-l>", "luasnip#expandable()  ? '<Plug>luasnip-expand-snippet' : ''", opts)
vim.api.nvim_set_keymap("s", "<C-l>", "luasnip#expandable()  ? '<Plug>luasnip-expand-snippet' : ''", opts)

-- Jump forward or backward
vim.api.nvim_set_keymap("i", "<C-j>", "luasnip#jumpable(1)  ? '<Plug>luasnip-jump-next' : ''", opts)
vim.api.nvim_set_keymap("s", "<C-j>", "luasnip#jumpable(1)  ? '<Plug>luasnip-jump-next' : ''", opts)
vim.api.nvim_set_keymap("i", "<C-k>", "luasnip#jumpable(-1)  ? '<Plug>luasnip-jump-prev' : ''", opts)
vim.api.nvim_set_keymap("s", "<C-k>", "luasnip#jumpable(-1)  ? '<Plug>luasnip-jump-prev' : ''", opts)
