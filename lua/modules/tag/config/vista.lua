-- if lsp source is available, use it
local function toggle_vista()
  local clients = vim.tbl_values(vim.lsp.get_active_clients())
  if clients == nil or #clients == 0 then
    vim.cmd("Vista!!")
  else
    if vim.fn["vista#sidebar#IsOpen"]() == 1 then
      vim.fn["vista#sidebar#Close"]()
    else
      vim.cmd("Vista nvim_lsp")
    end
  end
end

vim.keymap.set("n", ";t", toggle_vista)
