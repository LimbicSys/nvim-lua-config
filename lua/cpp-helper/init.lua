local map = require "cartographer"

map.n.nore.silent["<Leader>gd"] = require("cpp-helper.generator").generate_defination
