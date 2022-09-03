local padding = " "
local empty_line = ""
local dot = "."

local M = {}

-- strips the ending slash in a path
local function strip_slash(path)
  return vim.fn.fnamemodify(path, ":s?[/\\]$??")
end

local function get_package_name(path)
  path = vim.fn.fnamemodify(path, ":p")
  local package_name = ""
  local fail = false
  while true do
    local tail = vim.fn.fnamemodify(path, ":t")
    path = strip_slash(path)
    if path == "/" then
      fail = true
      break
    end

    if tail == "java" then
      break
    else
      path = vim.fn.fnamemodify(path, ":h")
      if #package_name == 0 then
        package_name = tail
      else
        package_name = tail .. dot .. package_name
      end
    end
  end
  return fail and "" or package_name
end

function M.generated_template()
  local parent_path = vim.fn.expand("%:p:h")
  local classname = vim.fn.expand("%:t:r")
  local package_name = get_package_name(parent_path)
  if #package_name == 0 then
    return
  end
  vim.api.nvim_buf_set_lines(0, 0, 0, true, {
    "package" .. padding .. package_name .. ";",
    empty_line,
    "public class" .. padding .. classname .. padding .. "{",
    "}",
  })
end

return M
