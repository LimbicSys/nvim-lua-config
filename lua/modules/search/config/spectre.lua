local map = require("cartographer")

map.n.nore["<Leader>S"] = "<CMD>lua require('spectre').open()<CR>"

map.n.nore["<Leader>sw"] = "<CMD>lua require('spectre').open_visual({select_word = true})<CR>"

map.v.nore["<Leader>s"] = "<CMD>lua require('spectre').open_visual()<CR>"

map.n.nore["<Leader>sp"] = "<CMD>lua require('spectre').open_file_search()<CR>"
