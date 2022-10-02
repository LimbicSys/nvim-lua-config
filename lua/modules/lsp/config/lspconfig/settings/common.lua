local M = {}

local function set_keymap(bufnr)
  -- Mappings.
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
  -- vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
  -- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  -- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  -- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap("n", "<space>f", vim.lsp.buf.formatting, opts)
  vim.keymap.set("n", "<space>ci", vim.lsp.buf.incoming_calls, opts)
  vim.keymap.set("n", "<space>co", vim.lsp.buf.outgoing_calls, opts)
  -- vim.keymap.set("n", "<Leader>a", vim.lsp.buf.code_action, opts)
  vim.keymap.set("x", "<Leader>a", vim.lsp.buf.range_code_action, opts)

  --- lspsaga functions
  vim.keymap.set("n", "<f2>", "<cmd>Lspsaga rename<CR>", opts)
  vim.keymap.set("n", "<leader>a", "<cmd>Lspsaga code_action<CR>", opts)
  vim.keymap.set("n", "<Leader>dp", "<cmd>Lspsaga peek_definition<CR>", opts)
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local navic_ok, navic = pcall(require, "nvim-navic")
  if navic_ok and client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end

  set_keymap(bufnr)
end

-- config that activates keymaps and enables snippet support
local capabilities = vim.lsp.protocol.make_client_capabilities()
local status_ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if status_ok then
  capabilities = cmp_lsp.update_capabilities(capabilities)
end

M.common_config = {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    -- This will be the default in neovim 0.7+
    debounce_text_changes = 150,
  },
}

return M
