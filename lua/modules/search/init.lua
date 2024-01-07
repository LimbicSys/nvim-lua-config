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

  {
    "pechorin/any-jump.vim",
    event = "VeryLazy",
    init = function()
      vim.g.any_jump_disable_default_keybindings = 1
    end,
    config = function()
      require("modules.search.config.any-jump")
    end,
  },
}
