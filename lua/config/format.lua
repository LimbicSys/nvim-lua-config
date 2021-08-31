local util = require "vim.lsp.util"

require("formatter").setup(
  {
    logging = false,
    filetype = {
      ["*"] = {
        function()
          return {cmd = {"sed -i 's/[ \t]*$//'"}} -- remove trailing whitespace
        end
      },
      javascript = {
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
            stdin = true
          }
        end
      },
      rust = {
        -- Rustfmt
        function()
          return {
            exe = "rustfmt",
            args = {"--emit=stdout"},
            stdin = true
          }
        end
      },
      lua = {
        -- luafmt
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      },
      cpp = {
        -- clang-format
        function()
          return {
            exe = "clang-format",
            args = {"-style=file", "--fallback-style=Microsoft"},
            stdin = true,
            cwd = vim.fn.expand("%:p:h") -- Run clang-format in cwd of the file.
          }
        end
      }
    }
  }
)

-- format by efm
local function select_client(method)
  local efm_blacklist = {}
  efm_blacklist["cpp"] = 1

  local clients = vim.tbl_values(vim.lsp.buf_get_clients())
  clients =
    vim.tbl_filter(
    function(client)
      return client.supports_method(method)
    end,
    clients
  )

  local ft = vim.bo.filetype

  if efm_blacklist[ft] == nil then
    for i = 1, #clients do
      if clients[i].name == "efm" then
        return clients[i]
      end
    end
  else
    for i = 1, #clients do
      if clients[i].name ~= "efm" then
        return clients[i]
      end
    end
  end

  if #clients > 0 then
    return clients[1]
  end
  return nil
end

local function formatting_sync(options, timeout_ms)
  local client = select_client("textDocument/formatting")
  if client == nil then
    return
  end

  local params = util.make_formatting_params(options)
  local result, err = client.request_sync("textDocument/formatting", params, timeout_ms, vim.api.nvim_get_current_buf())
  if result and result.result then
    util.apply_text_edits(result.result)
  elseif err then
    vim.notify("vim.lsp.buf.formatting_sync: " .. err, vim.log.levels.WARN)
  end
end

function Formatting()
  local ft_blacklist = {}
  ft_blacklist["cmake"] = 1
  local ft = vim.bo.filetype
  if ft_blacklist[ft] ~= nil then
    return
  end

  local lsp_format_list = {}
  lsp_format_list["cpp"] = 1
  lsp_format_list["lua"] = 1

  if lsp_format_list[ft] ~= nil then
    formatting_sync()
  else
    require("formatter.format").format("", "", 1, vim.fn.line("$"), true)
  end
end

-- local gs_cache = require("gitsigns.cache")
-- local cache = gs_cache.cache
-- local current_buf = vim.api.nvim_get_current_buf

-- function Format_on_change()
--   local bcache = cache[current_buf()]
--   local no_change_info = false
--   if not bcache then
--     no_change_info = true
--   else
--     local hunks = bcache.hunks
--     if not hunks or vim.tbl_isempty(hunks) then
--       no_change_info = true
--     else
--       for i = 1, #hunks do
--         local hunk = hunks[i]
--         -- FIXME: lines may change after formatting
--         require("formatter.format").format("", "", hunk.start, hunk.vend, true)
--       end
--     end
--   end

--   if no_change_info then
--     require("formatter.format").format("", true, 1, vim.fn.line("$"))
--   end
-- end

vim.cmd([[
augroup formatOnSave
  autocmd!
  autocmd BufWritePre * silent! lua Formatting()
augroup end
]])
