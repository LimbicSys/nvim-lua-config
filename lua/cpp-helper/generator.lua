local cpp_util = require("cpp-helper.util")
local api = vim.api
local fn = vim.fn
local empty_line = ""

M = {}

function M.generate_defination()
  local function_text = cpp_util.get_function_at_cursor()
  if #function_text == 0 then
    return
  end

  local target_buf = cpp_util.get_target_buf()

  if target_buf == nil then
    return
  end

  -- TODO: if namespace exsits, insert at the end of namespace. If not, insert at the end of buffer
  -- with namespace prefix

  -- if not api.nvim_buf_is_loaded(target_buf) then
  --   vim.cmd(string.format("buffer %d", target_buf))
  -- end
  vim.cmd(string.format("edit %s", api.nvim_buf_get_name(target_buf)))
  local line_count = api.nvim_buf_line_count(target_buf)
  api.nvim_buf_set_lines(
    target_buf,
    line_count,
    line_count, -- insert at the end of lines
    true,
    {
      empty_line,
      function_text .. " {",
      empty_line,
      "}"
    }
  )
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

  local line_count = api.nvim_buf_line_count(target_buf)
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
