local use = require("core.pack").use

use({
  -- "lukas-reineke/format.nvim",
  "mhartington/formatter.nvim",
  config = function()
    require("modules.format.config.format")
  end,
})
