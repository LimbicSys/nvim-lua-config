return {
  -- markdown
  {
    "npxbr/glow.nvim",
    ft = "markdown",
  },

  {
    "preservim/vim-markdown",
    config = function()
      require("modules.languages.config.markdown")
    end,
  },

  -- jsonc
  {
    "neoclide/jsonc.vim",
    ft = "json",
  },

  -- kitty conf
  { "fladson/vim-kitty" },

  -- rescript
  {
    "rescript-lang/vim-rescript",
  },
}
