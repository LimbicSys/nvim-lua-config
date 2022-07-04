local use = require("core.pack").use

-- markdown
use({
  "npxbr/glow.nvim",
  run = ":GlowInstall",
  ft = "markdown",
})

-- jsonc
use({
  "neoclide/jsonc.vim",
  tf = "json",
})

-- kitty conf
use("fladson/vim-kitty")

