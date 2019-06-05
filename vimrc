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
