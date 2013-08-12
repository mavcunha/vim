" automatic runtime management (https://github.com/tpope/vim-pathogen)
runtime bundle/vim-pathogen/autoload/pathogen.vim 
call pathogen#infect()

syntax on 
filetype plugin indent on

set incsearch   " show search results as I type.
set ignorecase  " ignore case on searches...
set smartcase   " ...but if I start with uppercase, obey it.
set number      " always display line numbers
set modelines=3 " scan 3 lines for vim opts
set ruler       " show ruler with filename & cursor position
set hlsearch    " search is highlighted, nohlsearch do disable
set cursorline  " set a highlight on the line where the cursor is
set showcmd     " show partial command entered
set visualbell  " no beeps when I make a mistakes
set background=dark " need bright colors since terminal backgroun is black

" proper behavior of DEL, BS, CTLR-w; otherwise you can't BS after an ESC
set backspace=eol,start,indent

" window width size, don't squeeze too much
set winwidth=50
set winminwidth=50

" from gary bernhardt - store temp files in a central spot 
" first dir found is used.
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" ignoring some files in search (also Command-T respect this setting)
set wildignore+=*.class,*.jar " Java artifact
set wildignore+=target/** " Maven artifacts
set wildignore+=_site/** " Jekyll artifact
set wildignore+=tmp/**,log/** " rails working directories
set wildignore+=vendor/** " where gems usually get installed

set laststatus=2 " always show statusline even on sigle window
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

" no tabs, expand them to 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" leave some room when jumping
set scrolloff=6 

" OmniCompletion settings
set omnifunc=syntaxcomplete#Complete
set completeopt=menu,preview,longest

" fixing delay on vim startup by setting correct ruby_path
" http://stackoverflow.com/a/12141458/1426043
let g:ruby_path = system('rvm current') 

" clear search on return in normal mode...
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()
" ... but not for command and quickfix windows
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
autocmd CmdwinEnter * nnoremap <cr> <cr>
autocmd CmdwinLeave * call MapCR()

" this is a fix for a bad default in Java syntax file
" which highlights C++ keywords as errors
let java_allow_cpp_keywords=1

" Force write when open readonly files
command! SudoWrite :w !sudo tee %

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
      :w!
      exec ':saveas ' . new_name
      exec ':silent !rm ' . old_name
      redraw!
    endif
endfunction

" CSE means Clear Screen and Execute, use it by
" mapping (depending of the project) to a test runner command
" map <leader>r CSE('rspec', '--color')<cr>
function! CSE(runthis, ...)
  :wa
  exec ':!clear && tput cup 1000 0;' . a:runthis . ' ' . join(a:000, ' ')
endfunction

" arrows disabled on insert and normal mode
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

highlight Pmenu      ctermfg=Black ctermbg=LightGrey
highlight PmenuSel   ctermfg=Black ctermbg=Yellow
highlight PmenuSbar  ctermfg=Black ctermbg=LightGrey
highlight PmenuThumb ctermfg=DarkGrey
highlight Visual     ctermfg=Black ctermbg=White cterm=NONE
highlight Search     ctermfg=Black ctermbg=Yellow
highlight IncSearch  ctermfg=Blue ctermbg=White
highlight LineNr     ctermfg=Grey
