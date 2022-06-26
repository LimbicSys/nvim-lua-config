local augroup = require("easy-augroup")

augroup.create_cmd_group("PackerCompile", {
  {
    event = "BufWritePost",
    opts = {
      pattern = "plugins.lua",
      command = "source <afile> | PackerCompile",
    },
  },
})
