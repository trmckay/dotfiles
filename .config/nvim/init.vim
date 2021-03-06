" General settings
set encoding=UTF-8
set nu rnu
set linebreak
set showbreak=+++
set textwidth=100
set showmatch
set smartcase
set ignorecase
set incsearch
set autoindent
set autoread
set shortmess=a
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4
set undolevels=1000
set backspace=indent,eol,start
set hidden
set nobackup
set nowritebackup
set nocompatible
set cmdheight=1
set updatetime=100
set shortmess+=c
set signcolumn=yes
set mouse=a
set clipboard+=unnamedplus

syntax on
filetype plugin on

" These kill me
cnoreabbrev W w
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev wQ wq
cnoreabbrev Q q
cnoreabbrev Lw w
cnoreabbrev "w w

" Remap leader key
let mapleader = "\<Space>"

" Open the file in less for copying.
nnoremap <leader>c <cmd>!less %<cr>

" Shortcuts for quitting
nnoremap <C-q> <cmd>qa!<cr>
nnoremap <C-x> <cmd>wqa<cr>

" Create splits
nnoremap <M-w> <cmd>vsplit<cr>
nnoremap <M-s> <cmd>ssplit<cr>

" Resize splits
nnoremap <C-j> <C-w>-
nnoremap <C-i> <C-w>+
nnoremap <C-l> <C-w>>
nnoremap <C-h> <C-w><

" New tab
nnoremap <C-t> <cmd>tabnew<cr>

" Exit terminal
tnoremap <Esc> <C-\><C-n>

" Go back to previous file
nmap <leader>b <c-^><cr>

" open file under cursor
nnoremap gX :silent :execute
            \ "!$HOME/Scripts/open" expand('%:p:h') . "/" . expand("<cfile>") " &"<cr>

" Remove trailing whitespace on write
autocmd BufWritePre * %s/\s\+$//e

" Spell checking
set spelllang=en_us,de
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
nnoremap <leader>ss <cmd>set spell<cr>


source $NVIM_PREFIX/plugins.vim
source $NVIM_PREFIX/lsp.lua
source $NVIM_PREFIX/treesitter.vim
source $NVIM_PREFIX/latex.vim
source $NVIM_PREFIX/look.vim
source $NVIM_PREFIX/markdown.vim
source $NVIM_PREFIX/neoformat.vim
source $NVIM_PREFIX/navigation.vim
source $NVIM_PREFIX/tmux.vim
source $NVIM_PREFIX/codi.vim
source $NVIM_PREFIX/git.vim
source $NVIM_PREFIX/tree.vim
