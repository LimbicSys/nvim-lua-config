return {
  { "tpope/vim-repeat", event = "VeryLazy" },

  {
    "phaazon/hop.nvim",
    version = "*", -- optional but strongly recommended
    event = "VeryLazy",
    config = function()
      require("modules.edit.config.hop")
    end,
  },

  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    config = function()
      require("modules.edit.config.leap")
    end,
  },

  { "tpope/vim-surround", event = "VeryLazy" },

  {
    "chaoren/vim-wordmotion",
    event = "VeryLazy",
    init = function()
      require("modules.edit.config.wordmotion")
    end,
  },

  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
    init = function()
      require("modules.edit.config.visual-multi")
    end,
  },

  -- text objects
  { "Limbicsys/vim-indent-object", event = "VeryLazy" },
  {
    "kana/vim-textobj-entire",
    dependencies = "kana/vim-textobj-user",
    event = "VeryLazy",
  },

  {
    "gbprod/substitute.nvim",
    event = "VeryLazy",
    config = function()
      require("modules.edit.config.substitute")
    end,
  },

  {
    "gbprod/yanky.nvim",
    event = "VeryLazy",
    config = function()
      require("modules.edit.config.yanky")
    end,
  },

  {
    "max397574/better-escape.nvim",
    event = "VeryLazy",
    config = function()
      require("modules.edit.config.better-escape")
    end,
  },

  {
    "abecodes/tabout.nvim",
    dependencies = { "nvim-treesitter" }, -- or require if not used so far
    event = "VeryLazy",
    config = function()
      require("modules.edit.config.tabout")
    end,
  },
}
