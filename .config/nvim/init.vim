call plug#begin("$XDG_DATA_HOME/plugged")

" Make sure you use single quotes
Plug 'morhetz/gruvbox'
Plug 'bling/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'benekastah/neomake'
autocmd! BufWritePost * Neomake

" Add plugins to &runtimepath
call plug#end() 
let base16colorspace=256
colorscheme gruvbox
set background=light
let g:airline_powerline_fonts = 1
let g:indentLine_char = '┆'
:set tabstop=4 shiftwidth=4 expandtab

set number
syntax on
