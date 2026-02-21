set nocompatible              
filetype off                  

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
Plugin 'VundleVim/Vundle.vim' 

"Improvement plugins
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'nanotech/jellybeans.vim'

" All of your Plugins must be added before the following line

call vundle#end()           

filetype plugin indent on    

"Enable colors 
syntax on
colorscheme jellybeans