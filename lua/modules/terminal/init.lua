return {
  {
    "voldikss/vim-floaterm",
    event = "VeryLazy",
    init = function()
      vim.g.floaterm_keymap_toggle = "<m-j>"
    end,
  },
}
