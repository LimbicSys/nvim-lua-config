local use = require("core.pack").use

-- tree
-- use({
--   "kyazdani42/nvim-tree.lua",
--   config = function()
--     require("modules.file.config.tree")
--   end,
-- })

use({
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  requires = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    {
      -- only needed if you want to use the commands with "_with_window_picker" suffix
      "s1n7ax/nvim-window-picker",
      tag = "v1.*",
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
  },
  config = function()
    require("modules.file.config.neotree")
  end,
})

use({
  "tpope/vim-vinegar",
})
