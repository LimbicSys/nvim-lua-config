local cpp_util = require('cpp-helper.util')
local api = vim.api

M = {}

function M.generate_defination()
  local function_text = cpp_util.get_function_at_cursor()
  if #function_text == 0 then
    return
  end

  api.nvim_buf_set_lines(0, vim.fn.line("$"), vim.fn.line("$"), true, {function_text})
end

return M
