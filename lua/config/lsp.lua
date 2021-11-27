vim.api.nvim_command [[ hi def link LspReferenceText illuminatedWord ]]
vim.api.nvim_command [[ hi def link LspReferenceWrite illuminatedWord  ]]
vim.api.nvim_command [[ hi def link LspReferenceRead illuminatedWord  ]]

-- local nvim_lsp = require("lspconfig")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  -- local function buf_set_option(...)
  --   vim.api.nvim_buf_set_option(bufnr, ...)
  -- end

  -- Enable completion triggered by <c-x><c-o>
  -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  require "illuminate".on_attach(client)
  -- require "lsp_signature".on_attach(client)

  -- Mappings.
  local opts = {noremap = true, silent = true}

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "gh", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  -- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts) -- TODO: use custom handler
  -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  -- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  -- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap("n", "<space>a", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
  -- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- config that activates keymaps and enables snippet support
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits"
  }
}

capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local common_config = {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150
  }
}

local lsp_installer = require("nvim-lsp-installer")
-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(
  function(server)
    local config = {}

    if server.name == "sumneko_lua" then
      config =
        require("lua-dev").setup(
        {
          lspconfig = common_config
        }
      )
    elseif server.name == "efm" then
      vim.tbl_deep_extend("force", config, common_config)
      config["init_options"] = {documentFormatting = true}
      config["filetypes"] = {"lua"}
      config["settings"] = {
        rootMarkers = {".git/", ".root"},
        languages = {
          lua = {
            {
              formatCommand = "luafmt --indent-count=2 --stdin",
              formatStdin = true
            }
          }
        }
      }
    else
      vim.tbl_deep_extend("force", config, common_config)
    end

    server:setup(config)
  end
)

-- local installed language server
-- clangd
local clangd_config = {}
vim.tbl_deep_extend("force", clangd_config, common_config)
clangd_config["cmd"] = {"clangd", "--background-index", "--fallback-style=Microsoft", "--header-insertion=never"}
local default_capabilities =
  vim.tbl_deep_extend(
  "force",
  capabilities,
  {
    textDocument = {
      completion = {
        editsNearCursor = true
      },
      switchSourceHeader = true
    },
    offsetEncoding = {"utf-8", "utf-16"}
  }
)
clangd_config["capabilities"] = default_capabilities
require "lspconfig".clangd.setup(clangd_config)
vim.api.nvim_set_keymap("n", "<M-o>", "<Cmd>ClangdSwitchSourceHeader<CR>", {silent = true})
