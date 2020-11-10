" Vundle Config

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'lifepillar/vim-mucomplete'

" YouCompleteMe Plugin
" Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
": see :h vundle for more details or wiki for FAQ

" Put your non-Plugin stuff after this line

"
" Recomended Conf by Prof. James Aspnes
"
set autoindent
set backup
set cindent
set hlsearch
set incsearch
set showmatch
set number
syntax on:
filetype plugin on
filetype indent on

" Not Recomended by Alexey Shmalko’s blog
" https://www.alexeyshmalko.com/2014/using-vim-as-c-cpp-ide/
set exrc 
set secure
set shell=/bin/bash 

" Default indentation without hard tabs for c 
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Write nice code for 80 char wide terminals
set colorcolumn=78
highlight ColorColumn ctermbg=red 


set ruler " Show cursor position
set spelllang=en_us
set showmode " Show when Insert or overtype
set ls=2 "Show filename in the bottom of the screen


" Set by abetancort
" Eemulate the escape (with two repeated ºº) for the iPad Pro
imap º <esc>
set smartcase
set ignorecase
set nocompatible " from Moderm Vim (ebook) Pg. 18
set autowrite "Autowrite on buffer changes
set foldmethod=syntax "Autofold code
" Open close folds with the space key
nnoremap <space> za
set foldcolumn=4 "Leave four char for the fold colum to show folds
set foldnestmax=10 
set foldminlines=2 "Don't fold if the syntax fold has 2 lines.

" Indentation for makefiles (real tabs)
au FileType make set noexpandtab | set tabstop=8 

" simplle autocomplete mucomplete plugin
set completeopt+=menuone
set completeopt+=noinsert
set shortmess+=c
set belloff+=ctrlg
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#completion_delay = 1 

"Redirect make to gcc and set auto compile after saving buffer
set makeprg=gcc\ -Wall\ -W\ -pedantic\ -ansi\ -std=c99\ -O\ %\ \$* 
au BufWritePost *.c make

" Change vim default location where ancilliary files are saved to
" avoid sporious files in working directory. // at the end of path
" means that file names will includes the  path of original file.
" Source: https://medium.com/@Aenon/vim-swap-backup-undo-git-2bf353caa02f
set backupdir =~/dev/tmp// " Option only available in Vim.
set directory =~/dev/tmp// " Location of swp files (Vim and Vi). 
set undodir =~/dev/tmp// " Option only available in Vim.

" From answer by Tom Hale in StackExchange  
" https://superuser.com/questions/286985/reload-vimrc-in-vim-without-restart

if has ('autocmd') " Remain compatible with earlier versions
 augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif " has autocmd
