local use = require("core.pack").use

use({
  "puremourning/vimspector",
  keys = {
    "<Plug>VimspectorContinue",
    "<Plug>VimspectorToggleBreakpoint",
    "<Plug>VimspectorToggleConditionalBreakpoint",
    "<Plug>VimspectorAddFunctionBreakpoint",
  },
  config = function()
    require("modules.debug.config.vimspector")
  end,
})
