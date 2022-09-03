local use = require("core.pack").use

-- git
use({
  "lewis6991/gitsigns.nvim",
  tag = "release", -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
  config = function()
    require("modules.vcs.config.git")
  end,
})
use({
  "tpope/vim-fugitive",
  config = function()
    require("modules.vcs.config.fugitive")
  end,
})
use({
  "sindrets/diffview.nvim",
  config = function()
    require("modules.vcs.config.diffview")
  end,
})
-- use 'airblade/vim-gitgutter'

use({
  "TimUntersberger/neogit",
  config = function()
    require("modules.vcs.config.neogit")
  end,
})
