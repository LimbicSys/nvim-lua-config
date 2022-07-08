local augroup = require("easy-augroup")

augroup.create_cmd_group("DetectIndentGroup", {
  {
    event = "BufRead",
    opts = {
      pattern = "*",
      command = "DetectIndent",
    },
  },
})
