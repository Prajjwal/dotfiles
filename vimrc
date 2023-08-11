set nocompatible
runtime bundle/pathogen/autoload/pathogen.vim

au!
filetype plugin indent on
syntax on

" Things that need to be set before pathogen loads [[
let g:ale_completion_enabled = 1
let g:polyglot_disabled = ['markdown']
" ]]

execute pathogen#infect()

" Use 256 colors in the terminal
set t_Co=256

" Set colorscheme
set background=dark
colorscheme gruvbox

" Set Leader [[
let mapleader = ","
" ]]

" General Settings [[

set encoding=utf-8
set relativenumber
set number
set showmatch
set ruler
set showmode
set showcmd
set ignorecase
set smartcase
set incsearch
set autochdir
autocmd VimEnter * set autochdir
set autoread
set numberwidth=4
set textwidth=80
set ai
set si
set matchtime=5
set magic
set cindent
set nowrap
set lazyredraw
set guioptions-=T
set guioptions-=r
set guioptions-=m
set hidden
set history=1000
set noerrorbells
set nobackup
set nowritebackup
set noswapfile
set viminfo='20,\"80,<50,:1000,/100
set undolevels=500
set cursorline
set nospell
set autochdir
set hlsearch
set tildeop

if has("gui_gtk3")
	set guifont=Fira\ Code\ 12
elseif has("gui_macvim")
	set guifont=Monaco:h18
endif
" ]]

" Wildmenu completion [[

" Stolen from: https://bitbucket.org/sjl/dotfiles/src/tip/vim/vimrc
set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.JPG,*.psd,*.ai
set wildignore+=*.mp4,*.webm,*.flv,*.mkv         " Video
set wildignore+=*.mp3,*.amr,*.flac,*.ogg         " Audio
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store,*.tagset              " OSX bullshit
set wildignore+=*.hi                             " GHC interface files
set wildignore+=*.jar,*.class                    " Java nonsense
set wildignore+=*.rbi                            " Sorbet type definitions

set wildignore+=*.pdf,*.PDF,*.odt,*.ods          " Documents
set wildignore+=*.docx,*.doc,*.ppt,*.pptx
set wildignore+=*.xlsx,*.djvu

set wildignore+=*.eot,*.ttf,*.woff,*.woff2,*.otf " Fonts
set wildignore+=*.zip,*.tar,*.gz,*.tgz,*.bz2     " Archives
set wildignore+=*.rar,*.lzma

set wildignore+=*.torrent,*.dat

set wildignore+=*.luac                           " Lua byte code

set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code

set wildignore+=*.orig                           " Merge resolution files
" ]]

" Line Return [[

" Move the cursor to it's last position in the buffer when it was last closed.
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
" ]]

" Window Management [[

" Switch using , + h|j|k|l
noremap <silent> <leader>h :wincmd h<cr>
noremap <silent> <leader>j :wincmd j<cr>
noremap <silent> <leader>k :wincmd k<cr>
noremap <silent> <leader>l :wincmd l<cr>

" c(lose) h|j|k|l
noremap <silent> <leader>ch :wincmd h<CR>:close<CR>
noremap <silent> <leader>cj :wincmd j<CR>:close<CR>
noremap <silent> <leader>ck :wincmd k<CR>:close<CR>
noremap <silent> <leader>cl :wincmd l<CR>:close<CR>

" c(lose) c(urrent)
noremap <silent> <leader>cc :close<CR>
noremap <silent> <leader>cw :cclose<CR>

" m(ove) h|j|k|l
noremap <silent> <leader>mh <C-W>H
noremap <silent> <leader>mj <C-W>J
noremap <silent> <leader>mk <C-W>K
noremap <silent> <leader>ml <C-W>L

" [w(idth) | h(eight)] [i(ncrease) | d(ecrease)]
noremap <silent> <leader>wi <C-W>5>
noremap <silent> <leader>wd <C-W>5<
noremap <silent> <leader>hi <C-W>5+
noremap <silent> <leader>hd <C-W>5-
" ]]

au BufNewFile,BufRead *.html.erb set filetype=eruby.html
au BufNewFile,BufRead *_spec.rb set filetype=ruby.rspec
au BufRead /tmp/psql.edit.* set filetype=sql

" Indentation [[

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set textwidth=80

au FileType gitcommit setlocal textwidth=72
au FileType html setlocal textwidth=0
" ]]

" When vimrc is edited, reload it
au bufwritepost .vimrc source $MYVIMRC

" Folding
set foldenable
" set foldmethod={,}
" Fold on the marker
set foldlevel=100 " Dont autofold

" Enable syntax completion
set omnifunc=ale#completion#OmniFunc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Mappings and Abbreviations [[

" Unfuck my screen
nnoremap <leader>u :syntax sync fromstart<cr>:redraw!<cr>

" Clean trailing whitespace
nnoremap <leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Use space instead of a colon (saves me hours)
noremap <space> :
" Map escape to <leader>s
inoremap <leader>s <esc>

" Quickly open vimrc in a new tab
noremap <f9> :tabedit $MYVIMRC<cr>
" ROT13 entire buffer
noremap <f12> ggVGg?
" Open a new tab
nnoremap <leader>nt :tabnew
" Close tab
nnoremap <leader>tc :tabc<cr>
" To quickly edit the font size for screencasts:
nnoremap <leader>sf :set guifont=Consolas:h
" Make 'gf' open a new file if the name under the cursor doesn't exist
nnoremap gf :e <cfile><CR>

