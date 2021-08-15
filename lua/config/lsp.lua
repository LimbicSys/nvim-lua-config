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
  require "lsp_signature".on_attach(client)

  -- Mappings.
  local opts = {noremap = true, silent = true}

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "gh", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
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

-- lsp-install
local function setup_servers()
  require "lspinstall".setup()

  -- get all installed servers
  local servers = require "lspinstall".installed_servers()
  -- ... and add manually installed servers
  table.insert(servers, "clangd")
  table.insert(servers, "efm")
  -- table.insert(servers, "sourcekit")

  for _, server in pairs(servers) do
    local tmp_config = {
      on_attach = on_attach,
      capabilities = capabilities
    }

    local config
    -- language specific config
    if server == "lua" then
      config =
        require("lua-dev").setup(
        {
          lspconfig = tmp_config
        }
      )
    elseif server == "clangd" then
      config = tmp_config
      config["cmd"] = {"clangd", "--background-index", "--fallback-style=Microsoft"}
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
      config["capabilities"] = default_capabilities
    elseif server == "efm" then
      config = tmp_config
      config["init_options"] = {documentFormatting = true}
      config['filetypes'] = {"lua"}
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
      config = tmp_config
    end
    -- if server == "sourcekit" then
    --   config.filetypes = {"swift", "objective-c", "objective-cpp"}; -- we don't want c and cpp!
    -- end
    -- if server == "clangd" then
    --   config.filetypes = {"c", "cpp"}; -- we don't want objective-c and objective-cpp!
    -- end

    require "lspconfig"[server].setup(config)
  end
end

setup_servers()

vim.api.nvim_set_keymap("n", "<M-o>", "<Cmd>ClangdSwitchSourceHeader<CR>", {silent = true})

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require "lspinstall".post_install_hook = function()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
