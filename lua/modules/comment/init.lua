return {
  {
    -- comments
    "tpope/vim-commentary",
    event = "VeryLazy",
    config = function()
      require("modules.comment.config.commentary")
    end,
  },

  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    config = function()
      require("modules.comment.config.todo-comments")
    end,
  },

  {
    "suy/vim-context-commentstring",
    event = "VeryLazy",
  },

  {
    "danymat/neogen",
    event = "VeryLazy",
    config = function()
      require("modules.comment.config.neogen")
    end,
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
}
