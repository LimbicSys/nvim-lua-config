-- work on all buffers
vim.cmd([[command DiagSeverityError lua require"diagnostic-setting".diagnostic_severity_error()]])
vim.cmd([[command DiagSeverityWarning lua require"diagnostic-setting".diagnostic_severity_warning()]])
vim.cmd([[command DiagSeverityInfo lua require"diagnostic-setting".diagnostic_severity_info()]])
vim.cmd([[command DiagSeverityHint lua require"diagnostic-setting".diagnostic_severity_hint()]])

-- work on current buffer
vim.cmd([[command LspDiagHide lua vim.diagnostic.hide()]])

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<Leader>dd", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
vim.keymap.set("n", "<Leader>dcd", "<cmd>Lspsaga show_cursor_diagnostics<cr>", opts)
vim.keymap.set("n", "]g", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
vim.keymap.set("n", "[g", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
