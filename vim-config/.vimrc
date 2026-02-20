set nocompatible              
filetype off                  

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
plugin 'VundleVim/Vundle.vim'
" Improvement plugin
Plugin 'nathanaelkane/vim-indent-guides'

"Color scheme
Plugin 'nanotech/jellybeans.vim' 



" All of your Plugins must be added before the following line

call vundle#end()           

filetype plugin indent on    

"Enable colors 
syntax on
colorscheme jellybeans