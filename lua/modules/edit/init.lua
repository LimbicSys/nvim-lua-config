local config_dir = vim.fn.stdpath("config")

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
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      char = {
        enabled = true,
      },
      modes = {
        search = {
          enabled = false,
        },
      },
    },
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
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

  {
    dir = config_dir .. "/lua/im-switcher",
    event = "VeryLazy",
    config = function()
      require("im-switcher")
    end,
  },

  {
    "gabrielpoca/replacer.nvim",
    opts = { rename_files = false },
    keys = {
      {
        "<leader>rq",
        function()
          vim.cmd("BqfDisable")
          require("replacer").run()
        end,
        desc = "run replacer.nvim",
      },
    },
  },
}
