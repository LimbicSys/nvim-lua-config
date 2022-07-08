-- Expand
local opts = { expr = true }
vim.api.nvim_set_keymap("i", "<C-l>", "vsnip#expandable()  ? '<Plug>(vsnip-expand)' : ''", opts)
vim.api.nvim_set_keymap("s", "<C-l>", "vsnip#expandable()  ? '<Plug>(vsnip-expand)' : ''", opts)

-- Expand or jump
-- vim.api.nvim_set_keymap("i", "<C-j>", "vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : ''", opts)
-- vim.api.nvim_set_keymap("s", "<C-j>", "vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : ''", opts)

-- Jump forward or backward
vim.api.nvim_set_keymap("i", "<C-j>", "vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : ''", opts)
vim.api.nvim_set_keymap("s", "<C-j>", "vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : ''", opts)
vim.api.nvim_set_keymap("i", "<C-k>", "vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : ''", opts)
vim.api.nvim_set_keymap("s", "<C-k>", "vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : ''", opts)

-- Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
-- See https://github.com/hrsh7th/vim-vsnip/pull/50
vim.api.nvim_set_keymap("n", "s", "<Plug>(vsnip-select-text)", {})
vim.api.nvim_set_keymap("x", "s", "<Plug>(vsnip-select-text)", {})
vim.api.nvim_set_keymap("n", "S", "<Plug>(vsnip-cut-text)", {})
vim.api.nvim_set_keymap("x", "S", "<Plug>(vsnip-cut-text)", {})

-- If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
-- let g:vsnip_filetypes = {}
-- let g:vsnip_filetypes.javascriptreact = ['javascript']
-- let g:vsnip_filetypes.typescriptreact = ['typescript']

vim.g.vsnip_snippet_dir = "~/.config/nvim/snippet"
