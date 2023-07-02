return {

  -- git
  {
    "lewis6991/gitsigns.nvim",
    version = "*",
    event = "VeryLazy",
    init = function()
      local group = require("easy-augroup")
      group.create_hl_group("GitSignsCus", {
        { name = "GitSignsAddCus", value = { fg = "#98be65" } },
        { name = "GitSignsChangeCus", value = { fg = "#ffaa00" } },
        { name = "GitSignsDeleteCus", value = { fg = "#ec5f67" } },
      })
    end,
    config = function()
      require("modules.vcs.config.git")
    end,
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    config = function()
      require("modules.vcs.config.fugitive")
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    config = function()
      require("modules.vcs.config.diffview")
    end,
  },

  {
    "TimUntersberger/neogit",
    event = "VeryLazy",
    config = function()
      require("modules.vcs.config.neogit")
    end,
  },
}
