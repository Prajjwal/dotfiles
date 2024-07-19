if !executable("git")
	finish
endif

" Find git root relative to current file
function! git#root()
  return fnameescape(fnamemodify(finddir('.git', escape(expand('%:p:h'), ' ') . ';'), ':h'))
endfunction

function! git#path_relative_to_root()
  let l:git_root = git#root()

  return (l:git_root == '.')
        \? expand("%")
        \: substitute(expand("%:p"), l:git_root . '/', '', '')
endfunction

" Yank current file path relative to git root
function! git#yank_relative_to_root()
	let l:path = git#path_relative_to_root()
  silent call util#send_to_clipboard(l:path)
endfunction

function! git#browse() abort range
	let l:base_remote_url = substitute(system('git ls-remote --get-url origin'), '.git\n$', '', '')
	let l:git_branch = trim(system('git branch --show-current'))
	let l:path = git#path_relative_to_root()

	let l:remote_url = l:base_remote_url . '/blob/' . l:git_branch . '/' . l:path

	if (a:firstline != a:lastline)
		let l:remote_url .= '#L' . a:firstline . '-L' . a:lastline
	endif

	silent call util#send_to_clipboard(l:remote_url)
endfunction
