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
