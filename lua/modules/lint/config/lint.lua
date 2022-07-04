local lint = require("lint")
local augroup = require("easy-augroup")

lint.linters_by_ft = {
  -- cpp = { "cpplint" },
}

augroup.create_cmd_group("LintGroup", {
  {
    event = "BufWritePost",
    opts = {
      pattern = "*",
      callback = function()
        lint.try_lint()
      end,
    },
  },
})
