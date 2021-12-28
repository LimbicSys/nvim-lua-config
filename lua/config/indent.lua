vim.cmd([[
  augroup DetectIndentGroup
  autocmd!
  autocmd BufRead * DetectIndent
]])
