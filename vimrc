" automatic runtime management (https://github.com/tpope/vim-pathogen)
runtime bundle/vim-pathogen/autoload/pathogen.vim 
call pathogen#infect()

syntax on 
filetype plugin indent on

set textwidth=80
set ignorecase
set incsearch
set smartcase
set number      " always display line numbers
set modelines=3 " scan 3 lines for vim opts
set ruler       " show ruler with filename & cursor position
set hlsearch    " search is highlighted, nohlsearch do disable
set cursorline  " set a highlight on the line where the cursor is
set showcmd     " show partial command entered
set cryptmethod=blowfish " when using :X use blowfish to encrypt the file.

" proper behavior of DEL, BS, CTLR-w; otherwise you can't BS after an ESC
set backspace=eol,start,indent

" from gary bernhardt - store temp files in a central spot 
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" ignoring some files in search (also Command-T respect this setting)
set wildignore+=*.class,*.jar " Java artifact
set wildignore+=_site/** " Jekyll artifact
set wildignore+=tmp/**,log/** " rails working directories
set wildignore+=vendor/** " where gems usually get installed

set laststatus=2 " always show statusline even on sigle window
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

" editing feels better with no tabs
set tabstop=2
set shiftwidth=2
set expandtab

set scrolloff=6 " leave some room when jumping

" OmniCompletion settings
set ofu=syntaxcomplete#Complete
set completeopt=menu,preview,longest

" clear search on return in normal mode
nnoremap <cr> :nohlsearch<cr> 

" omnicompletion through Control + Space like most IDEs
imap <C-space> <C-X><C-O> 

" this is a fix for a bad default in Java syntax file
let java_allow_cpp_keywords=1 

" enable OmniCompletion for java files.
autocmd Filetype java setlocal omnifunc=javacomplete#Complete completefunc=javacomplete#CompleteParamsInfo

" originally .md is for modula2, I use for markdown format
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Default to Perl6 instead of Perl5 filetype
autocmd BufNewfile,BufRead *.t,*.pm,*.pl set filetype=perl6

" keep cursor position, ref: https://github.com/garybernhardt/dotfiles/blob/master/.vimrc line 87
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" from gary bernhardt, tab or completion 
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

function! InsertTabWrapper()
    let col = col('.') - 1
    if col && getline('.')[col - 1] == '='
      return "> "
    elseif !col || getline('.')[col - 1] !~ '\k'
      return "\<tab>"
    else
      return "\<c-p>"
    endif
endfunction

" from gary bernhardt, rename file
map <leader>n :call RenameFile()<cr>
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

function! CSE(runthis)
  :wa
  exec ':!clear && tput cup 1000 0;' . a:runthis
endfunction

" disabling arrows, force Vim movement learning
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

highlight Pmenu      ctermfg=Black ctermbg=Grey 
highlight PmenuSel   ctermfg=Black ctermbg=Yellow 
highlight PmenuSbar  ctermfg=Black ctermbg=Grey
highlight PmenuThumb ctermfg=DarkGrey 
highlight Search     ctermbg=Yellow
highlight LineNr     ctermfg=Grey
