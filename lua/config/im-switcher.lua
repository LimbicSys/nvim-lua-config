local opt = {}

if vim.fn.has("wsl") == 1 then
  opt.obtain_im_cmd = "im-select.exe"
  opt.switch_im_cmd = "im-select.exe"
  opt.default_im_key = "1033"
  require("im-switcher").setup(opt)
end

-- TODO: mac config
