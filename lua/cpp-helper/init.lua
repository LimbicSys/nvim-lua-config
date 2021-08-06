local map = require "cartographer"

map.n.nore.silent["<Leader>gd"] = require("cpp-helper.generator").generate_defination

vim.cmd([[command! GuardHeader lua require("cpp-helper.generator").guard_header()]])
