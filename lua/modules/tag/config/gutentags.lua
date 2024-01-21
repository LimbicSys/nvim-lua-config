vim.opt.tags = { "./.tags", ".tags" }
vim.g.gutentags_project_root = { ".root", ".svn", ".git", ".hg", ".project" }

vim.g.gutentags_ctags_tagfile = ".tags"

local vim_tags = vim.fn.expand("~/.cache/tags")
vim.g.gutentags_cache_dir = vim_tags

vim.g.gutentags_ctags_extra_args = {
  "--fields=+niazS",
  "--extras=+q",
  "--c++-kinds=+px",
  "--c-kinds=+px",
  "--output-format=e-ctags",
}

if vim.fn.isdirectory(vim_tags) ~= 1 then
  vim.cmd([[
  silent! call mkdir(g:gutentags_cache_dir, 'p')
  ]])
end

local gutentags_modules = {}
if vim.fn.executable("ctags") == 1 then
  table.insert(gutentags_modules, "ctags")
end
-- if vim.fn.executable("gtags-cscope") == 1 and vim.fn.executable("gtags") == 1 then
--   table.insert(gutentags_modules, "cscope_maps")
-- end
vim.g.gutentags_modules = gutentags_modules

vim.g.gutentags_file_list_command = "fd -e c -e h"

-- vim.g.gutentags_cscope_build_inverted_index_maps = 1
-- vim.g.gutentags_trace = 1
