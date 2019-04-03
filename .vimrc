filetype plugin indent on
set number relativenumber
syntax on
highlight Visual ctermbg=8
set tabstop=4
set shiftwidth=4
set expandtab
set clipboard=unnamedplus "clipboard sync with system's
autocmd VimLeave * call system("xclip -selection clipboard -i", getreg('+')) "prevent vim from clearing clipboard on exit
set textwidth=80
