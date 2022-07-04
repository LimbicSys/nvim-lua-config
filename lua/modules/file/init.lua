local use = require("core.pack").use

-- tree
use({
  "kyazdani42/nvim-tree.lua",
  config = function()
    require("modules.file.config.tree")
  end,
})
