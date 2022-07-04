local augroup = require("easy-augroup")
local format_wrapper = require("format-wrapper")

augroup.create_cmd_group("FormatOnSave", {
  {
    event = "BufWritePost",
    opts = {
      pattern = "*",
      command = [[silent! lua require"format-wrapper".format_on_save()]],
    },
  },
})

vim.api.nvim_create_user_command("ToggleFormat", format_wrapper.toggle_format_on_save, {})
vim.api.nvim_create_user_command("FormatBuffer", format_wrapper.formatting, {})

vim.cmd([[command! -nargs=? -range=% -bar RangeFormat lua vim.lsp.buf.range_formatting()]])
