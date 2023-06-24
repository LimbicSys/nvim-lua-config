return {
  -- snippets
  { "rafamadriz/friendly-snippets" },

  {
    "hrsh7th/vim-vsnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      -- "hrsh7th/vim-vsnip-integ"
    },
    config = function()
      require("modules.complete.config.vsnip")
    end,
  },

  --  {
  --   "L3MON4D3/LuaSnip",
  --   config = function()
  --     require("modules.complete.config.luasnip")
  --   end
  -- }
  --  {"saadparwaiz1/cmp_luasnip"}

  {
    "windwp/nvim-autopairs",
    dependencies = "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      require("modules.complete.config.autopairs")
    end,
  },

  -- lsp
  -- ({
  --   "ray-x/lsp_signature.nvim",
  --   config = function()
  --     require("modules.complete.config.lsp_signature")
  --   end,
  -- })

  {
    "hrsh7th/cmp-vsnip",
    dependencies = "hrsh7th/vim-vsnip",
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/cmp-cmdline",
      "windwp/nvim-autopairs",
      "quangnguyen30192/cmp-nvim-tags",
      "dmitmel/cmp-cmdline-history",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    config = function()
      require("modules.complete.config.complete")
    end,
  },
}
