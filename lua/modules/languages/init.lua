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

  -- lisp
  {
    "gpanders/nvim-parinfer",
    ft = { "lisp", "clojure" },
  },

  {
    "Olical/conjure",
    ft = { "clojure" },
    config = function(_, opts)
      require("conjure.main").main()
      require("conjure.mapping")["on-filetype"]()
    end,
    init = function()
      -- Set configuration options here
      -- vim.g["conjure#debug"] = true
    end,
  },

  {
    "guns/vim-sexp",
    ft = { "lisp", "clojure" },
    init = function()
      vim.g.sexp_enable_insert_mode_mappings = 0
    end,
  },

  {
    "tpope/vim-sexp-mappings-for-regular-people",
  },

  {
    "nvim-orgmode/orgmode",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter", lazy = true },
    },
    event = "VeryLazy",
    config = function()
      require("modules.languages.config.org")
    end,
  },

  {
    "akinsho/org-bullets.nvim",
    ft = "org",
    config = function()
      require("org-bullets").setup()
    end,
  },

  {
    "lukas-reineke/headlines.nvim",
    ft = { "markdown", "org" },
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true, -- or `opts = {}`
  },
}
