local use = require("core.pack").use

use({
  "mfussenegger/nvim-lint",
  config = function()
    require("modules.lint.config.lint")
  end,
})
