local use = require("core.pack").use

use({
  "voldikss/vim-floaterm",
  config = function()
    require("modules.terminal.config.floaterm")
  end,
})
