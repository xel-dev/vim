set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
" Bundle import FROM HERE ---------------------------------
call vundle#begin()

" Format reminder:
" Bundle 'githubUsername/repoName

" Let vundle manage itself
Bundle 'VundleVim/Vundle.vim'

" Colorscheme
Bundle 'morhetz/gruvbox'

" Fuzzy finder
Bundle 'ctrlpvim/ctrlp.vim'

" Comment ease-of-use plugin
Bundle 'tpope/vim-commentary'

" Proper JSON filetype detection, and support
Bundle 'leshill/vim-json'

" Syntax highlighting for Javascript
Plugin 'pangloss/vim-javascript'

" Indent support for JS
Plugin 'vim-scripts/JavaScript-Indent'

" Indent support for HTML
Bundle 'indenthtml.vim'

" Markdown syntax support
Bundle 'tpope/vim-markdown'

" Line indentation visualiser
Plugin 'Yggdroot/indentLine'

" Basic multi-language support for rare use of random languages I don't have
" proper pluging support for
Plugin 'sheerun/vim-polyglot'

" Tree folder viewer
Plugin 'scrooloose/nerdtree'

" Smooth scrolling/comfortable motion
Plugin 'yuttie/comfortable-motion.vim'

" Autocompletion for brackets, braces, and quotes
Plugin 'Raimondi/delimitMate'

call vundle#end()

call plug#begin('~/.vim/plugged')

" Testing CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Bundle import ENDS HERE ---------------------------------
filetype plugin indent on " Filetype auto-detection
syntax on " Syntax highlighting

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab " use spaces instead of tabs.
set smarttab " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " tab / shifting moves to closest tabstop.
set autoindent " Match indents on new lines.
set smartindent " Intellegently dedent / indent new lines based on rules.

" don't nag me when hiding buffers
set hidden " allow me to have buffers with unsaved changes.
set autoread " when a file has changed on disk, just load it. Don't ask.

" Make search more sane
set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
set gdefault " use the `g` flag by default.

" allow the cursor to go anywhere in visual block mode.
set virtualedit+=block

" leader is a key that allows you to have your own "namespace" of keybindings.
" You'll see it a lot below as <leader>
let mapleader = ","

" So we don't have to press shift when we want to get into command mode.
nnoremap ; :
vnoremap ; :

" So we don't have to reach for escape to leave insert mode.
inoremap jf <esc>

" create new vsplit, and switch to it.
noremap <leader>v <C-w>v

" Use sane regex's when searching
nnoremap / /\v
vnoremap / /\v

" Clear match highlighting
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Quick buffer switching - like cmd-tab'ing
nnoremap <leader><leader> <c-^>

" Visual line nav, not real line nav
" If you wrap lines, vim by default won't let you move down one line to the
" wrapped portion. This fixes that.
noremap j gj
noremap k gk

" Map the key for toggling comments with vim-commentary
nnoremap <leader>c <Plug>CommentaryLine

" Let ctrlp have up to 15 results.
let g:ctrlp_max_height = 15

" Status bar
set laststatus=2

" Show line numbers
set number

" Set status line display
set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Adding HTML binding to ejs files
au BufNewFile,BufRead *.ejs set filetype=html

" Setting indentLine characters colour
let g:indentLine_setColors = 0

" Apparently I need to set how my backspace is meant to function because for
" some reason it broke. Not sure which plugin either :/
set backspace=indent,eol,start  

" Removing detailed help info for methods in YCM after method selected
let g:ycm_autoclose_preview_window_after_completion = 1

" Binding ff to open NerdTree
map ff :NERDTreeToggle<CR>

" Enabling smooth scrolling w/ mouse and setting movement physics
set mouse=a
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(10)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-10)<CR>

let delimitMate_expand_cr = 1
au FileType mail let b:delimitMate_expand_cr = 1

let delimitMate_expand_space = 1
au FileType tcl let b:delimitMate_expand_space = 1

" Adding our colourscheme
colorscheme gruvbox
set background=dark

