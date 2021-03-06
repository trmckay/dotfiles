call plug#begin()

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tpope/vim-fugitive'
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
Plug 'skywind3000/asyncrun.vim'
Plug 'rhysd/vim-grammarous'
Plug 'lervag/vimtex'
Plug 'plasticboy/vim-markdown'
Plug 'sbdchd/neoformat'
Plug 'preservim/tagbar'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'hoob3rt/lualine.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'rktjmp/lush.nvim'
Plug 'npxbr/gruvbox.nvim'
Plug 'rakr/vim-togglebg'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'neovim/nvim-lspconfig'
Plug 'L3MON4D3/LuaSnip'
Plug 'hrsh7th/nvim-compe'

call plug#end()

lua << EOF
require('gitsigns').setup()
EOF
