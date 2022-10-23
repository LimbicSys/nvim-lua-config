local catppuccin = require("catppuccin")

catppuccin.setup({
  flavour = "frappe",
  integrations = {
    nvimtree = {
      show_root = true,
    },
    neogit = true,
    hop = true,
  },
})

vim.cmd([[colorscheme catppuccin]])
