local augroup = require("easy-augroup")

augroup.create_cmd_group("Commentary", {
  {
    event = "FileType",
    opts = {
      pattern = { "cpp", "c", "jsonc" },
      command = [[setlocal  commentstring=//\ %s]],
    },
  },
})

local function commentaryWithCursor()
  local fn = vim.fn
  local line_number = fn.line(".")
  local old_col = fn.col(".")
  local old_size = fn.strwidth(fn.getline("."))

  vim.cmd("Commentary")

  -- A space is inserted so + 1 is needed
  local split_len = fn.strlen(fn.split(vim.g.commentstring, "%s")[0]) + 1

  if fn.strlen(fn.getline(".")) > old_size then
    fn.cursor({ line_number, old_col + split_len })
  else
    fn.cursor({ line_number, old_col - split_len })
  end
end

local comment_key = "<C-/>"
if vim.fn.has("wsl") == 1 then
  comment_key = "<C-_>"
end

vim.keymap.set("n", comment_key, "<Plug>CommentaryLine")
vim.keymap.set("i", comment_key, commentaryWithCursor)
vim.keymap.set("x", comment_key, "<Plug>Commentary")
