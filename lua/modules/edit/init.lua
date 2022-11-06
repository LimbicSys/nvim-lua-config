local use = require("core.pack").use

use({
  "phaazon/hop.nvim",
  tag = "v*", -- optional but strongly recommended
  config = function()
    require("modules.edit.config.hop")
  end,
})

use("tpope/vim-surround")

use({
  "chaoren/vim-wordmotion",
  config = function()
    require("modules.edit.config.wordmotion")
  end,
})

use({
  "mg979/vim-visual-multi",
  config = function()
    require("modules.edit.config.visual-multi")
  end,
})

-- text objects
use("Limbicsys/vim-indent-object")
use("kana/vim-textobj-user")
use("kana/vim-textobj-entire")

use({
  "gbprod/substitute.nvim",
  config = function()
    require("modules.edit.config.substitute")
  end,
})

-- Lua
use({
  "gbprod/yanky.nvim",
  config = function()
    require("modules.edit.config.yanky")
  end,
})

use({
  "max397574/better-escape.nvim",
  config = function()
    require("modules.edit.config.better-escape")
  end,
})
