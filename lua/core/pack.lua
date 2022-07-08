-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local fn, uv, api = vim.fn, vim.loop, vim.api
local vim_path = vim.fn.stdpath("config")
local data_dir = string.format("%s/site/", vim.fn.stdpath("data"))
local packer_compiled = data_dir .. "lua/packer_compiled.lua"
local packer = nil

local Packer = {}
Packer.__index = Packer

function Packer:load_plugins()
  local modules_list = {
    "basic",
    "treesitter",
    "lsp",
    "ui",
    "file",
    "comment",
    "edit",
    "mark",
    "vcs",
    "terminal",
    "task",
    "search",
    "tag",
    "languages",
    "complete",
    "debug",
    "format",
    "lint",
    "project",
  }
  for _, mod in ipairs(modules_list) do
    require("modules." .. mod)
  end
end

function Packer:load_packer()
  if not packer then
    api.nvim_command("packadd packer.nvim")
    packer = require("packer")
  end
  packer.init({
    compile_path = packer_compiled,
    git = { clone_timeout = 120 },
    disable_commands = true,
    display = {
      open_fn = require("packer.util").float,
    },
  })
  packer.reset()
  local use = packer.use
  use({
    "wbthomason/packer.nvim",
    config = function()
      local augroup = require("easy-augroup")

      augroup.create_cmd_group("PackerCompile", {
        {
          event = "BufWritePost",
          opts = {
            pattern = { "*/lua/modules/*/init.lua", "pack.lua" },
            command = "source <afile> | PackerCompile",
          },
        },
      })
    end,
  })
  self:load_plugins()
end

function Packer:init_ensure_plugins()
  local install_path = data_dir .. "pack/packer/start/packer.nvim"
  local state = uv.fs_stat(install_path)
  if not state then
    local cmd = "!git clone https://github.com/wbthomason/packer.nvim " .. install_path
    api.nvim_command(cmd)
    uv.fs_mkdir(data_dir .. "lua", 511, function()
      assert("make compile path dir faield")
    end)
    self:load_packer()
    -- packer.sync()
  end
end

local plugins = setmetatable({}, {
  __index = function(_, key)
    if not packer then
      Packer:load_packer()
    end
    return packer[key]
  end,
})

function plugins.ensure_plugins()
  Packer:init_ensure_plugins()
end

function plugins.compile_notify()
  plugins.compile()
  vim.notify("Compile Done!", "info", { title = "Packer" })
end

function plugins.auto_compile()
  local file = vim.fn.expand("%:p")
  if not file:match(vim_path) then
    return
  end

  if file:match("plugins.lua") then
    plugins.clean()
  end
  plugins.compile_notify()
  require("packer_compiled")
end

function plugins.load_compile()
  if vim.fn.filereadable(packer_compiled) == 1 then
    require("packer_compiled")
  else
    vim.notify("Run PackerSync or PackerCompile", "info", { title = "Packer" })
  end

  local cmd_func = {
    Compile = "compile_notify",
    Install = "install",
    Update = "update",
    Sync = "sync",
    Clean = "clean",
    Status = "status",
  }
  -- command! PackerCompile lua require('core.pack').compile_notify()
  -- command! PackerInstall lua require('core.pack').install()
  -- command! PackerUpdate lua require('core.pack').update()
  -- command! PackerSync lua require('core.pack').sync()
  -- command! PackerClean lua require('core.pack').clean()
  -- command! PackerStatus  lua require('packer').status()
  for cmd, func in pairs(cmd_func) do
    api.nvim_create_user_command("Packer" .. cmd, function()
      require("core.pack")[func]()
    end, {})
  end
end

return plugins
