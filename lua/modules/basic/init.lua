local config_dir = vim.fn.stdpath("config")

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

  {
    dir = config_dir .. "/lua/toggle-list",
    event = "VeryLazy",
    config = function()
      require("toggle-list")
    end,
  },

  {
    dir = config_dir .. "/lua/open-recent",
    dependencies = "neovim/nvim-lspconfig",
    config = function()
      require("open-recent")
    end,
  },
}
