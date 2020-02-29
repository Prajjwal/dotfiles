let g:ale_completion_enabled = 1

set nocompatible
runtime bundle/pathogen/autoload/pathogen.vim

" Pathogen
au!
filetype plugin on
syntax on

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
set viminfo='20,\"80
set undolevels=500
set cursorline
set nospell
set autochdir
set hlsearch
set tildeop

" Font for MacOS and Linux
set guifont=Fira\ Code:h12

if has("gui_gtk3")
	set guifont=Fira\ Code\ 12
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

" Filetypes
filetype plugin on
filetype indent on

autocmd BufNewFile,BufRead *.html.erb set filetype=eruby.html
au BufRead /tmp/psql.edit.* set filetype=sql

" Indentation [[

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

au FileType ruby,coffee,cucumber,eruby,haml,sass,scss,yaml,markdown,vim,handlebars,jade,javascript,vue setlocal expandtab tabstop=2 shiftwidth=2
au FileType python,perl setlocal expandtab
au FileType gitcommit set textwidth=72
au FileType haskell setlocal expandtab
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

" Change the default dir
cd ~/

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
" Map rails autocomplete to <leader>rc
inoremap <leader>rc <C-x><C-u>
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
nnoremap <leader>y "+y
nnoremap <leader>Y "+yy
nnoremap <leader>p "+p
nnoremap <leader>P "+P

" Jump to matching pairs with Tab
nnoremap <tab> %
vnoremap <tab> %

" Make H and L useful in normal mode
nnoremap H 0
nnoremap L $

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
let g:UltiSnipsUsePythonVersion=3
au FileType scss UltiSnipsAddFiletypes scss.css

noremap <silent> <f6> :UltiSnipsEdit

" Ctrlp
let g:ctrlp_switch_buffer = 2
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_max_height = 15
let g:ctrlp_custom_ignore = '\v(node_modules|bower_components|tmp|Library)$'

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
autocmd FileType html,css EmmetInstall

" Asynchronous Lint Engine
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_delay = 1000

let g:ale_fixers = { }
let g:ale_fixers['c'] = ['clang-format']
let g:ale_fixers['cpp'] = ['clang-format']

let g:ale_linters = { }
let g:ale_linters['c'] = ['clangtidy']
let g:ale_linters['cpp'] = ['clangtidy']
let g:ale_linters['ruby'] = ['solargraph', 'rubocop']

nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
noremap <silent> <leader>d :ALEDetail<cr>
noremap <f8> :ALEToggleBuffer<cr>

" Vim Wiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
noremap <leader>i <plug>VimwikiDiaryIndex

" Fucking thing clashes with markdown wikis
let g:polyglot_disabled = ['markdown']

" Vue
let g:vue_disable_pre_processors=1

inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"
" ]]
