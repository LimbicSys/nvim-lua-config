return {
  {
    "ludovicchabant/vim-gutentags",
    config = function()
      require("modules.tag.config.gutentags")
    end,
  },

  {
    "liuchengxu/vista.vim",
    config = function()
      require("modules.tag.config.vista")
    end,
  },
}
