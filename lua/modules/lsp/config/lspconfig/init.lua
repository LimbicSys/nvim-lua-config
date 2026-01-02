local status_ok, _ = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end

require("neoconf").setup()

local lspconfig = vim.lsp.config

local servers = {
  "bashls",
  "vimls",
  "jsonls",
  "lua_ls",
  "clangd",
  "cmake",
  "ty",
  "rust_analyzer",
  "gopls",
  "clojure_lsp",
  "hls", -- haskell
}

for _, server in pairs(servers) do
  local has_custom_config, customed_config = pcall(require, "modules.lsp.config.lspconfig.settings." .. server)
  if has_custom_config then
    lspconfig(server, customed_config.config)
  else
    local common_config = require("modules.lsp.config.lspconfig.settings.common").common_config
    lspconfig(server, common_config)
  end
  vim.lsp.enable(server)
end
