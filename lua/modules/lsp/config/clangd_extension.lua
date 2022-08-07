require("clangd_extensions").setup({
  extensions = {
    autoSetHints = true,
    inlay_hints = {
      only_current_line = true,
    },
  },
})
