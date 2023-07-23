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
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/neodev.nvim",
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
}
