local M = {}

function M.diagnostic_only_show_error()
  vim.diagnostic.config({
    underline = {
      severity = vim.diagnostic.severity.ERROR,
    },
    virtual_text = {
      severity = vim.diagnostic.severity.ERROR,
    },
    signs = {
      severity = vim.diagnostic.severity.ERROR,
    },
  })
end

return M
