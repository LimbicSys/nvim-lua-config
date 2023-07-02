return {
  -- fuzzing finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    event = "VeryLazy",
    config = function()
      require("modules.search.config.telescope")
    end,
  },

  {
    "junegunn/fzf.vim",
    dependencies = "junegunn/fzf",
    event = "VeryLazy",
    config = function()
      require("modules.search.config.fzf")
    end,
  },

  {
    "windwp/nvim-spectre",
    event = "VeryLazy",
    config = function()
      require("modules.search.config.spectre")
    end,
  },
}
