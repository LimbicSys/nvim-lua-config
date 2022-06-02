local M = {}

local common_config = require("config.lsp.settings.common").common_config

local status_ok, lua_dev = pcall(require, "lua-dev")
if status_ok then
  local config = lua_dev.setup({
    lspconfig = common_config,
  })
  M.config = config
else
  M.config = common_config
end

return M
