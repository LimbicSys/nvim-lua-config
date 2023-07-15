local catppuccin = require("catppuccin")

catppuccin.setup({
  flavour = "frappe",
  background = { -- :h background
    light = "latte",
    dark = "frappe",
  },
  integrations = {
    nvimtree = {
      show_root = true,
    },
    neogit = true,
    hop = true,
  },
})

vim.cmd([[colorscheme catppuccin]])
