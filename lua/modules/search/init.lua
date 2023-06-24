return {
  -- fuzzing finder
  { "nvim-lua/popup.nvim" },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("modules.search.config.telescope")
    end,
  },

  { "junegunn/fzf" },

  {
    "junegunn/fzf.vim",
    config = function()
      require("modules.search.config.fzf")
    end,
  },

  {
    "windwp/nvim-spectre",
    config = function()
      require("modules.search.config.spectre")
    end,
  },
}
