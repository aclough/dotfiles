" Configuration notes, plugins to install
"   Pathogen, for managing other plugins
"   ctrlp, for textmate-like find
"   nerdtree, for file navigation
"   buffergator, for buffer navigation
"   easymotion, for, well, easy motion
"   fugative, for git integration
set mouse=a                    " turn on mouse
set scrolloff=3                " when scrolling always show 3 bottom lines
set showcmd                    " show command
set showmatch
set incsearch                  " incrimental search
set ignorecase                 " Normally ignore case when searching
set smartcase                  " Do The Right Thing with case when searching
set hlsearch                   " Highlight searched terms
set hidden
set wildmenu                   " Show possible tab completions
set background=dark            " dark background
set backspace=indent,eol,start " make backspace more flexible
syntax on                      " Syntax highlighting on
set nocompatible               " Don't emulate vi bugs
set tabstop=4                  " 4 space tabs
set expandtab                  " expand tabs to spaces
set shiftwidth=4               " use 4 spaces when indented
set ruler                      " statusline showing current cursor position
set foldcolumn=1               " have a fold status-column
set foldmethod=indent          " automatically have everything folded by colum
set nofoldenable               " But don't start with things folded
set laststatus=2               " Always use status lines
set encoding=utf-8             " Needed for powerline, but also a good idea
set clipboard=unnamed          " Uses system clipboard by default
filetype plugin on             " autocomplete
filetype plugin indent on
"set tags=~/project/tags        " Use this tags file
"set csto=0                     " Integrate cscope with ctags
"set cscopetag
"set textwidth=80               " Maximum text width before wrap, gq to auto
set list listchars=tab:▸\ ,trail:⋅,nbsp:⋅ " Show whitespace and tabs
"
call pathogen#infect() "use pathogen to get other plugins

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
colorscheme jellybeans

iabbrev #b /*****************************
iabbrev #e *****************************/
iabbrev teh the
"For easier split window management
map <C-J> <C-w>w
map <C-K> <C-W>W

"For easier tab management
map <C-H> gT
map <C-L> gt

"Map Q to repeat the last recorded macro
map Q @@

"Make Y behave like other captials
map Y y$

"Force Saving Files that Require Root Permission
cmap w!! %!sudo tee > /dev/null %

"Reload vimrc when its saved
au BufWritePost .vimrc so ~/.vimrc

"For selecting by indentation
onoremap <silent>ai :<C-u>cal IndTxtObj(0)<CR>
onoremap <silent>ii :<C-u>cal IndTxtObj(1)<CR>
vnoremap <silent>ai :<C-u>cal IndTxtObj(0)<CR><Esc>gv
vnoremap <silent>ii :<C-u>cal IndTxtObj(1)<CR><Esc>gv

" Selection by indentation function
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
