syntax on
set ttyfast
set lazyredraw
set nocompatible
set modelines=0
set encoding=utf8
set ttyfast
set laststatus=2
set showtabline=2
set guioptions-=e
set number
set relativenumber
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set clipboard=unnamed
"set background=dark
set hlsearch
set incsearch
"set nohlsearch
set ignorecase
set backspace=2
" set belloff=all
set visualbell t_vb=
set cursorline
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

"filetype on
"filetype plugin on
filetype plugin indent on

"colorschemes

" Change cursor shape in different modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

let g:mapleader=','

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'


if has("autocmd") && has("gui")
    au GUIEnter * set t_vb=
endif


"mapping Section

map <Leader> <Plug>(easymotion-prefix)
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

autocmd StdinReadPre * let s:std_in=1
