require("leap")

local opts = { silent = true }
vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward-to)", opts)
vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward-to)", opts)
vim.keymap.set({ "o" }, "x", "<Plug>(leap-forward-till)", opts)
vim.keymap.set({ "o" }, "x", "<Plug>(leap-backward-till)", opts)
vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-cross-window)", opts)
