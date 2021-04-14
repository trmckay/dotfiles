"  ___ _   _ ___ _______     _____ __  __
" |_ _| \ | |_ _|_   _\ \   / /_ _|  \/  |
"  | ||  \| || |  | |  \ \ / / | || |\/| |
"  | || |\  || |  | |_  \ V /  | || |  | |
" |___|_| \_|___| |_(_)  \_/  |___|_|  |_|

" === VANILLA VIM SETTINGS ===

    " === MISC ===
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
    filetype plugin on
    set cmdheight=1
    set updatetime=100
    set shortmess+=c
    set signcolumn=yes
    syntax on

    " === LINE NUMBERS ===
    augroup numbertoggle
      autocmd!
      autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
      autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
    augroup END

    " === COMMANDS ===
    cnoreabbrev W w
    cnoreabbrev Wq wq
    cnoreabbrev WQ wq
    cnoreabbrev wQ wq

    " === KEYBINDINGS ===
    let mapleader = "\<Space>"
    " copy file contents to clipboard
    nnoremap <leader>c <cmd>!cat % \| xclip -selection clipboard<cr>
    " shortcuts for quitting
    nnoremap <C-q> <cmd>qa!<cr>
    nnoremap <C-x> <cmd>wqa<cr>
    nnoremap <C-w> <cmd>q<cr>
    " navigate splits
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l
    nnoremap <C-h> <C-w>h
    " create splits
    nnoremap <C-w> <cmd>vsplit<cr>
    nnoremap <C-s> <cmd>split<cr>
    " resize splits
    nnoremap <C-Down> <C-w>-
    nnoremap <C-Up> <C-w>+
    nnoremap <C-Right> <C-w>>
    nnoremap <C-Left> <C-w><
    " exit terminal
    tnoremap <Esc> <C-\><C-n>
    " project tree
    nnoremap <leader>t <cmd>terminal tree<cr>
    " previous file
    nmap <leader>b <c-^><cr>
    " open file under cursor
    nnoremap gX :silent :execute
            \ "!$HOME/Scripts/open" expand('%:p:h') . "/" . expand("<cfile>") " &"<cr>

    " === PRE-WRITE COMMANDS ===
    " Remove trailing whitespace on write
    autocmd BufWritePre * %s/\s\+$//e

    " === SPELL-CHECK ===
    set spelllang=en_us,de
    inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
    nnoremap <leader>s <cmd>set spell!<cr>

    " === RUST ===
    nnoremap <leader>rc <cmd>!cargo clean; cargo clippy<cr>
    nnoremap <leader>rr <cmd>!cargo run<cr>
    nnoremap <leader>rt <cmd>!cargo test<cr>

    " === MAKEFILE ===
    nnoremap <leader>cc <cmd>make<cr>

    " === SESSION ===
    " save session
    nnoremap <leader>ss <cmd>mksession! .session.vim<cr>
    " open session if no arguments are given
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && !empty(glob(".session.vim")) | source .session.vim | endif

" ======

" === PLUGINS ===

call plug#begin()
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'morhetz/gruvbox'
    Plug 'rakr/vim-togglebg'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'tpope/vim-commentary'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'godlygeek/tabular'
    Plug 'skywind3000/asyncrun.vim'
    Plug 'tpope/vim-surround'
    Plug 'sbdchd/neoformat'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'preservim/tagbar'
    Plug 'plasticboy/vim-markdown'
    Plug 'lervag/vimtex'
call plug#end()

" ======

