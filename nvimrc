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
set list listchars=tab:▸\ ,trail:⋅,nbsp:⋅ " Show whitespace and tabs

let mapleader = " "

call plug#begin('~/.config/nvim/plugged')
Plug 'nanotech/jellybeans.vim' " Colorscheme
Plug 'luochen1990/rainbow'     " Rainbow parens
Plug 'Yggdroot/indentLine'     " Gives tab marker on leading whitespace
Plug 'bling/vim-airline'       " Status line that gives the mode
Plug 'tpope/vim-fugitive'      " Git integration
Plug 'kien/ctrlp.vim'          " Search functionality
Plug 'Lokaltog/vim-easymotion' " Quickly jump somewhere
Plug 'jeetsukumaran/vim-buffergator' " Buffer management
Plug 'dag/vim-fish'            " Fish bindings
Plug 'w0rp/ale'

Plug 'roxma/nvim-completion-manager'
Plug 'roxma/ncm-clang'
call plug#end()

" Appearance
set background = "dark"
set termguicolors
colorscheme jellybeans
"Use dark grey indent color for indentLine
let g:indentLine_color_term = 238

let g:ctrlp_map = '<c-p>'
let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files . -co --exclude-standard'],
        \ 2: ['.hg', 'ht --cwd %s locate -I .'],
        \ },
    \ 'fallback': 'find %s -type f'
    \ }

let g:ackprg = 'ag --nogroup --nocolor --column'

let g:ale_linters = {
    \'python':['pyflakes'],
    \'cpp':['clang-check'],
    \'rust': ['cargo'],
    \'haskell': ['stack-build', 'hlint'],
    \}

" mappings for replace in yank ring
nmap <silent> s <Plug>(extract-replace-normal)
vmap <silent> s <Plug>(extract-replace-visual)

" Easymotion
map H <Plug>(easymotion-b)
map L <Plug>(easymotion-w)

"For easier split window management
map <C-J> <C-w>w
map <C-K> <C-W>W

"For easier tab management
map <C-H> gT
map <C-L> gt

"Resist the tempation to guess in the face of ambiguous tags
map <C-]> g<C-]>

"Map Q to repeat the last recorded macro
map Q @@

"Make Y behave like other captials
map Y y$

map <Leader>t :TagbarToggle<CR>

"Reload vimrc when its saved
au BufWritePost nvimrc so ~/dotfiles/nvimrc

"Treat .ino like .cpp
au BufRead,BufNewFile *.pde,*.ino set filetype=cpp
au BufRead,BufNewFile *.lcm set filetype=java

"Select most recent paste (e.g. for indenting python)
nnoremap gp `[v`]

" Selection by indentation function
" use 'vai' to select an indentation or block including blank lines
" use 'vii' to do the same, but without blank lines
onoremap <silent>ai :<C-u>cal IndTxtObj(0)<CR>
onoremap <silent>ii :<C-u>cal IndTxtObj(1)<CR>
vnoremap <silent>ai :<C-u>cal IndTxtObj(0)<CR><Esc>gv
vnoremap <silent>ii :<C-u>cal IndTxtObj(1)<CR><Esc>gv
function! IndTxtObj(inner)
  let curline = line(".")
  let lastline = line("$")
  let i = indent(line(".")) - &shiftwidth * (v:count1 - 1)
  let i = i < 0 ? 0 : i
  if getline(".") !~ "^\\s*$"
    let p = line(".") - 1
    let nextblank = getline(p) =~ "^\\s*$"
    while p > 0 && ((i == 0 && !nextblank) || (i > 0 && ((indent(p) >= i && !(nextblank && a:inner)) || (nextblank && !a:inner))))
      -
      let p = line(".") - 1
      let nextblank = getline(p) =~ "^\\s*$"
    endwhile
    normal! 0V
    call cursor(curline, 0)
    let p = line(".") + 1
    let nextblank = getline(p) =~ "^\\s*$"
    while p <= lastline && ((i == 0 && !nextblank) || (i > 0 && ((indent(p) >= i && !(nextblank && a:inner)) || (nextblank && !a:inner))))
      +
      let p = line(".") + 1
      let nextblank = getline(p) =~ "^\\s*$"
    endwhile
    normal! $
  endif
endfunction
