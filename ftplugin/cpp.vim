" function!  CloseComplete(key) abort
"   if mode()[0] ==# 'i' && pumvisible()
"     return a:key . "\<C-r>=luaeval('require\"compe\"._close()')\<CR>"
"   endif
"   return a:key
" endfunction

" imap <silent> <expr> , CloseComplete(",")
