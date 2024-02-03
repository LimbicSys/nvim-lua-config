return {
  {
    "hrsh7th/vim-vsnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      -- "hrsh7th/vim-vsnip-integ"
    },
    event = "VeryLazy",
    init = function()
      -- If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
      -- let g:vsnip_filetypes = {}
      -- let g:vsnip_filetypes.javascriptreact = ['javascript']
      -- let g:vsnip_filetypes.typescriptreact = ['typescript']
      vim.g.vsnip_snippet_dir = "~/.config/nvim/snippet"
    end,
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
    event = { "InsertEnter", "CmdlineEnter" },
    init = function()
      vim.g.completion_confirm_key = ""
    end,
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
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      { "hrsh7th/cmp-vsnip", dependencies = "hrsh7th/vim-vsnip" },
      "hrsh7th/cmp-cmdline",
      "windwp/nvim-autopairs",
      "quangnguyen30192/cmp-nvim-tags",
      "dmitmel/cmp-cmdline-history",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "PaterJason/cmp-conjure",
    },
    event = { "InsertEnter", "CmdlineEnter" },
    config = function()
      require("modules.complete.config.complete")
    end,
  },
}
