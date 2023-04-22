function! SourceForSpec()
  let l:filepath = expand("%:p")
  let l:one = substitute(l:filepath, "_spec.rb", ".rb", "")
  let l:two = substitute(l:one, "spec/", "app/", "")

  return l:two
endfunction

function! SpecForSource()
  let l:filepath = expand("%:p")
  let l:one = substitute(l:filepath, ".rb", "_spec.rb", "")
  let l:two = substitute(l:one, "app/", "spec/", "")

  return l:two
endfunction

function! Alternate()
  let l:filepath = expand("%:p")

  if l:filepath =~ "_spec.rb$"
    return SourceForSpec()
  else
    return SpecForSource()
  endif
endfunction

command! AV execute "vsp " .. Alternate()
