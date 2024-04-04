-- Setup treesitter
require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "org" },
  },
  ensure_installed = { "org" },
})

-- Setup orgmode
require("orgmode").setup({
  org_startup_folded = "content",
  org_agenda_files = "~/orgfiles/**/*",
  org_default_notes_file = "~/orgfiles/refile.org",
  org_capture_templates = {
    j = {
      description = "Journal",
      template = "\n**** %U\n\n%?",
      target = "~/orgfiles/journal/%<%Y-%m-%d>.org",
    },
  },
})
