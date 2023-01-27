require("neogit").setup({
  integrations = {
    diffview = true,
  },
  mappings = {
    status = {
      ["p"] = "PushPopup",
      ["P"] = "PullPopup",
    },
  },
})

vim.keymap.set("n", "<space>gg", "<CMD>Neogit<CR>")
