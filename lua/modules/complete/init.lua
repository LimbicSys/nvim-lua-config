local use = require("core.pack").use

-- snippets
-- use 'honza/vim-snippets'
use("rafamadriz/friendly-snippets")
use({
  "hrsh7th/vim-vsnip",
  requires = {
    "rafamadriz/friendly-snippets",
    -- "hrsh7th/vim-vsnip-integ"
  },
  config = function()
    require("modules.complete.config.vsnip")
  end,
})

-- use {
--   "L3MON4D3/LuaSnip",
--   config = function()
--     require("modules.complete.config.luasnip")
--   end
-- }
-- use {"saadparwaiz1/cmp_luasnip"}

use({
  "windwp/nvim-autopairs",
  -- requires = "hrsh7th/nvim-cmp",
  config = function()
    require("modules.complete.config.autopairs")
  end,
})

-- lsp
-- use({
--   "ray-x/lsp_signature.nvim",
--   config = function()
--     require("modules.complete.config.lsp_signature")
--   end,
-- })

use("hrsh7th/cmp-buffer")
use("hrsh7th/cmp-nvim-lsp")
use("hrsh7th/cmp-path")
use("hrsh7th/cmp-cmdline")
use("dmitmel/cmp-cmdline-history")
use("hrsh7th/cmp-nvim-lsp-document-symbol")
use("hrsh7th/cmp-nvim-lsp-signature-help")
use({
  "hrsh7th/cmp-vsnip",
  requires = "hrsh7th/vim-vsnip",
})
use({
  "hrsh7th/nvim-cmp",
  requires = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-vsnip",
    "windwp/nvim-autopairs",
    "quangnguyen30192/cmp-nvim-tags",
  },
  config = function()
    require("modules.complete.config.complete")
  end,
})
