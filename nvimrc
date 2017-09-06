set mouse=a                    " turn on mouse
set scrolloff=3                " when scrolling always show 3 bottom lines
set sidescrolloff=5            " And leave 5 spaces to the side
set showmatch
set ignorecase                 " Normally ignore case when searching
set smartcase                  " Do The Right Thing with case when searching
set lazyredraw                 " Don't redraw screen for intermediate macro steps
set hidden
set tabstop=4                  " 4 space tabs
set expandtab                  " expand tabs to spaces
set shiftwidth=4               " use 4 spaces when indented
set clipboard=unnamed          " Uses system clipboard by default
set tags=tags,../tags,../../tags,../../../tags,../../../../tags " Use this tags file
"set textwidth=80              " Maximum text width before wrap, gq to auto
"
call plug#begin('~/.config/nvim/plugged')
Plug 'nanotech/jellybeans.vim'
Plug 'bling/vim-airline'
Plug 'luochen1990/rainbow'
"Plug 'cyansprite/Extract' To look up on Note, overwrites s/S

" Basic langauge stuff
Plug 'zah/nimrod.vim'
"Plug 'baabelfish/nvim-nim' Need to get nimble installed first
Plug 'rust-lang/rust.vim'

" All nvim related completors
Plug 'roxma/nvim-completion-manager'
Plug 'racer-rust/vim-racer'
Plug 'roxma/nvim-cm-racer'
Plug 'neovimhaskell/haskell-vim'  " Do I need to configure this nvim for this more?
call plug#end()

set background = "dark"
set termguicolors
colorscheme jellybeans
