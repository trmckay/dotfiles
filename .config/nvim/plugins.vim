call plug#begin()

if TS_ENABLE
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
endif

if COC_ENABLE
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

Plug 'tpope/vim-commentary'
Plug 'windwp/nvim-autopairs'
Plug 'numtostr/FTerm.nvim'
Plug 'godlygeek/tabular'
Plug 'metakirby5/codi.vim'
Plug 'tpope/vim-surround'
Plug 'preservim/tagbar'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'hoob3rt/lualine.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'honza/vim-snippets'
Plug 'lervag/vimtex'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'plasticboy/vim-markdown'
Plug 'sbdchd/neoformat'
Plug 'skywind3000/asyncrun.vim'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-togglebg'

call plug#end()
