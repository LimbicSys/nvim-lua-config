require("neogit").setup({
  integrations = {
    diffview = true,
  },
  mappings = {
    popup = {
      ["p"] = "PushPopup",
      ["P"] = "PullPopup",
    },
  },
})

vim.keymap.set("n", "<space>gg", "<CMD>Neogit<CR>")
