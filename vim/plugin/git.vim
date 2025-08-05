if !executable("git")
	finish
endif

function! git#ssh_url_to_https(url)
  if a:url =~# '^git@'
    let parts = matchlist(a:url, '^git@\([^:]\+\):\(.*\)$')

    if !empty(parts)
      let domain = parts[1]
      let path = parts[2]
      return 'https://' . domain . '/' . path
    endif
  endif

  " Return original URL if no transformation was possible
  return a:url
endfunction

" Find git root relative to current file
function! git#root()
  return fnameescape(fnamemodify(system('git rev-parse --show-toplevel'), ':h'))
endfunction

function! git#path_relative_to_root()
  let l:git_root = git#root()
  let l:path = (l:git_root == '.')
        \? expand("%")
        \: substitute(expand("%:p"), l:git_root . '/', '', '')

  " For relative path, if it starts with src/areas/*/* then remove that prefix
  if l:path =~# '^src/areas/[^/]\+/[^/]\+'
    return substitute(l:path, '^src/areas/[^/]\+/[^/]\+/', '', '')
  endif

  return l:path
endfunction

" Get path for GitHub links - only remove leading 'src'
function! git#path_for_github()
  let l:git_root = git#root()
  let l:path = (l:git_root == '.')
        \? expand("%")
        \: substitute(expand("%:p"), l:git_root . '/', '', '')

  " For GitHub links, only remove the leading 'src'
  if l:path =~# '^src/'
    return substitute(l:path, '^src/', '', '')
  endif

  return l:path
endfunction

" Yank current file path relative to git root
function! git#yank_relative_to_root(append_lineno = v:false)
	let l:path = git#path_relative_to_root()

  if a:append_lineno
    let l:path .= ":" . getpos('.')[1]
  endif

  silent call util#send_to_clipboard(l:path)
endfunction

function! git#remote_url() abort
	let l:base_remote_url = substitute(system('git ls-remote --get-url origin'), '.git\n$', '', '')
	let l:git_branch = exists('g:git_branch_remote') ? g:git_branch_remote : trim(system('git branch --show-current'))
	let l:path = git#path_for_github()
	let l:remote_url = l:base_remote_url . '/blob/' . l:git_branch . '/' . l:path

  return git#ssh_url_to_https(l:remote_url)
endfunction

function! git#browse() abort range
	silent call util#send_to_clipboard(git#remote_url())
endfunction

function! git#browse_selection() abort range
  let l:remote_url = git#remote_url()

  let l:remote_url .= '#L' . a:firstline

	if (a:firstline != a:lastline)
		let l:remote_url .= '-L' . a:lastline
	endif

	silent call util#send_to_clipboard(git#ssh_url_to_https(l:remote_url))
endfunction
