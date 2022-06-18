---@diagnostic disable: need-check-nil

-- FIXME: only triggered after :

local cmp = require("cmp")
local cpp_utils = require("config.complete_sources.utils")
local source = {}

local SymbolKind = {
  [1] = "File",
  [2] = "Module",
  [3] = "Namespace",
  [4] = "Package",
  [5] = "Class",
  [6] = "Method",
  [7] = "Property",
  [8] = "Field",
  [9] = "Constructor",
  [10] = "Enum",
  [11] = "Interface",
  [12] = "Function",
  [13] = "Variable",
  [14] = "Constant",
  [15] = "String",
  [16] = "Number",
  [17] = "Boolean",
  [18] = "Array",
  [19] = "Object",
  [20] = "Key",
  [21] = "Null",
  [22] = "EnumMember",
  [23] = "Struct",
  [24] = "Event",
  [25] = "Operator",
  [26] = "TypeParameter",
}

-- find constructor info from head file, or current buffer
local function get_target_buf()
  local file_extension = vim.fn.expand("%:e")

  if file_extension == "c" or file_extension == "cpp" then
    return cpp_utils.cpp_switch_source_header(0)
  end

  return vim.fn.bufnr()
end

source.new = function()
  return setmetatable({}, { __index = source })
end

source.is_available = function(self)
  local client = self:_get_client()
  return client ~= nil and client.name == "clangd"
end

source.get_keyword_pattern = function()
  return [[::\zs\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]]
end

source.get_debug_name = function()
  return "Clangd.Constructor"
end

source.get_trigger_characters = function()
  return { ":" }
end

source.complete = function(self, _, callback)
  local client = self:_get_client()
  local target_bufnr = get_target_buf()
  client.request(
    "textDocument/documentSymbol",
    { textDocument = vim.lsp.util.make_text_document_params(target_bufnr) },
    function(err, res)
      if err then
        return callback()
      end

      local items = {}
      local traverse
      traverse = function(nodes, level)
        level = level or 0
        for _, node in ipairs(nodes) do
          local kind_name = SymbolKind[node.kind]
          if
            vim.tbl_contains(
              { "Module", "Namespace", "Object", "Class", "Interface", "Method", "Function", "Constructor" },
              kind_name
            )
          then
            if kind_name == "Constructor" then
              local line = vim.api.nvim_buf_get_lines(
                target_bufnr,
                node.range.start.line,
                node.range.start.line + 1,
                false
              )[1] or ""
              if #line > 0 then
                -- remove whitespaces and last ;
                local label = string.gsub(line, "^%s*", "")
                label = string.gsub(label, ";", "")
                table.insert(items, {
                  label = label,
                  insertText = label,
                  filterText = label,
                  sortText = label,
                  kind = cmp.lsp.CompletionItemKind.Constructor,
                  data = node,
                })
              end
            end
            traverse(node.children or {}, level + 1)
          end
        end
      end
      traverse(res or {})
      callback(items)
    end
  )
end

source._get_client = function(self)
  for _, client in pairs(vim.lsp.buf_get_clients()) do
    if self:_get(client.server_capabilities, { "documentSymbolProvider" }) then
      return client
    end
  end
  return nil
end

source._get = function(_, root, paths)
  local c = root
  for _, path in ipairs(paths) do
    c = c[path]
    if not c then
      return nil
    end
  end
  return c
end

return source
