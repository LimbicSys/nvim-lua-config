return {
  {
    "tpope/vim-projectionist",
    config = function()
      require("modules.project.config.projectionist")
    end,
  },

  {
    "windwp/nvim-projectconfig",
  },
}
