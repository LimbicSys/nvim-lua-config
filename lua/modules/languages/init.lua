local use = require("core.pack").use

-- markdown
use({
  "npxbr/glow.nvim",
  ft = "markdown",
})

use({
  "preservim/vim-markdown",
  config = function()
    require("modules.languages.config.markdown")
  end,
})

-- jsonc
use({
  "neoclide/jsonc.vim",
  tf = "json",
})

-- kitty conf
use("fladson/vim-kitty")
