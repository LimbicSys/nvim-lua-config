vim.cmd([[ augroup formatOnSave
    autocmd!
    autocmd BufWritePost * silent! lua require"format-wrapper".format_on_save()
  augroup end ]])

vim.cmd([[ command! ToggleFormat lua require"format-wrapper".toggle_format_on_save() ]])
vim.cmd([[ command! FormatBuffer lua require"format-wrapper".formatting() ]])

vim.cmd([[command! -nargs=? -range=% -bar RangeFormat lua vim.lsp.buf.range_formatting()]])
