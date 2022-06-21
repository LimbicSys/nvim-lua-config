local M = {}

local common_config = require("config.lsp.settings.common").common_config
local clangd_config = {}
clangd_config = vim.tbl_deep_extend("force", clangd_config, common_config)
clangd_config["cmd"] = { "clangd", "--background-index", "--fallback-style=Microsoft", "--header-insertion=never" }
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
  vim.api.nvim_set_keymap("n", "<M-o>", "<Cmd>ClangdSwitchSourceHeader<CR>", { silent = true })

  local navic_ok, navic = pcall(require, "nvim-navic")
  if navic_ok then
    navic.attach(client, bufnr)
  end
end

M.config = clangd_config

return M
