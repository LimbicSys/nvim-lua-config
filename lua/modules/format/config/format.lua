local augroup = require("easy-augroup")
local format_wrapper = require("format-wrapper")

require("formatter").setup({
  logging = false,
  filetype = {
    lua = {
      -- stylua
      function()
        return {
          exe = "stylua",
          args = { "--indent-type", "Spaces", "--indent-width", "2", "-" },
          stdin = true,
        }
      end,
    },
    cpp = {
      -- clang-format
      function()
        return {
          exe = "clang-format",
          args = { "-style=file", "--fallback-style=Microsoft", "--" },
          stdin = true,
          cwd = vim.fn.expand("%:p:h"), -- Run clang-format in cwd of the file.
        }
      end,
    },
    rescript = {
      function()
        vim.cmd("RescriptFormat")
      end,
    },
  },
})

augroup.create_cmd_group("FormatOnSave", {
  {
    -- TODO: use sync format and make it triggered on BufWritePre
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

vim.keymap.set("n", "<space>fb", format_wrapper.formatting, { silent = true, noremap = true })
