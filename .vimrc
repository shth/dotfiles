
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
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-surround'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Default show line number
set nu
set relativenumber
set wildmenu
set splitright
set splitbelow

if &diff
	" Default show line number
	set nu

	" Default to not read-only in vimdiff
	set noro
	" add the current file to git
	:map <F2> :w<Bar>:!git add %<CR><Bar>
	" close the current file diff
	:map Q :qa<Esc>
else
endif

" Change cursor shape in different mode
" ref: https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
" this first one works, according to here: 
" https://github.com/microsoft/terminal/issues/68#issuecomment-418438517
let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q"
