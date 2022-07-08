local use = require("core.pack").use

-- comments
use({
  "tpope/vim-commentary",
  config = function()
    require("modules.comment.config.commentary")
  end,
})

use({
  "folke/todo-comments.nvim",
  config = function()
    require("modules.comment.config.todo-comments")
  end,
})
use("suy/vim-context-commentstring")

use({
  "danymat/neogen",
  config = function()
    require("modules.comment.config.neogen")
  end,
  requires = "nvim-treesitter/nvim-treesitter",
  -- Uncomment next line if you want to follow only stable versions
  tag = "*",
})
