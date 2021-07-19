require('lspsaga').init_lsp_saga({
  finder_action_keys = {
    open = 'o', vsplit = 's',split = 'i',quit = '<Esc>',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
  },
  code_action_keys = {
    quit = '<Esc>',exec = '<CR>'
  },
  rename_action_keys = {
    quit = '<C-c>',exec = '<CR>'  -- quit can be a table
  },
})

local opts = {silent = true, noremap = true}
-- show hover doc
-- vim.api.nvim_set_keymap('n', 'gh', "<Cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)

-- scroll down hover doc or scroll in definition preview
vim.api.nvim_set_keymap('n', '<C-f>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)

-- scroll up hover doc
vim.api.nvim_set_keymap('n', '<C-f>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)

-- code action
vim.api.nvim_set_keymap('n', '<Leader>a', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", opts)
vim.api.nvim_set_keymap('x', '<Leader>a', "<cmd><C-u>lua require('lspsaga.codeaction').range_code_action()<CR>", opts)

-- show signature help
vim.api.nvim_set_keymap('n', 'gs', "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", opts)

-- rename
vim.api.nvim_set_keymap('n', '<F2>', "<cmd>lua require('lspsaga.rename').rename()<CR>", opts)

-- preview definition
vim.api.nvim_set_keymap('n', '<Leader>dp', "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", opts)

-- show
vim.api.nvim_set_keymap('n', '<Leader>dd', "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>", opts)

-- only show diagnostic if cursor is over the area
vim.api.nvim_set_keymap('n', '<Leader>dc', "<cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>", opts)

-- jump diagnostic
vim.api.nvim_set_keymap('n', '[g', "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", opts)
vim.api.nvim_set_keymap('n', ']g', "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", opts)

-- reference
-- nnoremap <silent> gr <cmd>lua require'telescope.builtin'.lsp_references()<cr>
