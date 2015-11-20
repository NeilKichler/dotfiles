
call plug#begin("$XDG_DATA_HOME/plugged")

" Make sure you use single quotes
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'benekastah/neomake'
Plug 'justmao945/vim-clang'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/deoplete.nvim'

call plug#end()


"Remove trailing whitespace haxx
autocmd! BufWritePre * :%s/\s\+$//e
autocmd! BufWritePost * Neomake

colorscheme gruvbox
set background=light
let g:gruvbox_italicize_comments = 0
let g:gruvbox_contrast_light = "hard"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:indentLine_char = '┆'
let g:deoplete#enable_at_startup = 1

filetype indent plugin on
set softtabstop=4
set shiftwidth=4
set expandtab
set title
set hidden
set number
set smartcase
set ignorecase
syntax on

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-k>k
noremap <C-l> <C-w>l

let g:neomake_cpp_clang_args = neomake#makers#ft#c#clang()['args']+['-std=c99']
let g:clang_auto = 0
let g:clang_c_completeopt = 'menuone,preview'
let g:clang_cpp_completeopt = 'menuone,preview'
let g:deoplete#disable_auto_complete = 1

let g:deoplete#deoplete_omni_patterns = get(g:, 'deoplete#force_omni_input_patterns', {})
let g:deoplete#deoplete_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:deoplete#deoplete_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:deoplete#disable_auto_complete = 1
inoremap <silent><expr><Tab>
        \ pumvisible() ? "\<C-n>" :
        \ deoplete#mappings#manual_complete(['buffer','omni'])
