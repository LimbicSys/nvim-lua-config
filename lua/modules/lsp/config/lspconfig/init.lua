local status_ok, _ = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end

require("neoconf").setup()

local lspconfig = require("lspconfig")

local servers =
  { "bashls", "vimls", "jsonls", "lua_ls", "clangd", "cmake", "pyright", "rust_analyzer", "gopls", "clojure_lsp" }

for _, server in pairs(servers) do
  local has_custom_config, customed_config = pcall(require, "modules.lsp.config.lspconfig.settings." .. server)
  if has_custom_config then
    lspconfig[server].setup(customed_config.config)
  else
    local common_config = require("modules.lsp.config.lspconfig.settings.common").common_config
    lspconfig[server].setup(common_config)
  end
end
