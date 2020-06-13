call plug#begin('~/.vim/plugged')

    "Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'scrooloose/nerdcommenter'
    "Plug 'Valloric/YouCompleteMe'
    Plug 'jiangmiao/auto-pairs'
    "Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    "Plug 'easymotion/vim-easymotion'
    "Plug 'severin-lemaignan/vim-minimap'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    "Plug 'ryanoasis/vim-devicons'
    "Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    "Plug 'rizzatti/dash.vim'

    " Fuzzy file opener
    "Plug 'kien/ctrlp.vim'

    "colorschemes
    "Plug 'morhetz/gruvbox'
    Plug 'tomasiser/vim-code-dark'
    "Plug 'dracula/vim', { 'as': 'dracula' }
    
    "HTML plugins
    Plug 'mattn/emmet-vim', { 'for': 'html' }

    "JavaScript plugins
    Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
    Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
    
    "Syntastic Code linting errors
    Plug 'vim-syntastic/syntastic'

    
    "Experimental plugins
    "Plug 'vifm/vifm.vim'
    "Plug 'vimwiki/vimwiki'
    "Plug 'ap/vim-css-color'

filetype plugin indent on 
call plug#end()
