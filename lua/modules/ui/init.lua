return {
  -- color theme, NOTE: load before statusline
  {
    "catppuccin/nvim",
    name = "catppuccin",
  },

  -- statusline
  {
    "rebelot/heirline.nvim",
  },
  -- {
  --   "NTBBloodbath/galaxyline.nvim",
  -- },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    -- tag = "v*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("modules.ui.config.bufferline")
    end,
  },

  -- group buffer by tab
  {
    "tiagovla/scope.nvim",
    config = function()
      require("scope").setup()
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    version = "*",
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
    config = function()
      vim.keymap.set("n", "<Leader>c", "<CMD>Bdelete<CR>")
    end,
  },
}
