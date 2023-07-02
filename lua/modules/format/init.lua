return {
  {
    -- "lukas-reineke/format.nvim",
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    config = function()
      require("modules.format.config.format")
    end,
  },
}
