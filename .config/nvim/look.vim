syntax enable
set termguicolors

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

lua << EOF
require('lualine').setup {
  options = {theme = 'gruvbox'},
}
EOF
