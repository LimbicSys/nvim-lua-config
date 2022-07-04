local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local lspconfig = require("lspconfig")

lsp_installer.setup({
  ensure_installed = { "bashls", "vimls", "jsonls", "sumneko_lua" },
})

local servers = { "bashls", "vimls", "jsonls", "sumneko_lua", "clangd", "cmake", "efm" }

for _, server in pairs(servers) do
  local has_custom_config, customed_config = pcall(require, "modules.lsp.config.lspconfig.settings." .. server)
  if has_custom_config then
    lspconfig[server].setup(customed_config.config)
  else
    local common_config = require("modules.lsp.config.lspconfig.settings.common").common_config
    lspconfig[server].setup(common_config)
  end
end
