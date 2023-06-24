return {
  {
    "puremourning/vimspector",
    lazy = true,
    config = function()
      require("modules.debug.config.vimspector")
    end,
  },
}
