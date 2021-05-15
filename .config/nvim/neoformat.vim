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
