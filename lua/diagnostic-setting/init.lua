local M = {}


local function diagnostic_set_min_severity(min_severity)
  vim.diagnostic.config({
    underline = {
      severity = {min = min_severity},
    },
    virtual_text = {
      severity = {min = min_severity},
    },
    signs = {
      severity = {min = min_severity},
    },
  })
end

function M.diagnostic_severity_error()
  diagnostic_set_min_severity(vim.diagnostic.severity.ERROR)
end

function M.diagnostic_severity_warning()
  diagnostic_set_min_severity(vim.diagnostic.severity.WARN)
end

function M.diagnostic_severity_info()
  diagnostic_set_min_severity(vim.diagnostic.severity.INFO)
end

function M.diagnostic_severity_hint()
  diagnostic_set_min_severity(vim.diagnostic.severity.HINT)
end

return M
