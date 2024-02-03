return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- We recommend updating the parsers on update
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("modules.treesitter.config.treesitter")
    end,
  },

  --  'romgrk/nvim-treesitter-context'

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("modules.treesitter.config.treesitter-textobject")
    end,
  },

  {
    "nvim-treesitter/playground",
    dependencies = "nvim-treesitter/nvim-treesitter",
    cmd = "TSPlaygroundToggle",
    config = function()
      require("modules.treesitter.config.treesitter-playground")
    end,
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    config = function()
      require("modules.treesitter.config.rainbow")
    end,
  },
}
