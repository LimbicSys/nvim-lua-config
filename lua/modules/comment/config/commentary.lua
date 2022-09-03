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

vim.keymap.set("n", "<C-/>", "<Plug>CommentaryLine")
vim.keymap.set("i", "<C-/>", commentaryWithCursor)
vim.keymap.set("x", "<C-/>", "<Plug>Commentary")
