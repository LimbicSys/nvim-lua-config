return {
  -- {
  --   "SmiteshP/nvim-navic",
  -- },

  { "p00f/clangd_extensions.nvim", ft = { "c", "cpp" } },

  { "mfussenegger/nvim-jdtls", ft = "java" },

  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "RRethy/vim-illuminate",
      "ray-x/lsp_signature.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "glepnir/lspsaga.nvim",
      "SmiteshP/nvim-navic",
      "p00f/clangd_extensions.nvim",
      "folke/trouble.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/neoconf.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("modules.lsp.config.lspconfig")
    end,
  },

  -- {
  --   "j-hui/fidget.nvim",
  --   config = function()
  --     require("fidget").setup()
  --   end,
  -- },

  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("modules.lsp.config.lspsaga")
    end,
  },

  {
    "chrisgrieser/nvim-lsp-endhints",
    event = "LspAttach",
    opts = {}, -- required, even if empty
  },
}
