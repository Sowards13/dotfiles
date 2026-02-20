set nocompatible              " Required for Vundle
filetype off                  " Required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

plugin 'VundleVim/Vundle.vim'

Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'nanotech/jellybeans.vim'

" All of your Plugins must be added before the following line

call vundle#end()            " Required

filetype plugin indent on    " Required

colorscheme jellybeans