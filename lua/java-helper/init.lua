local augroup = require("easy-augroup")

augroup.create_cmd_group("JavaNewFile", {
  {
    event = "BufNewFile",
    opts = {
      pattern = { "*.java" },
      callback = require("java-helper.generator").generated_template,
    },
  },
})
