colorscheme torte

set guioptions-=T       " no toolbar menu
set background=dark     " need to say?
set guifont=Menlo:h13   " font, little bigger.

set wildignore+=_site/** " avoid command-t to list _site folder in Jekyll projects.

highlight CursorLine gui=underline guibg=NONE
highlight Pmenu      guifg=Black guibg=Grey 
highlight PmenuSel   guifg=Black guibg=Yellow 
highlight PmenuSbar  guifg=Black guibg=Grey
highlight PmenuThumb guifg=DarkGrey 
highlight Search     guibg=Yellow
highlight LineNr     guifg=Grey
highlight Normal     guifg=White

