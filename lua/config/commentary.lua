vim.cmd([[
  augroup Commentary
    autocmd!
    autocmd FileType cpp,c setlocal  commentstring=//\ %s
  augroup END
]])

function CommentaryWithCursor()
  local fn = vim.fn
  local line_number = fn.line(".")
  local old_col = fn.col(".")
  local old_size = fn.strwidth(fn.getline("."))

  vim.cmd("Commentary")

  -- A space is inserted so + 1 is needed
  local split_len = fn.strlen(fn.split(vim.g.commentstring, "%s")[0]) + 1

  if fn.strlen(fn.getline(".")) > old_size then
    fn.cursor({line_number, old_col + split_len})
  else
    fn.cursor({line_number, old_col - split_len})
  end
end

vim.api.nvim_set_keymap("n", "<C-_>", "<Plug>CommentaryLine", {})
vim.api.nvim_set_keymap("i", "<C-_>", "<Esc><Cmd>lua CommentaryWithCursor<CR>a", {noremap = true})
vim.api.nvim_set_keymap("x", "<C-_>", "<Plug>Commentary", {})
