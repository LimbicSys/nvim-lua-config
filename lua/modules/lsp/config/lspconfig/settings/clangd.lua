local M = {}

local common_config = require("modules.lsp.config.lspconfig.settings.common").common_config
local clangd_config = {}
clangd_config = vim.tbl_deep_extend("force", clangd_config, common_config)
clangd_config["cmd"] = {
  "clangd",
  "--background-index",
  "--fallback-style=Microsoft",
  "--header-insertion=never",
  "--header-insertion-decorators=false",
}
local default_capabilities = vim.tbl_deep_extend("force", common_config.capabilities, {
  textDocument = {
    completion = {
      editsNearCursor = true,
    },
    switchSourceHeader = true,
  },
  offsetEncoding = { "utf-8", "utf-16" },
})
clangd_config["capabilities"] = default_capabilities
clangd_config["on_attach"] = function(client, bufnr)
  common_config.on_attach(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set("n", "<M-o>", "<Cmd>ClangdSwitchSourceHeader<CR>", opts)

  local navic_ok, navic = pcall(require, "nvim-navic")
  if navic_ok then
    navic.attach(client, bufnr)
  end
end

M.config = clangd_config

return M
