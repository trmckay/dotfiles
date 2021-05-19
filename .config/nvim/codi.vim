let g:codi#rightsplit=1
let g:codi#rightalign=1

function CodiLaunch(...)
    execute 'e ' . a:1
    set ft=python
    nnoremap cu <cmd>CodiUpdate<cr>
    :Codi!!
    :TZMinimalist
endfunction

command -nargs=1 CodiOpen call CodiLaunch(<q-args>)
command CodiLaunch call CodiLaunch('~/.codi.py')

let g:codi#rightalign=1
let g:codi#virtual_text=1
let g:codi#autocmd="TextChanged"
