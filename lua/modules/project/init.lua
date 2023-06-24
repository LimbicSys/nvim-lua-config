return {
  {
    "tpope/vim-projectionist",
    config = function()
      require("modules.project.config.projectionist")
    end,
  },

  {
    "windwp/nvim-projectconfig",
    config = function()
      require("nvim-projectconfig").load_project_config()
    end,
  },
}
