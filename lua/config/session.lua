-- close NvimTree before saving the session
vim.g.auto_session_pre_save_cmds = {"tabdo NvimTreeClose"}

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,options,tabpages,winsize,resize,winpos,terminal"
