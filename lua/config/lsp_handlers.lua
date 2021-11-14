local log = require "vim.lsp.log"
local util = require "vim.lsp.util"
local vim = vim
local api = vim.api

local M = {}

---@private
--- Jumps to a location. Used as a handler for multiple LSP methods.
---@param _ (not used)
---@param result (table) result of LSP method; a location or a list of locations.
---@param ctx (table) table containing the context of the request, including the method
---(`textDocument/definition` can return `Location` or `Location[]`
function Location_handler(_, result, ctx, _)
  if result == nil or vim.tbl_isempty(result) then
    local _ = log.info() and log.info(ctx.method, "No location found")
    return nil
  end

  -- textDocument/definition can return Location or Location[]
  -- https://microsoft.github.io/language-server-protocol/specifications/specification-current/#textDocument_definition

  if vim.tbl_islist(result) then
    util.jump_to_location(result[1])

    if #result > 1 then
      util.set_qflist(util.locations_to_items(result))
      api.nvim_command("botright cwindow")
    end
  else
    util.jump_to_location(result)
  end
end

---@private
--- Return a function that converts LSP responses to list items and opens the list
---
--- The returned function has an optional {config} parameter that accepts a table
--- with the following keys:
---
---   loclist: (boolean) use the location list (default is to use the quickfix list)
---
---@param map_result function `((resp, bufnr) -> list)` to convert the response
---@param entity name of the resource used in a `not found` error message
local function response_to_list(map_result, entity)
  return function(_, result, ctx, config)
    if not result or vim.tbl_isempty(result) then
      vim.notify("No " .. entity .. " found")
    else
      config = config or {}
      if config.loclist then
        vim.fn.setloclist(
          0,
          {},
          " ",
          {
            title = "Language Server",
            items = map_result(result, ctx.bufnr)
          }
        )
        api.nvim_command("lopen")
      else
        vim.fn.setqflist(
          {},
          " ",
          {
            title = "Language Server",
            items = map_result(result, ctx.bufnr)
          }
        )
        api.nvim_command("botright copen")
      end
    end
  end
end

vim.lsp.handlers["textDocument/declaration"] = Location_handler
vim.lsp.handlers["textDocument/definition"] = Location_handler
vim.lsp.handlers["textDocument/typeDefinition"] = Location_handler
vim.lsp.handlers["textDocument/implementation"] = Location_handler

vim.lsp.handlers["textDocument/references"] = response_to_list(util.locations_to_items, "references")
vim.lsp.handlers["textDocument/documentSymbol"] = response_to_list(util.symbols_to_items, "document symbols")
vim.lsp.handlers["workspace/symbol"] = response_to_list(util.symbols_to_items, "symbols")
