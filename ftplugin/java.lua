local jdtls = require("jdtls")

local data_path = vim.fn.stdpath("data")
local jdtls_path = data_path .. "/lsp_servers/jdtls"
local config_file_path = jdtls_path .. "/config_linux"
local jar = vim.fn.expand(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")

if vim.fn.has("mac") == 1 then
  config_file_path = jdtls_path .. "/config_mac"
end

-- TODO: refer to lsp installer's config
local common_config = require("modules.lsp.config.lspconfig.settings.common").common_config
local jdtls_config = {}
jdtls_config = vim.tbl_deep_extend("force", jdtls_config, common_config)
jdtls_config["cmd"] = {
  "java",
  "-Declipse.application=org.eclipse.jdt.ls.core.id1",
  "-Dosgi.bundles.defaultStartLevel=4",
  "-Declipse.product=org.eclipse.jdt.ls.core.product",
  "-Dlog.protocol=true",
  "-Dlog.level=ALL",
  "-Xms1g",
  "--add-modules=ALL-SYSTEM",
  "--add-opens",
  "java.base/java.util=ALL-UNNAMED",
  "--add-opens",
  "java.base/java.lang=ALL-UNNAMED",
  "-jar",
  jar,
  "-configuration",
  config_file_path,
  "-data",
  data_path .. "/javaworkspace/folder",
}

jdtls_config["root_dir"] = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", ".root", "pom.xml" })

jdtls_config["settings"] = {
  java = {
    signatureHelp = { enabled = true },
    completion = {
      enable = true,
      overwrite = false
    }
  }
}

jdtls_config["on_attach"] = function(client, bufnr)
  common_config.on_attach(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "<M-o>", require("jdtls").organize_imports, opts)
  vim.keymap.set("x", "<leader>em", function()
    jdtls.extract_method(true)
  end, opts)

  vim.cmd([[
    command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_compile JdtCompile lua require('jdtls').compile(<f-args>)
    command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)
    command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()
    command! -buffer JdtJol lua require('jdtls').jol()
    command! -buffer JdtBytecode lua require('jdtls').javap()
    command! -buffer JdtJshell lua require('jdtls').jshell()
  ]])

  local navic_ok, navic = pcall(require, "nvim-navic")
  if navic_ok then
    navic.attach(client, bufnr)
  end
end

jdtls.start_or_attach(jdtls_config)
