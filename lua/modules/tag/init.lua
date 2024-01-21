return {
  {
    "ludovicchabant/vim-gutentags",
    event = "VeryLazy",
    init = function()
      require("modules.tag.config.gutentags")
    end,
  },

  {
    "liuchengxu/vista.vim",
    event = "VeryLazy",
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

  {
    "dhananjaylatkar/cscope_maps.nvim",
    ft = { "c", "cpp" },
    dependencies = {
      "folke/which-key.nvim", -- optional [for whichkey hints]
      "nvim-telescope/telescope.nvim", -- optional [for picker="telescope"]
      "nvim-tree/nvim-web-devicons", -- optional [for devicons in telescope or fzf]
    },
    opts = {
      prefix = "<leader>c",
      skip_input_prompt = true,
      cscope = {
        db_file = "./.cscope.out",
        exec = "gtags-cscope",
        skip_picker_for_single_result = false,
      },
    },
  },
}
