" automatic runtime management (https://github.com/tpope/vim-pathogen)
runtime bundle/vim-pathogen/autoload/pathogen.vim 
call pathogen#infect()

syntax on 

filetype plugin indent on 
set ofu=syntaxcomplete#Complete
set completeopt=menu,preview,longest

" omnicompletion for java files.
autocmd Filetype java setlocal omnifunc=javacomplete#Complete completefunc=javacomplete#CompleteParamsInfo

" keep cursor position, ref: https://github.com/garybernhardt/dotfiles/blob/master/.vimrc line 87
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" omnicompletion through Control + Space like most IDEs
imap <C-space> <C-X><C-O>


" from gary bernhardt, tab or completion 
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" from gary bernhardt, rename file
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

" disable the arrows for fast Vim learning through pain.
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" from gary bernhardt - store temp files in a central spot 
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" clear search on return in normal mode
nnoremap <cr> :nohlsearch<cr> 

highlight Pmenu      ctermfg=Black ctermbg=Grey 
highlight PmenuSel   ctermfg=Black ctermbg=Yellow 
highlight PmenuSbar  ctermfg=Black ctermbg=Grey
highlight PmenuThumb ctermfg=DarkGrey 
highlight Search     ctermbg=Yellow
highlight LineNr     ctermfg=Grey

set number      " always display line numbers
set modelines=3 " scan 3 lines for vim opts
set nobackup    " no ~filename around
set ignorecase  " search ignore case
set smartcase   " search with upper overrides 'ic'
set ruler       " show ruler with filename & cursor position
set hlsearch    " search is highlighted, nohlsearch do disable
set cursorline  " set a highlight on the line where the cursor is
set showcmd     " show partial command entered
set wildignore+=*.class,*.jar " common ignores 

" editing code feels better with not tabs.
set tabstop=2
set shiftwidth=2
set expandtab
set incsearch
