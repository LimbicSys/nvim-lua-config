local M = {}

local common_config = require("modules.lsp.config.lspconfig.settings.common").common_config

local status_ok, neodev = pcall(require, "neodev")
if status_ok then
  neodev.setup()
end

M.config = common_config
M.config["on_attach"] = common_config.on_attach

return M
