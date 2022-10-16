local use = require("core.pack").use

-- color theme, NOTE: load before statusline
-- use 'haishanh/night-owl.vim'
use("Limbicsys/zephyr-nvim")
-- use 'joshdick/onedark.vim'
use({
  "catppuccin/nvim",
  as = "catppuccin",
})

-- statusline
use({
  "rebelot/heirline.nvim",
})
-- use({
--   "NTBBloodbath/galaxyline.nvim",
-- })

-- bufferline
use({
  "akinsho/bufferline.nvim",
  tag = "v*",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("modules.ui.config.bufferline")
  end,
})

-- group buffer by tab
use({
  "tiagovla/scope.nvim",
  config = function()
    require("scope").setup()
  end,
})

use({
  "lukas-reineke/indent-blankline.nvim",
  tab = "v*",
  config = function()
    require("modules.ui.config.indentline")
  end,
})

-- use 'itchyny/vim-cursorword'
-- use 'dominikduda/vim_current_word'
use({
  "RRethy/vim-illuminate",
  config = function()
    require("modules.ui.config.current-word")
  end,
})

use({
  "norcalli/nvim-colorizer.lua",
  ft = { "lua", "vim" },
  config = function()
    require("colorizer").setup()
  end,
})

-- delete a buffer without messing up your window layout
use({
  "famiu/bufdelete.nvim",
  config = function()
    vim.keymap.set("n", "<Leader>c", "<CMD>Bdelete<CR>")
  end,
})
