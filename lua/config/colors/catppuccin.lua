local catppuccin = require("catppuccin")

catppuccin.setup({
  integrations = {
    nvimtree = {
      show_root = true,
    },
    neogit = true,
    hop = true,
  },
})

vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha
vim.cmd([[colorscheme catppuccin]])
