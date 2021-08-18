function!  CloseComplete(...) abort
  if mode()[0] ==# 'i' && pumvisible()
    return "\<C-e>,\<C-r>=luaeval('require\"compe\"._close()')\<CR>"
  endif
  return ","
endfunction

imap <silent> <expr> , CloseComplete()
