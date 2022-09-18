vim.api.nvim_create_autocmd("UIEnter", {
  pattern = "*",
  once = true,
  callback = require("open-recent.recent").open_recent,
})
