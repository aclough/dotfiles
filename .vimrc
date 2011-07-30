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
"set winheight=34              " Accordian mode
"set winminheight=5
set laststatus=2               " Always use status lines
filetype plugin on             " autocomplete
filetype plugin indent on
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

"place in vimrc
onoremap <silent>ai :<C-u>cal IndTxtObj(0)<CR>
onoremap <silent>ii :<C-u>cal IndTxtObj(1)<CR>
vnoremap <silent>ai :<C-u>cal IndTxtObj(0)<CR><Esc>gv
vnoremap <silent>ii :<C-u>cal IndTxtObj(1)<CR><Esc>gv

" Selection by indentatino function
" use 'vai' to select an indentation or block including blank lines
" use 'vii' to do the same, but without blank lines
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
