" vim config file

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'vim-scripts/indentpython.vim'
Plug 'preservim/nerdtree'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

filetype plugin indent on
set number relativenumber
syntax on
highlight Visual ctermbg=8
set tabstop=2
set shiftwidth=2
set expandtab
set clipboard=unnamedplus "clipboard sync with system's
set ignorecase
autocmd VimLeave * call system("xclip -selection clipboard -i", getreg('+')) "prevent vim from clearing clipboard on exit
"set textwidth=80
let g:airline_theme='cobalt2'
let g:airline_theme='papercolor'
let &t_EI.="\e[1 q" "EI = NORMAL mode
let &t_SI.="\e[5 q" "SI = INSERT mode
