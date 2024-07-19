" Send to clipboard via various means
function! util#send_to_clipboard(text)
  if has("clipboard_working")
    silent call setreg('*', a:text)
  elseif executable("pbcopy")
    silent call system("pbcopy", a:text)
  endif

  silent call setreg("", a:text)
endfunction

function! util#open(uri)
  if executable("open")
    call system("open", a:uri)
  endif
endfunction
