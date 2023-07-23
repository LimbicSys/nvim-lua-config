local status_ok, _ = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end

require("neoconf").setup()

local lspconfig = require("lspconfig")

local servers = { "bashls", "vimls", "jsonls", "lua_ls", "clangd", "cmake", "pyright", "rescriptls", "rust_analyzer" }

for _, server in pairs(servers) do
  local has_custom_config, customed_config = pcall(require, "modules.lsp.config.lspconfig.settings." .. server)
  if has_custom_config then
    -- use warpper for clangd
    if server == "clangd" then
      require("clangd_extensions").setup({
        server = customed_config.config,
        extensions = {
          autoSetHints = false,
        },
      })
    else
      lspconfig[server].setup(customed_config.config)
    end
  else
    local common_config = require("modules.lsp.config.lspconfig.settings.common").common_config
    lspconfig[server].setup(common_config)
  end
end
