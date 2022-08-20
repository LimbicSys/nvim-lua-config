local use = require("core.pack").use

use({
  "SmiteshP/nvim-navic",
})

use("folke/lua-dev.nvim")

use({ "p00f/clangd_extensions.nvim" })

use("mfussenegger/nvim-jdtls")

use({
  "neovim/nvim-lspconfig",
  requires = {
    "williamboman/nvim-lsp-installer",
    "folke/lua-dev.nvim",
    "RRethy/vim-illuminate",
    "ray-x/lsp_signature.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "glepnir/lspsaga.nvim",
    "SmiteshP/nvim-navic",
    "p00f/clangd_extensions.nvim",
  },
  config = function()
    require("modules.lsp.config.lspconfig")
  end,
})

use({
  "j-hui/fidget.nvim",
  config = function()
    require("fidget").setup()
  end,
})

use({
  "glepnir/lspsaga.nvim",
  config = function()
    require("modules.lsp.config.lspsaga")
  end,
})

-- use 'steelsojka/completion-buffers'
-- use 'nvim-lua/lsp-status.nvim'
-- use 'RishabhRD/popfix'
-- use 'RishabhRD/nvim-lsputils'
