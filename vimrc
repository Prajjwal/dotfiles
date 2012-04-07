set nocompatible

" Pathogen
autocmd!
filetype off
call pathogen#runtime_append_all_bundles()

syntax on

" Use 256 colors in the terminal
set t_Co=256

" Set colorscheme
if ( has("gui_running") )
	colorscheme desert
else
	colorscheme desert256
endif

" General Settings [[
set number						" Always show line numbers
set tabstop=4					" Set a tab to four spaces
set shiftwidth=4				" Use four spaces while autoindenting
set showmatch
set ruler						" Show Ruler
set showmode					" Always show what mode were currently in
set ignorecase
set smartcase
set incsearch					" Use incremental search
set autochdir
set numberwidth=4
set ai							" Auto Indent
set si							" Smart Indent
set matchtime=5
set magic						" Set magic on for Regular Expressions
set cindent						" Better indentation
set nowrap						" Do not wrap anything
set lazyredraw					" Dont update display while executing macros
set guioptions-=T				" Don't show toolbars in gvim
" ]]

" Vim Behaviour [[
set hidden						" Hide buffers instead of closing them
set history=1000				" Save 1000 lines of history
set noerrorbells				" Never beep, its annoying
set nobackup					" Dont backup my files
set nowritebackup 
set noswapfile					" Dont use swapfiles
set viminfo='20,\"80			" The viminfo shouldnt store more than 80 lines of registers
set undolevels=500				" Use 500 levels of undo
set wildmenu					" More Useful command line completion
set wildmode=list:longest		" Show the longest list of matches
set cursorline					" Underline the current line
set spell spelllang=en_us		" Spellchecker
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
if has("autocmd") && exists("+omnifunc")
	 autocmd Filetype *
    \ if &omnifunc == "" |
    \ setlocal omnifunc=syntaxcomplete#Complete |
    \ endif
    endif

" Shortcut Mappings and Abbreviations [[

" Change the default dir
cd ~/

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

" So I dont have to type it all over again
nmap ,n :NERDTreeToggle<return>
" Cause NERDTree to show hidden files as well
let NERDTreeShowHidden=1

" Zencoding

imap ,e <C-y>,

" SnipMate

let g:snippets_dir = "~/.vim/snippets/"
