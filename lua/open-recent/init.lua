local M = {}

local pager_mode = nil
local in_pager_mode = function()
  if pager_mode ~= nil then
    return pager_mode
  end -- Only evaluate this once

  local opened_with_args = next(vim.fn.argv()) ~= nil -- Neovim was opened with args

  pager_mode = opened_with_args
  return pager_mode
end

function M.open_recent()
  if in_pager_mode() then
    return
  end

  local cwd = vim.loop.cwd()
  cwd = cwd:gsub([[\]], [[\\]])
  -- TODO: write in lua
  local root = vim.fn["gutentags#get_project_root"](cwd)
  if root == "" or root == nil then
    return
  end
  local current_buffer = vim.api.nvim_get_current_buf()
  local current_file = vim.api.nvim_buf_get_name(current_buffer)
  local results = {}
  for _, file in ipairs(vim.v.oldfiles) do
    if vim.loop.fs_stat(file) and not vim.tbl_contains(results, file) and file ~= current_file then
      table.insert(results, file)
    end
  end

  results =
    vim.tbl_filter(
    function(file)
      return vim.fn.matchstrpos(file, cwd)[2] ~= -1
    end,
    results
  )

  -- filter .git/*, may be opened by commit message
  results =
    vim.tbl_filter(
    function(file)
      return vim.fn.matchstrpos(file, "/.git")[2] == -1
    end,
    results
  )

  if #results > 1 then
    vim.cmd(string.format("edit %s", results[1]))
    -- need detect filetype manually when used by **VimEtner** autocmd
    -- don't know why yet
    vim.cmd("filetype detect")
  end
end

return M
