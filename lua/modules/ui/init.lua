return {
  -- color theme, NOTE: load before statusline
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("colorscheme")
    end,
  },

  -- statusline
  {
    "rebelot/heirline.nvim",
    init = function()
      vim.o.laststatus = 0
    end,
    config = function()
      vim.o.laststatus = 3
      require("statusline.heirline")
    end,
  },
  -- {
  --   "NTBBloodbath/galaxyline.nvim",
  -- },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("modules.ui.config.bufferline")
    end,
  },

  -- group buffer by tab
  {
    "tiagovla/scope.nvim",
    event = "VeryLazy",
    config = function()
      require("scope").setup()
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    version = "*",
    event = "VeryLazy",
    init = function()
      vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
      vim.g.indent_blankline_char = "│"
      vim.g.indent_blankline_show_trailing_blankline_indent = false
    end,
    config = function()
      require("modules.ui.config.indentline")
    end,
  },

  --  'itchyny/vim-cursorword'
  --  'dominikduda/vim_current_word'
  {
    "RRethy/vim-illuminate",
    -- event = "VeryLazy",
    config = function()
      require("modules.ui.config.current-word")
    end,
  },

  {
    "norcalli/nvim-colorizer.lua",
    ft = { "lua", "vim" },
    config = function()
      require("colorizer").setup()
    end,
  },

  -- delete a buffer without messing up your window layout
  {
    "famiu/bufdelete.nvim",
    event = "VeryLazy",
    -- config = function()
    -- vim.keymap.set("n", "<Leader>c", "<CMD>Bdelete<CR>")
    -- end,
  },
}
