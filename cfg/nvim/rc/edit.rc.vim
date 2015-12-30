"----------------------------------------------------------------
" Edit
"

set title

" Tabs to spaces, etc
set smarttab
set tabstop=3
set softtabstop=3
set shiftwidth=3
set expandtab

" Numbers on
set number
set modeline
set backspace=indent,eol,start

" Highlight parethesis
set showmatch

set matchpairs+=<:>

" Auto reload if file is changed
set autoread

" Make directory automatically.
" --------------------------------------
" http://vim-users.jp/2011/02/hack202/

autocmd MyAutoCmd BufWritePre *
      \ call s:mkdir_as_necessary(expand('<afile>:p:h'), v:cmdbang)
function! s:mkdir_as_necessary(dir, force)
  if !isdirectory(a:dir) && &l:buftype == '' &&
        \ (a:force || input(printf('"%s" does not exist. Create? [y/N]',
        \              a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction

" Reload rc files
autocmd MyAutoCmd BufWritePost init.vim,*.rc.vim,neobundle*.toml
      \ NeoBundleClearCache | source $MYVIMRC | redraw

autocmd! BufWritePost * Neomake
