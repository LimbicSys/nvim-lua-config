local M = {}

local common_config = require("config.lsp.settings.common").common_config
local config = {}
config = vim.tbl_deep_extend("force", config, common_config)
config["init_options"] = { documentFormatting = true }
config["filetypes"] = { "lua" }
config["settings"] = {
  rootMarkers = { ".git/", ".root" },
  languages = {
    lua = {
      {
        formatCommand = "luafmt --indent-count=2 --stdin",
        formatStdin = true,
      },
    },
  },
}
M.config = config

return M
