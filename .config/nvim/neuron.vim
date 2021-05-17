lua << EOF
local nf = require'plenary.scandir'.scan_dir('.',
    { search_pattern = "neuron.dhall", hidden = false, depth = 2 })

if not(nf[1] == nil) then
    local nd = (nf[1]):gsub("/neuron.dhall", "")
    require'neuron'.setup {
        virtual_titles = true,
        mappings = true,
        run = nil,
        neuron_dir = nd,
        leader = "gz",
    }
end
EOF

 " click enter on [[my_link]] or [[[my_link]]] to enter it
nnoremap <buffer> <CR> <cmd>lua require'neuron'.enter_link()<CR>
" create a new note
nnoremap <buffer> gzn <cmd>lua require'neuron/cmd'.new_edit(require'neuron'.config.neuron_dir)<CR>

" find your notes, click enter to create the note if there are not notes that match
nnoremap <buffer> gzz <cmd>lua require'neuron/telescope'.find_zettels()<CR>
" insert the id of the note that is found
nnoremap <buffer> gzZ <cmd>lua require'neuron/telescope'.find_zettels {insert = true}<CR>

" find the backlinks of the current note all the note that link this note
nnoremap <buffer> gzb <cmd>lua require'neuron/telescope'.find_backlinks()<CR>
" same as above but insert the found id
nnoremap <buffer> gzB <cmd>lua require'neuron/telescope'.find_backlinks {insert = true}<CR>

" find all tags and insert
nnoremap <buffer> gzt <cmd>lua require'neuron/telescope'.find_tags()<CR>

" start the neuron server and render markdown, auto reload on save
nnoremap <buffer> gzs <cmd>lua require'neuron'.rib {address = "localhost:8080", verbose = true}<CR>

" go to next [[my_link]] or [[[my_link]]]
nnoremap <buffer> gz] <cmd>lua require'neuron'.goto_next_extmark()<CR>
" go to previous
nnoremap <buffer> gz[ <cmd>lua require'neuron'.goto_prev_extmark()<CR>]]