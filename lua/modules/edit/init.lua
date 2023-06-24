return {
  { "tpope/vim-repeat" },

  {
    "phaazon/hop.nvim",
    version = "*", -- optional but strongly recommended
    config = function()
      require("modules.edit.config.hop")
    end,
  },

  {
    "ggandor/leap.nvim",
    config = function()
      require("modules.edit.config.leap")
    end,
  },

  { "tpope/vim-surround" },

  {
    "chaoren/vim-wordmotion",
    config = function()
      require("modules.edit.config.wordmotion")
    end,
  },

  -- {
  --   "mg979/vim-visual-multi",
  --   config = function()
  --     require("modules.edit.config.visual-multi")
  --   end,
  -- },

  -- text objects
  { "Limbicsys/vim-indent-object" },
  { "kana/vim-textobj-user" },
  {
    "kana/vim-textobj-entire",
    dependencies = "kana/vim-textobj-user",
  },

  {
    "gbprod/substitute.nvim",
    config = function()
      require("modules.edit.config.substitute")
    end,
  },

  -- Lua
  {
    "gbprod/yanky.nvim",
    config = function()
      require("modules.edit.config.yanky")
    end,
  },

  {
    "max397574/better-escape.nvim",
    config = function()
      require("modules.edit.config.better-escape")
    end,
  },
}
