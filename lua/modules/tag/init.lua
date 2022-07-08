local use = require("core.pack").use

use({
  "ludovicchabant/vim-gutentags",
  config = function()
    require("modules.tag.config.gutentags")
  end,
})

use({
  "liuchengxu/vista.vim",
  config = function()
    require("modules.tag.config.vista")
  end,
})
