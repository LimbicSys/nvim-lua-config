local cfg = {
  hint_enable = false -- virtual hint enable
}

require "lsp_signature".on_attach(cfg)
