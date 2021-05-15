let g:asyncrun_open = 8
let do_pandoc_compile = 0
function PandocCompile()
    AsyncRun pandoc --pdf-engine=xelatex % -o "$(echo % | sed 's/\.md/\.pdf/')"
endfunction
nnoremap <leader>do :let do_pandoc_compile = 1
autocmd BufWritePost *.md
    \ if do_pandoc_compile | call PandocCompile() | endif
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
