set nocompatible

" Pathogen
au!
filetype off
call pathogen#runtime_append_all_bundles()

syntax on

" Use 256 colors in the terminal
set t_Co=256

" Set colorscheme
colorscheme badwolf

" Set Leader [[
let mapleader = ","
" ]]

" General Settings [[

set encoding=utf-8
set relativenumber
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
" ]]

" Wildmenu completion [[

" Stolen from: https://bitbucket.org/sjl/dotfiles/src/tip/vim/vimrc
set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.mp4,*.webm,*.flv               " Video
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

set wildignore+=*.luac                           " Lua byte code

set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code

set wildignore+=*.orig                           " Merge resolution files
" ]]

" Line Return [[

" Make sure Vim returns to the same line when you reopen a file.
" Stolen from: https://bitbucket.org/sjl/dotfiles/src/tip/vim/vimrc
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END
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

" Indentation [[

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

au FileType ruby,coffee,cucumber,eruby,haml,sass,scss,yaml,markdown,vim,handlebars,jade,javascript setlocal expandtab tabstop=2 shiftwidth=2
au FileType python,perl setlocal expandtab
au FileType gitcommit set textwidth=72
" ]]

" When vimrc is edited, reload it
au bufwritepost .vimrc source $MYVIMRC

" Folding
set foldenable
" set foldmethod={,}
" Fold on the marker
set foldlevel=100 " Dont autofold

" Enable syntax completion
set ofu=syntaxcomplete#Complete

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

" Open the current file in firefox
abbrev ff :!firefox %:p<cr>
" Open the current file in chrome
abbrev chrome :!google-chrome %:p<cr>
" Open the current file in Gedit
abbrev gedit :!gedit %:p<cr>

" Insert my email address quickly
iabbrev @@ sin@prajjwal.com

" ]]

" Plugins [[

" NERDTree
let NERDTreeShowHidden=1 " Cause NERDTree to show hidden files as well

" Zencoding
inoremap <leader>e <C-Y>,

" UltiSnips
let g:UltiSnipsSnippetDirectories=["snippets", "UltiSnips"]
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open=1 " Check for errors when a file is opened
let g:syntastic_echo_current_error=1
let g:syntastic_enable_balloons=1 " Display error messages in balloons on hover
let g:syntastic_auto_loc_list=1
let g:syntastic_auto_jump=1 " Automatically jump to the first error in file

" Ctrlp
let g:ctrlp_switch_buffer = 2
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_max_height = 15

" slimv
let g:slimv_impl = 'sbcl'
let g:slimv_swank_cmd = '! xterm -e sbcl --load ~/.vim/bundle/slimv/slime/start-swank.lisp &'
let g:scheme_builtin_swank = 1
let g:slimv_swank_scheme = '! xterm -e scheme --eval "(let loop() (start-swank) (loop))" &'
let g:slimv_keybindings = 2
let g:slimv_browser_cmd = 'firefox'
let g:slimv_browser_cmd_suffix = ''
let g:slimv_clhs_root = 'file:///usr/local/doc/HyperSpec/Body/'
" ]]
