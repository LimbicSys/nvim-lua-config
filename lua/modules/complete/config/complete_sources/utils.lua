M = {}

local lsp_util = require("lspconfig.util")

function M.cpp_switch_source_header(bufnr)
  bufnr = lsp_util.validate_bufnr(bufnr)
  local params = { uri = vim.uri_from_bufnr(bufnr) }
  local results = vim.lsp.buf_request_sync(bufnr, "textDocument/switchSourceHeader", params)
  for _, res in ipairs(results) do
    if res["result"] ~= nil then
      return vim.uri_to_bufnr(res["result"])
    end
  end
  return bufnr
end

return M
