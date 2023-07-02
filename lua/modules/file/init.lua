return {
  -- tree
  -- use({
  --   "kyazdani42/nvim-tree.lua",
  --   config = function()
  --     require("modules.file.config.tree")
  --   end,
  -- })

  {
    -- only needed if you want to use the commands with "_with_window_picker" suffix
    "s1n7ax/nvim-window-picker",
    version = "*",
    config = function()
      require("window-picker").setup({
        autoselect_one = true,
        include_current = false,
        filter_rules = {
          -- filter using buffer options
          bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { "neo-tree", "neo-tree-popup", "notify" },

            -- if the buffer type is one of following, the window will be ignored
            buftype = { "terminal", "quickfix" },
          },
        },
        other_win_hl_color = "#e35e4f",
      })
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    version = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- only needed if you want to use the commands with "_with_window_picker" suffix
      "s1n7ax/nvim-window-picker",
    },
    event = "VeryLazy",
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree")
        end
      end
    end,
    config = function()
      require("modules.file.config.neotree")
    end,
  },

  {
    "tpope/vim-vinegar",
    event = "VeryLazy",
  },
}
