local use = require("core.pack").use

use("tpope/vim-projectionist")
use({
  "windwp/nvim-projectconfig",
  config = function()
    require("nvim-projectconfig").load_project_config()
  end,
})
