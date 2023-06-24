return {
  {
    -- comments
    "tpope/vim-commentary",
    config = function()
      require("modules.comment.config.commentary")
    end,
  },

  {
    "folke/todo-comments.nvim",
    config = function()
      require("modules.comment.config.todo-comments")
    end,
  },

  {
    "suy/vim-context-commentstring",
  },

  {
    "danymat/neogen",
    config = function()
      require("modules.comment.config.neogen")
    end,
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
}
