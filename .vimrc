set mouse=a                    " turn on mouse
set scrolloff=3                " when scrolling always show 3 bottom lines
set showcmd                    " show command
set showmatch
set incsearch                  " incrimental search
set ignorecase                 " Normally ignore case when searching
set smartcase                  " Do The Right Thing with case when searching
set hlsearch                   " Highlight searched terms
set hidden
set wildmenu                   " Show possilbe tab completions
set background=dark            " dark background
set backspace=indent,eol,start " make backspace more flexible
syntax on                      " Syntax highlighting on
set nocompatible               " Don't emulate vi bugs
set tabstop=4                  " 4 space tabs
set expandtab				   " expand tabs to spaces
set shiftwidth=4               " use 4 spaces when indented
set ruler                      " statusline showing current cursor position
set foldcolumn=1               " have a fold status-column
set foldmethod=indent          " automatically have everything folded by colum
set nofoldenable               " But don't start with things folded
"set backup                     " Create ~ backup files when saving
"set winheight=34              " Accordian mode
"set winminheight=5
set laststatus=2               " Always use status lines
"set tags=~/project/tags        " Use this tags file
"set csto=0                     " Integrate cscope with ctags
"set cscopetag
"set textwidth=80               " Maximum text width before wrap, gq to auto
"set list                       " show whitespace characters
"set listchars=tab:>-,trail:-   " modifies previous line
iabbrev #b /*****************************
iabbrev #e *****************************/
iabbrev teh the
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-,> gT
map <C-.> gt
"map <C-c> "*y<CR>
filetype plugin on             " autocomplete
filetype plugin indent on
map <up>    :wincmd k<CR>
map <down>  :wincmd j<CR>
map <right> :wincmd l<CR>
map <left>  :wincmd h<CR>

" alt-right and alt-left to cycle buffers in a split
map <A-right> :bnext<CR>
map <A-left>  :bprevious<CR>
" compensate for terminal
map <right> :bnext<CR>
map <left>  :bprevious<CR>

" alt-up and alt-down to cycle tabs in a split
map <A-down> :tabnext<CR>
map <A-up>   :tabprevious<CR>
map <down> :tabnext<CR>
map <up>   :tabprevious<CR>
