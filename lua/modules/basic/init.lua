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
    config = function()
      require("modules.basic.config.trouble")
    end,
  },
}
