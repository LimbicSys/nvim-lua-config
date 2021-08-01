M = {}

local ts_utils = require("nvim-treesitter.ts_utils")
local fn = vim.fn
local padding = " "

local function get_nmaed_node_text(node, name)
  local named_nodes = node:field(name)
  local node_text = ""
  if #named_nodes >= 1 then
    local texts = ts_utils.get_node_text(named_nodes[1])
    if #texts >= 1 then
      node_text = texts[1]
    end
  end
  return node_text
end

local function get_nmaed_node_all_text(node, name)
  local named_nodes = node:field(name)
  if #named_nodes >= 1 then
    return ts_utils.get_node_text(named_nodes[1])
  end
  return {}
end

local function get_function_declaration(node)
  local return_type_text = get_nmaed_node_text(node, "type")
  local return_kind = "" -- "*" or "&"
  local func_name_text = ""
  local param_text = ""

  local declarator_nodes = node:field("declarator")

  if #declarator_nodes >= 1 then
    local type = declarator_nodes[1]:type()
    local function_declarator_node = declarator_nodes[1]
    if type == "reference_declarator" then
      return_kind = "&"
      function_declarator_node = function_declarator_node:child(1)
    elseif type == "pointer_declarator" then
      return_kind = "*"
      function_declarator_node = function_declarator_node:child(1)
    end
    func_name_text = get_nmaed_node_text(function_declarator_node, "declarator")

    -- parameters may have multi lines
    param_text = get_nmaed_node_all_text(function_declarator_node, "parameters")
  end
  return return_type_text, return_kind, func_name_text, param_text
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

  while cur_node ~= nil do
    -- get fuction declaration
    if not visited_function and cur_node:type() == "field_declaration" then
      return_type_text, return_kind, func_name_text, param_text = get_function_declaration(cur_node)
    -- print(function_text)
    end

    -- get class name
    if not visited_class and cur_node:type() == "class_specifier" then
      class_text = get_nmaed_node_text(cur_node, "name")
    end
    cur_node = cur_node:parent()
  end

  if #return_type_text ~= 0 and #func_name_text ~= 0 and #param_text ~= 0 then
    local func_text = return_type_text .. padding .. return_kind .. class_text .. "::" .. func_name_text
    for i, param in ipairs(param_text) do
      -- remove write spaces at the beginning and put them in one line
      local idx = 1
      while idx < #param do
        local tmp = string.sub(param, idx, idx)
        if tmp ~= " " and tmp ~= "\t" then
          break
        end
        idx = idx + 1
      end
      func_text = func_text .. padding .. string.sub(param, idx)
    end
    return func_text
  end

  return ""
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

function M.get_target_file()
  -- local file_extension = fn.expand("%:e")
end
return M
