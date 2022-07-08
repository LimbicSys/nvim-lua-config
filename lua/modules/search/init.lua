local use = require("core.pack").use

-- fuzzing finder
use("nvim-lua/popup.nvim")
use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
use({
  "nvim-telescope/telescope.nvim",
  config = function()
    require("modules.search.config.telescope")
  end,
})

use({
  "junegunn/fzf",
  run = function()
    vim.fn["fzf#install()"]()
  end,
})

use({
  "junegunn/fzf.vim",
  config = function()
    require("modules.search.config.fzf")
  end,
})

use({
  "theniceboy/fzf-gitignore",
  run = ":UpdateRemoteuses",
  cmd = "FzfGitignore",
  keys = " <Plug>(fzf-gitignore)",
})

use({
  "windwp/nvim-spectre",
  config = function()
    require("modules.search.config.spectre")
  end,
})
