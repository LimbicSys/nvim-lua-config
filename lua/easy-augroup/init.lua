local M = {}

--- Create auto commands group with commands
--- @param name string #augroup name
--- @param cmds array #each item contains args of `vim.api.nvim_create_autocmd`
function M.create_cmd_group(name, cmds)
  local id = vim.api.nvim_create_augroup(name, {})
  for _, cmd in pairs(cmds) do
    cmd.opts["group"] = id
    vim.api.nvim_create_autocmd(cmd.event, cmd.opts)
  end
end

--- Create highlights after VimEnter
--- @param name string #augroup name
--- @param hls array #each item contains highlight `name` and `value` for `vim.api.nvim_set_hl`
function M.create_hl_group(name, hls)
  local cmds = {}
  for _, hl in pairs(hls) do
    table.insert(cmds, {
      event = "VimEnter",
      opts = {
        pattern = "*",
        callback = function()
          vim.api.nvim_set_hl(0, hl.name, hl.value)
        end,
      },
    })
  end
  M.create_cmd_group(name, cmds)
end

return M
