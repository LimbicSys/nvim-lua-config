return {
  {
    "ludovicchabant/vim-gutentags",
    init = function()
      require("modules.tag.config.gutentags")
    end,
  },

  {
    "liuchengxu/vista.vim",
    init = function()
      vim.g.vista_default_executive = "ctags"
      vim.g.vista_echo_cursor = 1
      vim.g.vista_echo_cursor_strategy = "floating_win"
      vim.g.vista_disable_statusline = true
    end,
    config = function()
      require("modules.tag.config.vista")
    end,
  },
}
