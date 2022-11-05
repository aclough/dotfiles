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
set nomodeline                 " Security hole
set tags=tags,../tags,../../tags,../../../tags,../../../../tags " Use this tags file
"set textwidth=80              " Maximum text width before wrap, gq to auto
set list listchars=tab:▸\ ,trail:⋅,nbsp:⋅ " Show whitespace and tabs
"set spell spelllang=en_us

autocmd BufWritePre * :%s/\s\+$//e

let mapleader = " "

call plug#begin('~/.config/nvim/plugged')
Plug 'nanotech/jellybeans.vim' " Color scheme
Plug 'Yggdroot/indentLine'     " Gives tab marker on leading whitespace
Plug 'tpope/vim-fugitive'      " Git integration
Plug 'mhinz/vim-startify'
Plug 'ggandor/lightspeed.nvim' " Even faster to jump somewhere
Plug 'bfredl/nvim-miniyank'    " Yank ring
Plug 'kamykn/spelunker.vim'    " Spell check

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'

Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'   " Lightweight statusline
Plug 'maximbaz/lightline-ale'  " Adds Ale stuff to lightline

" Language specific
Plug 'sheerun/vim-polyglot'
call plug#end()

" Appearance
set background = "dark"
set termguicolors
colorscheme jellybeans
"Use dark gray indent color for indentLine
let g:indentLine_color_term = 238

" fzf
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>
nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>
nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>' :Marks<CR>
nmap <Leader>/ :Rg<Space>

let g:lightline = {}
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }
let g:lightline.component_function = { 'gitbranch': 'FugitiveHead' }
let g:lightline.active = {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch' ],
      \             ['readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
      \              [ 'filetype' ]]
      \}
let g:lightline.colorscheme = 'jellybeans'

let g:ackprg = 'ag --nogroup --nocolor --column'

let g:ale_linters = {
    \'python':['pyflakes'],
    \'cpp':['clang-check'],
    \'sh':['shellcheck'],
    \}

" Only check displayed words
let g:spelunker_check_type = 2


" Yank ring
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
map <leader>p <Plug>(miniyank-cycle)

tnoremap <Esc> <C-\><C-n>

"For easier split window management
map <C-J> <C-w>w
map <C-K> <C-W>W

"For easier tab management
map <C-H> gT
map <C-L> gt

"Resist the temptation to guess in the face of ambiguous tags
map <C-]> g<C-]>

"Map Q to repeat the last recorded macro
map Q @@

"Make Y behave like other capitals
map Y y$

"Reload vimrc when its saved
au BufWritePost nvimrc so ~/dotfiles/nvimrc

"Treat .ino like .cpp
au BufRead,BufNewFile *.pde,*.ino set filetype=cpp
au BufRead,BufNewFile *.lcm set filetype=java

"Use smaller stops for c++
"autocmd Filetype cpp setlocal tabstop=2 shiftwidth=2 softtabstop=2

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
