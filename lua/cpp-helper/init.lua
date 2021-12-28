local map = require("cartographer")

map.n.nore.silent["<Leader>gd"] = require("cpp-helper.generator").generate_definition

vim.cmd([[command! GuardHeader lua require("cpp-helper.generator").guard_header()]])

vim.cmd([[
    augroup AutoGuard
    autocmd!
    autocmd BufNewFile *.h,*.hpp lua require("cpp-helper.generator").guard_header()
    augroup END
  ]])
