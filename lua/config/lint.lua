require("lint").linters_by_ft = {
  -- cpp = { "cpplint" },
}

vim.cmd([[
  augroup LintGroup
  autocmd!
  autocmd BufWritePost * lua require('lint').try_lint()
  augroup END
]])
