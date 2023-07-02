-- basic config and other plugins
require("core")

-- load after installed plugins
-- require("statusline")

-- TODO: load with lazy
require("cpp-helper")
require("java-helper")
require("im-switcher")
require("toggle-list")
require("open-recent")

-- load project config at last
require("nvim-projectconfig").load_project_config()
