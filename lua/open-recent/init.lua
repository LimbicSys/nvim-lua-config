vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  once = true,
  callback = require("open-recent.recent").open_recent,
})
