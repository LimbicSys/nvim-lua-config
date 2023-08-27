-- local util = require("vim.lsp.util")

-- -- format by efm
-- local function select_client(method)
--   local efm_blacklist = { "cpp" }

--   local clients = vim.tbl_values(vim.lsp.buf_get_clients())
--   clients = vim.tbl_filter(function(client)
--     return client.supports_method(method)
--   end, clients)

--   local ft = vim.bo.filetype

--   if not vim.tbl_contains(efm_blacklist, ft) then
--     for i = 1, #clients do
--       if clients[i].name == "efm" then
--         return clients[i]
--       end
--     end
--   else
--     for i = 1, #clients do
--       if clients[i].name ~= "efm" then
--         return clients[i]
--       end
--     end
--   end

--   if #clients > 0 then
--     return clients[1]
--   end
--   return nil
-- end

local M = {}

function M.formatting()
  local ft_blacklist = {}
  ft_blacklist["cmake"] = 1
  local ft = vim.bo.filetype
  if ft_blacklist[ft] ~= nil then
    return
  end

  local lsp_format_list = { "cpp", "java" }

  if vim.tbl_contains(lsp_format_list, ft) then
    -- formatting_sync()
    vim.lsp.buf.format()
  else
    require("formatter.format").format("", "", 1, vim.fn.line("$"), { write = true, lock = true })
  end
end

local do_format_on_save = true

local function convert_bool(var)
  if var then
    return "on"
  end
  return "off"
end

function M.toggle_format_on_save()
  do_format_on_save = not do_format_on_save
  vim.notify(string.format("Format on save: %s", convert_bool(do_format_on_save)))
end

function M.format_on_save()
  if do_format_on_save then
    M.formatting()
  end
end

function M.disable_format_on_save()
  do_format_on_save = false
end

function M.enable_format_on_save()
  do_format_on_save = true
  vim.notify(string.format("Format on save: %s", convert_bool(do_format_on_save)))
end

function M.format_on_save_status()
  vim.notify(string.format("Format on save: %s", convert_bool(do_format_on_save)))
end

return M
