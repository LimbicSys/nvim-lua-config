return {
  {
    "SmiteshP/nvim-navic",
  },

  { "folke/neodev.nvim" },

  { "p00f/clangd_extensions.nvim" },

  { "mfussenegger/nvim-jdtls" },

  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  { "williamboman/mason-lspconfig.nvim" },

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

  --  'steelsojka/completion-buffers'
  --  'nvim-lua/lsp-status.nvim'
  --  'RishabhRD/popfix'
  --  'RishabhRD/nvim-lsputils'
}
