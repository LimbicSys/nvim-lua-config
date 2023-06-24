return {

  -- git
  {
    "lewis6991/gitsigns.nvim",
    version = "*",
    config = function()
      require("modules.vcs.config.git")
    end,
  },
  {
    "tpope/vim-fugitive",
    config = function()
      require("modules.vcs.config.fugitive")
    end,
  },
  {
    "sindrets/diffview.nvim",
    config = function()
      require("modules.vcs.config.diffview")
    end,
  },

  {
    "TimUntersberger/neogit",
    config = function()
      require("modules.vcs.config.neogit")
    end,
  },
}
