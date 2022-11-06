local use = require("core.pack").use

use("nvim-lua/plenary.nvim")

-- icons
use("kyazdani42/nvim-web-devicons")

-- quick fix
use({
  "kevinhwang91/nvim-bqf",
  config = function()
    require("modules.basic.config.quickfix")
  end,
})

use({
  "timakro/vim-yadi",
  config = function()
    require("modules.basic.config.indent")
  end,
})

use({
  "folke/trouble.nvim",
  config = function()
    require("modules.basic.config.trouble")
  end,
})
