local cpp_util = require("cpp-helper.util")
local api = vim.api
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

  -- if not api.nvim_buf_is_loaded(target_buf) then
  --   vim.cmd(string.format("buffer %d", target_buf))
  -- end
  vim.cmd(string.format("edit %s", api.nvim_buf_get_name(target_buf)))
  local line_count = api.nvim_buf_line_count(target_buf)
  print(line_count)
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

return M
