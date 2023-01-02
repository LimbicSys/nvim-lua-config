local M = {}

local common_config = require("modules.lsp.config.lspconfig.settings.common").common_config
local pylsp_config = {
  settings = {
    pylsp = {
      plugins = {
        rope_autoimport = {
          enabled = true,
        },
        pyls_isort = {
          enabled = true,
        },
      },
    },
  },
}
pylsp_config = vim.tbl_deep_extend("force", pylsp_config, common_config)
M.config = pylsp_config

return M
