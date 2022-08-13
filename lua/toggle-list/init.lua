local function toggle_quickfix()
  for _, win in pairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      vim.cmd("cclose")
      return
    end
  end
  vim.cmd("botright copen")
end

vim.keymap.set("n", ";c", toggle_quickfix, { noremap = true, silent = true })
