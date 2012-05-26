set nocompatible

" Pathogen
autocmd!
filetype off
call pathogen#runtime_append_all_bundles()

syntax on

" Use 256 colors in the terminal
set t_Co=256

" Set colorscheme
colorscheme badwolf

" General Settings [[

set encoding=utf-8
set number
set tabstop=4
set shiftwidth=4
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
set spell spelllang=en_us
" ]]

" Wildmenu completion [[

" Stolen from: https://bitbucket.org/sjl/dotfiles/src/tip/vim/vimrc
set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
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
noremap <silent> ,h :wincmd h<cr>
noremap <silent> ,j :wincmd j<cr>
noremap <silent> ,k :wincmd k<cr>
noremap <silent> ,l :wincmd l<cr>

" c(lose) h|j|k|l
noremap <silent> ,ch :wincmd h<CR>:close<CR>
noremap <silent> ,cj :wincmd j<CR>:close<CR>
noremap <silent> ,ck :wincmd k<CR>:close<CR>
noremap <silent> ,cl :wincmd l<CR>:close<CR>

" c(lose) c(urrent)
noremap <silent> ,cc :close<CR>
noremap <silent> ,cw :cclose<CR>

" m(ove) h|j|k|l
noremap <silent> ,mh <C-W>H
noremap <silent> ,mj <C-W>J
noremap <silent> ,mk <C-W>K
noremap <silent> ,ml <C-W>L

" [w(idth) | h(eight)] [i(ncrease) | d(ecrease)]
noremap <silent> ,wi <C-W>5>
noremap <silent> ,wd <C-W>5<
noremap <silent> ,hi <C-W>5+
noremap <silent> ,hd <C-W>5-
" ]]


" Custom Indentation [[

" Ruby
autocmd FileType ruby setlocal shiftwidth=2 softtabstop=2

" JavaScript
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2
" ]]

" When vimrc is edited, reload it
autocmd bufwritepost .vimrc source $MYVIMRC

" Folding
set foldenable
" set foldmethod={,}
" Fold on the marker
set foldlevel=100 " Dont autofold

" Enable Filetype Detection
filetype plugin on
filetype indent on

" Enable syntax completion
set ofu=syntaxcomplete#Complete

" Mappings and Abbreviations [[

" Change the default dir
cd ~/

" Unfuck my screen
nnoremap <leader>u :syntax sync fromstart<cr>:redraw!<cr>

" Clean trailing whitespace
nnoremap ,w mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Use space instead of a colon (saves me hours)
map <space> :
" Map escape to ,s
imap ,s <esc>

" Quickly open vimrc in a new tab
map <f9> :tabedit $MYVIMRC<cr>
" ROT13 fun!
map <f12> ggVGg?
" Open the current directory in nautilus
nmap <f8> :! nautilus .<return>
" Map Code completion to ,c
imap ,c <C-x><C-o>
" Open a new tab
nmap ,nt :tabnew
" Close tab
nmap ,tc :tabc<cr>
" To quickly edit the font size for screencasts:
nmap ,sf :set guifont=Consolas:h
" Map rails autocomplete to ,rc
imap ,rc <C-x><C-u>
" Map buffer toggle :bn to ,tt
nmap ,tt :bn<return>

" Make the arrow keys useful
map <left> <esc>:NERDTreeToggle<return>
map <right> <esc>:tabnew<return>

" Yank to and paste from the OS clipboard:
nmap ,y "+y
nmap ,Y "+yy
nmap ,p "+p
nmap ,P "+P

" Jump to matching pairs with Tab
nnoremap <tab> %
vnoremap <tab> %

" Shortcut for building Helptags when I install a plugin:
abbrev buildht :helptags ~/.vim/doc

" Open the current file in firefox
abbrev ff :!firefox %:p<cr>
" Open the current file in chrome
abbrev chrome :!chrome %:p<cr>
" Open the current file in Gedit
abbrev gedit :!gedit %:p<cr>

" ]]

" Plugins [[

" NERDTree

let NERDTreeShowHidden=1 " Cause NERDTree to show hidden files as well

" Zencoding

imap ,e <C-y>,

" SnipMate

let g:snippets_dir = "~/.vim/snippets/"

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
" ]]
