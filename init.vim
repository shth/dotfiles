" A minimal vimrc for new vim users to start with.
"
" Referenced here: http://www.benorenstein.com/blog/your-first-vimrc-should-be-nearly-empty/

" Original Author:     Bram Moolenaar <Bram@vim.org>
" Made more minimal by:  Ben Orenstein
" Last change:             2012 Jan 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"
"  If you don't understand a setting in here, just type ':h setting'.

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug (https://github.com/junegunn/vim-plug)
" Plugins will be downloaded under the specified directory.
" Automatically install vim-plug if not installed
" ref: https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation 
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-surround'
Plug 'notpratheek/vim-luna'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set ignorecase
set smartcase

if exists('g:vscode')
  noremap <C-h> :call VSCodeNotify("workbench.action.navigateLeft")<CR>
  noremap <C-l> :call VSCodeNotify("workbench.action.navigateRight")<CR>
  noremap <C-k> :call VSCodeNotify("workbench.action.navigateUp")<CR>
  noremap <C-j> :call VSCodeNotify("workbench.action.navigateDown")<CR>

  " avoid opening folds when step over it
  nmap j gj
  nmap k gk

  " remap vim's folding commands to VSCode actions
  nmap zC :call VSCodeNotify("editor.foldAll")<CR>
  nmap zc :call VSCodeNotify("editor.fold")<CR>
  nmap zo :call VSCodeNotify("editor.unfold")<CR>
  
else
endif
