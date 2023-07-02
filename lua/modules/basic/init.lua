return {
  {
    "nvim-lua/plenary.nvim",
  },

  {
    -- icons
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },

  {
    -- quick fix
    "kevinhwang91/nvim-bqf",
    event = "VeryLazy",
    config = function()
      require("modules.basic.config.quickfix")
    end,
  },

  {
    "timakro/vim-yadi",
    config = function()
      require("modules.basic.config.indent")
    end,
  },

  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    config = function()
      require("modules.basic.config.trouble")
    end,
  },
}
