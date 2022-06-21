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

M.config["on_attach"] = function(client, bufnr)
  common_config.on_attach(client, bufnr)

  local navic_ok, navic = pcall(require, "nvim-navic")
  if navic_ok then
    navic.attach(client, bufnr)
  end
end

return M
