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
  tab = "v2.*",
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