" Make the arrow keys useful:
" Move lines up and down in both normal and insert mode with the up/down arrows
nnoremap <up> ddkP
inoremap <up> <esc>ddkPi
nnoremap <down> ddp
inoremap <down> <esc>ddpi
" Move b/w tabs with the l/r arrows
nnoremap <left> gT
nnoremap <right> gt

" Completion
inoremap <leader>c <C-x><C-o>
inoremap <leader>ca <C-p>
inoremap <leader>cl <C-x><C-l>

" Yank to and paste from the OS clipboard:
if has("clipboard")
	nnoremap <leader>y "+y
	nnoremap <leader>Y "+yy
	nnoremap <leader>p "+p
	nnoremap <leader>P "+P
elseif exists("$SPIN")
	set clipboard=unnamed

	nnoremap <leader>y :set opfunc=Pbcopy<cr>g@
	vnoremap <leader>y y:silent call system("pbcopy", getreg(""))<CR>
	nnoremap <leader>p :call setreg("", system("pbpaste"))<CR>p

	function! Pbcopy(type, ...)
		" yank whole lines, which is my most common use case
		silent execute 'normal! `[yV`]'
		silent call system("pbcopy", getreg(""))
	endfunction
endif

" Insert current date
nnoremap <f5> "=strftime("%b %d, %Y %X")<cr>P

" Open the current file in firefox
abbrev ff :!firefox %:p<cr>
" Open the current file in chrome
abbrev chrome :!google-chrome %:p<cr>
" Open the current file in Gedit
abbrev gedit :!gedit %:p<cr>

" Insert my email address quickly
iabbrev @@ sin@prajjwal.com

" Turn autoformat on/off for local buffer
nnoremap <f1> :setlocal fo+=a<cr>
nnoremap <f2> :setlocal fo-=a<cr>

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" ]]

" Plugins [[

" UltiSnips
let g:UltiSnipsSnippetDirectories=["UltiSnips", "bundle/vim2hs/UltiSnips"]
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-u>"
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsEditSplit="context"
let g:UltiSnipsUsePythonVersion=3
" precedence (scss -> css)
au FileType scss UltiSnipsAddFiletypes scss.css
au FileType typescript UltiSnipsAddFiletypes typescript.typescriptreact

noremap <silent> <f6> :UltiSnipsEdit

" Ctrlp
let g:ctrlp_switch_buffer = 2
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_max_height = 15
let g:ctrlp_custom_ignore = '\v(node_modules|bower_components|tmp|Library)$'
let g:ctrlp_max_depth = 25
let g:ctrlp_max_files = 25000
let g:ctrlp_lazy_update = 1
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" slimv
let g:slimv_impl = 'sbcl'
let g:slimv_swank_cmd = '! xterm -e sbcl --load ~/.vim/bundle/slimv/slime/start-swank.lisp &'
let g:scheme_builtin_swank = 1
let g:slimv_swank_scheme = '! xterm -e scheme --eval "(let loop() (start-swank) (loop))" &'
let g:slimv_keybindings = 2
let g:slimv_browser_cmd = 'firefox'
let g:slimv_browser_cmd_suffix = ''
let g:slimv_clhs_root = 'file:///usr/local/doc/HyperSpec/Body/'

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,jsx,typescriptreact,eruby EmmetInstall

" Asynchronous Lint Engine
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_delay = 1000
let g:ale_completion_delay = 300

let g:ale_fixers = { }
let g:ale_fixers['c'] = ['clang-format']
let g:ale_fixers['cpp'] = ['clang-format']

let g:ale_linters = { }
let g:ale_linters['c'] = ['clangtidy']
let g:ale_linters['cpp'] = ['clangtidy']
let g:ale_linters['rust'] = ['cargo']

call ale#linter#Define('ruby', {
\   'name': 'sorbae',
\   'aliases': ['srb'],
\   'lsp': 'stdio',
\   'cwd': function('ale#ruby#FindProjectRoot'),
\   'language': 'ruby',
\   'executable': {b -> ale#Var(b, 'ruby_sorbet_executable')},
\   'command': function('ale_linters#ruby#sorbet#GetCommand'),
\   'project_root': function('ale#ruby#FindProjectRoot')
\})

let g:ale_linters['ruby'] = ['sorbae', 'ruby']

nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
imap <C-Space> <Plug>(ale_complete)
nmap <C-right> <Plug>(ale_go_to_definition)
nmap <S-right> <Plug>(ale_go_to_definition_in_tab)
nmap <S-F> <Plug>(ale_find_references)
noremap <silent> <leader>d :ALEDetail<cr>
noremap <f8> :ALEToggleBuffer<cr>

" QFEnter
let g:qfenter_keymap = {}
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']
let g:qfenter_keymap.topen = ['<C-t>']

" Vim Wiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
noremap <leader>i <plug>VimwikiDiaryIndex

" Grepper
let g:grepper = {}
let g:grepper.jump = 0
let g:grepper.dir = 'repo'
let g:grepper.stop = 500
noremap <C-g> :Grepper<cr>

" Vue
let g:vue_disable_pre_processors=1

inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"
" ]]

" Util [[
" TODO: Move this to a lib

" Semi intelligently insert comma separate a ruby/js hash.
nnoremap <leader>c :/{/+,/}/-2s/[^,]\zs$/,/g<CR>
" ]]

" Source system specific configuration
if filereadable(expand("~/.local_vimrc"))
  source ~/.local_vimrc
endif
