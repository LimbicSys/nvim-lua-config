local use = require("core.pack").use

use("skywind3000/asyncrun.vim")

use({
  "skywind3000/asynctasks.vim",
  config = function()
    require("modules.task.config.asynctasks")
  end,
})
