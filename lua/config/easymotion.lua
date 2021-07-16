vim.g.EasyMotion_smartcase = 1
-- vim.g.EasyMotion_startofline = 0 -- keep cursor colum when JK motion

-- nmap <Leader><Leader>s <Plug>(easymotion-s)
-- map <Leader><Leader>l <Plug>(easymotion-lineforward)
-- map <Leader><Leader>j <Plug>(easymotion-j)
-- map <Leader><Leader>k <Plug>(easymotion-k)
-- map <Leader><Leader>h <Plug>(easymotion-linebackward)
-- map  <Leader>f <Plug>(easymotion-bd-f)
-- nmap <Leader>f <Plug>(easymotion-overwin-f)

vim.api.nvim_set_keymap("", "<Leader><Leader>s", "<Plug>(easymotion-s)", {})

-- Move to line
-- map <Leader><Leader>L <Plug>(easymotion-bd-jk)
-- nmap <Leader><Leader>L <Plug>(easymotion-overwin-line)

-- Move to word
-- map  <Leader><Leader>w <Plug>(easymotion-bd-w)
-- nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)--

-- map  <Leader><Leader>/ <Plug>(easymotion-sn)
-- omap <Leader><Leader>/ <Plug>(easymotion-tn)

-- These `n` & `N` mappings are options. You do not have to map `n` & `N` to
-- EasyMotion.
-- Without these mappings, `n` & `N` works fine. (These mappings just provide
-- different highlight method and have some other features )
-- map  n <Plug>easymotion-next)
-- map  N <Plug>(easymotion-prev)
--
-- nmap s <Plug>(easymotion-s2)
-- nmap t <Plug>(easymotion-t2)
