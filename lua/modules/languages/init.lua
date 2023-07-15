local config_dir = vim.fn.stdpath("config")

return {
  -- markdown
  {
    "npxbr/glow.nvim",
    ft = "markdown",
  },

  {
    "preservim/vim-markdown",
    ft = "markdown",
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
  -- {
  --   "rescript-lang/vim-rescript",
  -- },

  {
    dir = config_dir .. "/lua/cpp-helper",
    ft = { "cpp", "c" },
    config = function()
      require("cpp-helper")
    end,
  },

  {
    dir = config_dir .. "/lua/java-helper",
    ft = "java",
    config = function()
      require("java-helper")
    end,
  },
}
