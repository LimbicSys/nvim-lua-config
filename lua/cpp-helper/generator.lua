local cpp_util = require("cpp-helper.util")
local api = vim.api
local fn = vim.fn
local empty_line = ""

local M = {}

function M.generate_definition()
  local cpp_func = cpp_util.get_function_at_cursor()
  if #(cpp_func.func_name) == 0 then
    return
  end

  local target_buf = cpp_util.get_target_buf()

  if target_buf == nil then
    return
  end

  if target_buf ~= vim.fn.bufnr() then
    vim.cmd(string.format("edit %s", api.nvim_buf_get_name(target_buf)))
  end

  local line_count = api.nvim_buf_line_count(target_buf)
  local target_pos = line_count -- insert at the end of buffer by default

  local namespace_start_idx = #(cpp_func.namespaces) + 1
  if #(cpp_func.namespaces) > 0 then
    local idx, end_line = cpp_util.find_namespace_end(cpp_func.namespaces)
    target_pos = end_line
    if target_pos == 0 then
      target_pos = line_count
    end
    namespace_start_idx = idx + 1
  end

  local func_text = cpp_func:get_func_def_text(namespace_start_idx)
  local end_bracket = "}"

  -- indent
  local indent_count = fn.indent(target_pos + 1) -- if target_pos is the last line, return -1
  if indent_count ~= -1 then
    indent_count = indent_count / vim.bo.tabstop
  end

  -- if indent_count == -1, no indent
  for _ = 1, indent_count + 1, 1 do
    func_text = cpp_util.add_indent(func_text)
    end_bracket = cpp_util.add_indent(end_bracket)
  end

  api.nvim_buf_set_lines(
    target_buf,
    target_pos,
    target_pos,
    true,
    {
      empty_line,
      func_text .. " {",
      empty_line,
      end_bracket
    }
  )

  -- move cursor to the function body
  api.nvim_win_set_cursor(0, {target_pos + 3, 1})
end

function M.guard_header()
  local file_extension = fn.expand("%:e")
  local base_filename = fn.expand("%:t:r")
  if file_extension ~= "h" and file_extension ~= "hpp" then
    return
  end

  local guard_text = cpp_util.get_guard_text(base_filename)
  api.nvim_buf_set_lines(
    0,
    0,
    0,
    true,
    {
      "#ifndef " .. guard_text,
      "#define " .. guard_text,
      empty_line
    }
  )

  local line_count = api.nvim_buf_line_count(0)
  api.nvim_buf_set_lines(
    0,
    line_count,
    line_count, -- insert at the end of lines
    true,
    {
      empty_line,
      "#endif // !" .. guard_text
    }
  )
end

return M
