local cmp = require("cmp")
local keymap = require("cmp.utils.keymap")
local feedkeys = require("cmp.utils.feedkeys")
local clangd_source = require("modules.complete.config.complete_sources.clangd-constructor")

vim.opt.completeopt = { "menuone", "noinsert", "noselect" }

cmp.register_source("clangd_constructor", clangd_source.new())

local keymap_cinkeys = function(expr)
  return string.format(keymap.t("<Cmd>set cinkeys=%s<CR>"), expr and vim.fn.escape(expr, "| \t\\") or "")
end

local confirm = function(fallback)
  if cmp.visible() then
    feedkeys.call(keymap_cinkeys(), "n")
    cmp.confirm({ select = true })
    feedkeys.call(keymap_cinkeys(vim.bo.cinkeys), "n")
  else
    fallback()
  end
end

cmp.setup({
  snippet = {
    expand = function(args)
      -- You must install `vim-vsnip` if you use the following as-is.
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  completion = {
    keyword_length = 1,
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping(confirm, { "i" }),
  },
  -- You should specify your *installed* sources.
  sources = cmp.config.sources({
    { name = "clangd_constructor" },
    { name = "nvim_lsp" },
    { name = "vsnip" },
    -- {name = "luasnip"},
    -- {name = "buffer"},
    { name = "path" },
    { name = "nvim_lsp_signature_help" },
  }),
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.recently_used,
      cmp.config.compare.score,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
})

-- you need setup cmp first put this after cmp.setup()
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", function()
  if vim.bo.filetype ~= "sh" then
    cmp_autopairs.on_confirm_done({ map_char = { tex = "" } })
  end
end)

vim.cmd([[highlight! link CmpItemAbbrMatch Pmenu]])

vim.cmd([[highlight! link CmpItemAbbrMatchFuzzy Pmenu]])

vim.cmd([[highlight! link CmpItemMenu Pmenu]])

vim.cmd([[highlight! CmpItemAbbrDeprecated gui=strikethrough]])

cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "nvim_lsp_document_symbol" },
    { name = "buffer" },
  }),
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources(
    { { name = "path" } },
    { { name = "cmdline", option = { ignore_cmds = { "Man", "!" } } } }
  ),
})
