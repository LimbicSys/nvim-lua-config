vim.opt.tags = {"./.tags", ".tags"}
vim.g.gutentags_project_root = {".root", ".svn", ".git", ".hg", ".project"}

vim.g.gutentags_ctags_tagfile = ".tags"

local vim_tags = vim.fn.expand("~/.cache/tags")
vim.g.gutentags_cache_dir = vim_tags

vim.g.gutentags_ctags_extra_args = {
  "--fields=+niazS",
  "--extra=+q",
  "--c++-kinds=+px",
  "--c-kinds=+px",
  "--exclude=.ccls-cache/*"
}

if vim.fn.isdirectory(vim_tags) ~= 1 then
  vim.cmd([[
  silent! call mkdir(g:gutentags_cache_dir, 'p')
  ]])
end
