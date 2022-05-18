-- work on all buffers
vim.cmd([[command LspDiagSeverityError lua require"lsp-setting".diagnostic_severity_error()]])
vim.cmd([[command LspDiagSeverityWarning lua require"lsp-setting".diagnostic_severity_warning()]])
vim.cmd([[command LspDiagSeverityInfo lua require"lsp-setting".diagnostic_severity_info()]])
vim.cmd([[command LspDiagSeverityHint lua require"lsp-setting".diagnostic_severity_hint()]])

-- work on current buffer
vim.cmd([[command LspDiagHide lua vim.diagnostic.hide()]])
