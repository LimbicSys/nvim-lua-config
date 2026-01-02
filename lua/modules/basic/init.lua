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
    opts = {
      auto_refresh = false,
    },
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
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

  {
    "pteroctopus/faster.nvim",
  },
}
