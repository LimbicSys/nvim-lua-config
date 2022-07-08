local use = require("core.pack").use

use({
  "phaazon/hop.nvim",
  branch = "v1", -- optional but strongly recommended
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
