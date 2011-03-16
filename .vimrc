" .vimrc ---------------------------------------------------------------------
" Dwayne Hunter <dwaynehunter1@gmail.com>
" Last modified: March 16, 2011
" ----------------------------------------------------------------------------

" This effects behavior of other options. Set this first. Compatability is
" on  by default and off if a vimrc or gvimrc is found. Do I even need this
" option?
set nocp " No vi compatable

" Look -----------------------------------------------------------------------
syn on " Turn on syntax hl
set bg=dark " Set background dark.
set cc=+1 " Color column after 'textwidth'
set nu "Display line numbers
set ls=2 " Always show status line
set stl=%f%m%r%h\ [%{&ff}]\ %y%=[%p%%]\ [line:%l,col:%v]
colors moiraine256

" Feel -----------------------------------------------------------------------
set bs=indent,eol,start " Backspace over everthing
set ea " When splitting windows make all equale size
set nobk " Don't create backup files
set sc " Display incomplete command
set ru " Curser position

" Search ---------------------------------------------------------------------
set ic " Ignore case
set scs " Smartcase
set is " Incremental search
set hls " Highlight search 

" No tabs --------------------------------------------------------------------
set et " Expandtab
set ts=2 "Tabstop
set sw=2 " Shiftwidth

" Paste ----------------------------------------------------------------------
map <F10> :set paste<CR>
map <F11> :set nopaste<CR>
imap <F10> <C-O>:set paste<CR>
imap <F11> <nop>
set pt=<F11>
map Q ; " Use Q for formatting

if has("autocmd")
  filetype plugin indent on
  augroup vimrcEx
  au!
  autocmd FileType text setlocal textwidth=78
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).  Also don't do it when the mark is
  " in the first line, that is the default position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  augroup END
else
  set autoindent		" always set autoindenting on
endif " has("autocmd")

inoremap <C-U> <C-G>u<C-U>

" Fill line ------------------------------------------------------------------
function! FillLine( str )
  " set tw to the desired total length
  let tw = &textwidth
  if tw==0 | let tw = 80 | endif
  " strip trailing spaces first
  .s/[[:space:]]*$//
  " calculate total number of 'str's to insert
  let reps = (tw - col("$")) / len(a:str)
  " insert them, if there's room, removing trailing spaces (though forcing
  " there to be one)
  if reps > 0
    .s/$/\=(' '.repeat(a:str, reps))/
  endif
endfunction

map <F12> :call FillLine( '-' )

" Last modified --------------------------------------------------------------
" If buffer modified, update any 'Last modified: ' in the first 5 lines.
" 'Last modified: ' can have up to 10 characters before (they are retained).
" Restores cursor and window position using save_cursor variable.
function! LastModified()
  if &modified
    let save_cursor = getpos(".")
    let n = min([5, line("$")])
    keepjumps exe '1,' . n . 's#^\(.\{,10}Last modified: \).*#\1' .
          \ strftime('%B %d, %Y') . '#e'
    call histdel('search', -1)
    call setpos('.', save_cursor)
  endif
endfun
autocmd BufWritePre * call LastModified()
" The end --------------------------------------------------------------------
