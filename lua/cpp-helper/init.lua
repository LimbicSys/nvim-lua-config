local augroup = require("easy-augroup")

vim.cmd([[command! GuardHeader lua require("cpp-helper.generator").guard_header()]])
vim.api.nvim_create_user_command("GuardHeader", require("cpp-helper.generator").guard_header, {})

augroup.create_cmd_group("AutoGuard", {
  {
    event = "BufNewFile",
    opts = {
      pattern = { "*.h", "*.hpp" },
      callback = function()
        require("cpp-helper.generator").guard_header()
      end,
    },
  },
})
