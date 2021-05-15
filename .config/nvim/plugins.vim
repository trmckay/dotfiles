call plug#begin()

if TS_ENABLE
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
endif

if COC_ENABLE
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'metakirby5/codi.vim'
Plug 'tpope/vim-surround'
Plug 'preservim/tagbar'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'lervag/vimtex'
Plug 'plasticboy/vim-markdown'
Plug 'sbdchd/neoformat'
Plug 'skywind3000/asyncrun.vim'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-togglebg'
call plug#end()
