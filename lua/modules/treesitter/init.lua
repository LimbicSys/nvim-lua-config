local use = require("core.pack").use

use({
  "nvim-treesitter/nvim-treesitter",
  -- We recommend updating the parsers on update
  run = ":TSUpdate",
  config = function()
    require("modules.treesitter.config.treesitter")
  end,
})
-- use 'romgrk/nvim-treesitter-context'

use({
  "nvim-treesitter/nvim-treesitter-textobjects",
  config = function()
    require("modules.treesitter.config.treesitter-textobject")
  end,
})

use({
  "nvim-treesitter/playground",
  requires = "nvim-treesitter/nvim-treesitter",
  cmd = "TSPlaygroundToggle",
  config = function()
    require("modules.treesitter.config.treesitter-playground")
  end,
})
