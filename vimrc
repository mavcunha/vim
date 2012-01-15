" automatic runtime management (https://github.com/tpope/vim-pathogen)
runtime bundle/vim-pathogen/autoload/pathogen.vim 
call pathogen#infect()


syntax on       " detect syn colors
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
