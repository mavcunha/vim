" automatic runtime management (https://github.com/tpope/vim-pathogen)
runtime bundle/vim-pathogen/autoload/pathogen.vim 
call pathogen#infect()

syntax on 

filetype plugin indent on 
set ofu=syntaxcomplete#Complete

autocmd Filetype java setlocal omnifunc=javacomplete#Complete

highlight Pmenu      ctermfg=Black ctermbg=Grey 
highlight PmenuSel   ctermfg=Black ctermbg=Yellow 
highlight PmenuSbar  ctermfg=Black ctermbg=Grey
highlight PmenuThumb ctermfg=DarkGrey 
highlight Search     ctermbg=Yellow

set modelines=3 " scan 3 lines for vim opts
set nobackup    " no ~filename around
set ignorecase  " search ignore case
set smartcase   " search with upper overrides 'ic'
set ruler       " show ruler with filename & cursor position
set hlsearch    " search is highlighted, nohlsearch do disable
set cursorline  " set a highlight on the line where the cursor is
set showcmd     " show partial command entered

" editing code feels better with not tabs.
set tabstop=2
set shiftwidth=2
set expandtab
set incsearch
