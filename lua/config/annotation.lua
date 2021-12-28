require("neogen").setup({
  enabled = true,
})
local map = require("cartographer")
map.n.nore.silent["<Leader>nf"] = "<Cmd>lua require('neogen').generate()<CR>"
