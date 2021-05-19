call plug#begin()

if TS_ENABLE
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
endif

if COC_ENABLE
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

" General
Plug 'christoomey/vim-tmux-navigator'
Plug 'metakirby5/codi.vim'
Plug 'numtostr/FTerm.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'kdav5758/TrueZen.nvim'
Plug 'tpope/vim-surround'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'windwp/nvim-autopairs'
Plug 'skywind3000/asyncrun.vim'

" Typesetting
Plug 'lervag/vimtex'
Plug 'plasticboy/vim-markdown'

" Formatting
Plug 'sbdchd/neoformat'

" Navigation
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'preservim/tagbar'

" Look
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'hoob3rt/lualine.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'rktjmp/lush.nvim'
Plug 'npxbr/gruvbox.nvim'
Plug 'rakr/vim-togglebg'

call plug#end()

lua << EOF
require('gitsigns').setup()
require('nvim-autopairs').setup()
EOF