" === PLUGIN SETTINGS ===

    " === THEMING ===
    syntax enable
    let g:airline_powerline_fonts = 1
    let g:airline_theme = "gruvbox"

    set background=dark
    if ($THEME == "light")
        set background=light
    endif

    let g:gruvbox_bold = 1
    let g:gruvbox_italic = 1
    let g:gruvbox_underline = 1
    let g:gruvbox_contrast_dark = "hard"
    let g:gruvbox_contrast_light = "hard"
    colorscheme gruvbox
    hi clear SignColumn

    call togglebg#map("<F5>")

    " === NEOFORMAT ===
    augroup fmt
        autocmd!
        autocmd BufWritePre *.{c,cpp,rs,h,py,glsl} undojoin | Neoformat
    augroup END
    let g:neoformat_cpp_clangformat = {
        \ 'exe': 'clang-format',
        \ 'args': ['--style="{IndentWidth: 4, ColumnLimit: 100}"']
    \}
    let g:neoformat_enabled_cpp = ['clangformat']
    let g:neoformat_enabled_c = ['clangformat']
    let g:neoformat_enabled_python = ['autopep8']
    let g:neoformat_basic_format_align = 1
    let g:neoformat_basic_format_retab = 1
    let g:neoformat_only_msg_on_error = 1
    let g:shfmt_opt="-ci"

    " === COC-NVIM ===
    nnoremap <leader>cy <cmd>CocEnable<cr>
    nnoremap <leader>cn <cmd>CocDisable<cr>
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    function! s:check_back_space() abort
          let col = col('.') - 1
          return !col || getline('.')[col - 1]  =~# '\s'
    endfunction
    inoremap <silent><expr> <C-space> coc#refresh()
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr CocCommand fzf-preview.CocReferences <cr>
    nmap <leader>rn <Plug>(coc-rename)
    nmap <leader>d <cmd>CocDiagnostics<cr>
    autocmd CursorHold * silent call CocActionAsync('highlight')
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        else
            call CocActionAsync('doHover')
        endif
    endfunction
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)
    nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
    nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
    nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>

    " === ASYNCRUN ===
    let g:asyncrun_open = 8

    " === PANDOC COMPILE w/ ASYNCRUN ===
    let c_pandoc_beamer = 0
    let c_pandoc_article = 0
    function Cpa()
        AsyncRun pandoc --pdf-engine=xelatex % -o /tmp/pandoc_article.pdf
    endfunction
    function Cpb()
        AsyncRun pandoc --pdf-engine=xelatex -t beamer % -o /tmp/pandoc_beamer.pdf
    endfunction
    nnoremap <leader>do :let c_pandoc_article = 1 \| !pandoc --pdf-engine=xelatex % -o /tmp/pandoc_article.pdf; zathura /tmp/pandoc_article.pdf & <CR>
    nnoremap <leader>bo :let c_pandoc_beamer = 1  \| !pandoc --pdf-engine=xelatex -t beamer % -o /tmp/pandoc_beamer.pdf; zathura /tmp/pandoc_beamer.pdf & <CR>
    autocmd BufWritePost *.md
        \ if c_pandoc_beamer  | call Cpb() | endif
    autocmd BufWritePost *.md
        \ if c_pandoc_article | call Cpa() | endif

    " === TAGBAR ===
    nmap <leader>i :TagbarToggle<CR>
    autocmd BufNew *.{c,cpp,rs,h,py} TagbarOpen

    " === FZF ===
    nnoremap <leader>f <cmd>Lines<cr>
    nnoremap <leader>e <cmd>Files<cr>
    nnoremap <leader>n <cmd>tabnew<cr><cmd>Files<cr>

    imap <C-l> <Plug>(coc-snippets-expand)
    vmap <C-j> <Plug>(coc-snippets-select)
    let g:coc_snippet_next = '<c-j>'
    let g:coc_snippet_prev = '<c-k>'
    imap <C-j> <Plug>(coc-snippets-expand-jump)
    xmap <leader>x  <Plug>(coc-convert-snippet)

    " === VIM-TEX ===
    let g:tex_flavor  = 'latex'
    let g:tex_conceal = ''
    let g:vimtex_fold_manual = 1
    let g:vimtex_compiler_progname = 'latexmk'
    let g:vimtex_view_method = 'zathura'

    " === MARKDOWN ===
    let g:vim_markdown_folding_disabled = 1
    let g:vim_markdown_math = 1
    let g:vim_markdown_frontmatter = 1

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  ignore_install = { },
  highlight = {
    enable = true,
    disable = { },
  },
}
EOF
