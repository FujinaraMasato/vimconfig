if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup redhat
  autocmd!
  " In text files, always limit the width of text to 78 characters
  " autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/run/media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add $PWD/cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype plugin on

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"
set nu
set ignorecase
filetype plugin indent on
map <C-n> :NERDTree<CR>

let Tlist_Show_One_File=1    
let Tlist_Exit_OnlyWindow=1  
let Tlist_Use_Right_Window=1 
let Tlist_Sort_Type="name"  


filetype plugin indent on
set completeopt=longest,menu
let OmniCpp_NamespaceSearch = 2
let OmniCpp_ShowPrototypeInAbbr = 1 
let OmniCpp_MayCompleteScope = 1   
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

set tags+=~/.vim/tags/cpp_src/tags

set smartindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set ts=4
set expandtab
set autoindent
set noexpandtab

syntax on
set encoding=utf-8                                                                                                                                         
set termencoding=utf-8
set fileencodings=ucs-bom,utf-8-bom,utf-8,cp936,gb18030,ucs,big5,gbk
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%] 
set laststatus=2 " always show the status line "

autocmd BufNewFile *.c,*.cpp,*.h,*.hpp,*.cc,*.sh exec ":call SetComment()"
func SetComment()
	if(expand("%:e") == 'sh')
			call setline(1, "\#!/bin/bash")
			call setline(2, "\#Author		:Masato")
			call setline(3, "\#Created Time :".strftime("%c"))
			call setline(4, "\#FileName		:".expand("%"))
			call setline(5, "\#Description	:")
	else
		call setline(1, "\/*******************************************************")
		call setline(2, "*")
		call setline(3, "Copyright (C) Masato")
		call setline(4, "*")
		call setline(5, "********************************************************")
		call setline(6, "*@FileName		: ".expand("%"))
		call setline(7, "*@Created Time	: ".strftime("%c"))
		call setline(8, "*@Author		: Masato")
		call setline(9, "*@Brief        : ")
		call setline(10, "*******************************************************\/")
	endif

	if(expand("%:e") == 'h')
		call setline(11, "\#ifndef _".toupper(substitute(expand("%:r"),"/","_","g"))."_H_")
		call setline(12, "\#define _".toupper(substitute(expand("%:r"),"/","_","g"))."_H_")
		call setline(13, "\#endif")
	endif
	
endfunc
autocmd BufNewFile * normal G 

"auto [ { ( match"
inoremap ( ()<LEFT>
inoremap { {}<LEFT>
inoremap [ []<LEFT>

