M = {}

local ts_utils = require("nvim-treesitter.ts_utils")
local fn = vim.fn
local api = vim.api
local lsp_util = require("lspconfig.util")
local padding = " "
local CppFunc = require("cpp-helper.cpp-func")

local function get_named_node_text(node, name)
  local named_nodes = node:field(name)
  local node_text = ""
  if #named_nodes > 0 then
    local texts = ts_utils.get_node_text(named_nodes[1])
    if #texts > 0 then
      node_text = texts[1]
    end
  end
  return node_text
end

local function get_nmaed_node_all_text(node, name)
  local named_nodes = node:field(name)
  if #named_nodes > 0 then
    return ts_utils.get_node_text(named_nodes[1])
  end
  return {}
end

local function get_function_declaration(node)
  local return_type_text = get_named_node_text(node, "type")
  local return_kind = "" -- "*" or "&"
  local func_name_text = ""
  local param_text = ""

  local declarator_nodes = node:field("declarator")

  if #declarator_nodes > 0 then
    local type = declarator_nodes[1]:type()
    local function_declarator_node = declarator_nodes[1]
    if type == "reference_declarator" then
      return_kind = "&"
      function_declarator_node = function_declarator_node:child(1)
    elseif type == "pointer_declarator" then
      return_kind = "*"
      function_declarator_node = function_declarator_node:child(1)
    end
    func_name_text = get_named_node_text(function_declarator_node, "declarator")

    -- parameters may have multi lines
    param_text = get_nmaed_node_all_text(function_declarator_node, "parameters")
  end
  return return_type_text, return_kind, func_name_text, param_text
end

local function cpp_switch_source_header(bufnr)
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

function M.get_function_at_cursor()
  local cur_node = ts_utils.get_node_at_cursor()
  local return_type_text = "" -- e.g., void, int
  local return_kind = "" -- "*" or "&"
  local func_name_text = ""
  local param_text = ""
  local class_text = ""

  local visited_function = false
  local visited_class = false

  local namespace_list = {}

  while cur_node ~= nil do
    -- get fuction declaration
    if not visited_function and cur_node:type() == "field_declaration" then
      return_type_text, return_kind, func_name_text, param_text = get_function_declaration(cur_node)
    end

    -- get class name
    if not visited_class and cur_node:type() == "class_specifier" then
      class_text = get_named_node_text(cur_node, "name")
    end

    -- find namespace(s) and store in a stack
    if cur_node:type() == "namespace_definition" then
      local namespace = get_named_node_text(cur_node, "name")
      table.insert(namespace_list, 1, namespace)
    end

    cur_node = cur_node:parent()
  end

  return CppFunc:new(namespace_list, class_text, return_type_text, return_kind, func_name_text, param_text)
end

function M.add_indent(content)
  local indent = ""
  if vim.bo.expandtab then
    indent = string.rep(padding, vim.bo.tabstop)
  else
    indent = "\t"
  end
  return indent .. content
end

function M.get_target_buf()
  local file_extension = fn.expand("%:e")

  if file_extension == "c" or file_extension == "cpp" then
    return vim.fn.bufnr() -- return current file
  end

  if file_extension == "h" or file_extension == "hpp" then
    return cpp_switch_source_header(0)
  end

  return nil
end

function M.get_guard_text(base_filename)
  return string.upper(base_filename) .. "_H"
end

local function get_namespace_end(root_namespace_node, namespace_list, idx)
  if idx > #namespace_list then
    return idx - 1, 0
  end

  for node in root_namespace_node:iter_children() do
    if node:type() == "namespace_definition" then
      local namespace_node_text = get_named_node_text(node, "name")
      if namespace_node_text == namespace_list[idx] then
        local cur_start = node:start()
        local cur_end = node:end_()

        -- if this namespace has less than 2 line, skip it
        if cur_start == cur_end then
          return idx - 1, 0
        end

        local next_namespace_nodes = node:field("body")
        if #next_namespace_nodes > 0 then
          local next_idx, next_end = get_namespace_end(next_namespace_nodes[1], namespace_list, idx + 1)
          if next_end ~= 0 then
            return next_idx, next_end
          end
        end
        return idx, cur_end
      end
    end
  end

  return idx - 1, 0
end

function M.find_namespace_end(namespace_list)
  local cursor = api.nvim_win_get_cursor(0)
  local cursor_range = { cursor[1] - 1, cursor[2] }
  local root = ts_utils.get_root_for_position(unpack(cursor_range))

  if not root then
    return 0, fn.line("$")
  end

  return get_namespace_end(root, namespace_list, 1)
end

return M
