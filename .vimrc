set nocompatible
set exrc
set background=dark
"set mouse=a
"set visualbell
"set list
"set listchars=tab:>.
set title
set ruler
set laststatus=2
highlight CursorLine term=none cterm=none ctermbg=0
"set cursorline
set ic hls is	" ignorecase, hlsearch incsearch
nnoremap <C-H> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
" Toggle hlsearch
:map <silent> <C-N> :se invhlsearch<CR>

"set tabstop=8
"set softtabstop=2
"set expandtab
set ai		" autoindent (don't use cindent for reglar file!)
syntax on

" Enconding.
set encoding=utf8
set fileencoding=utf8
set fileencodings=utf-8,cp949
"set fileencodings=utf-8,cp949,unicode

" Folding.
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" ctags.
"set tags=tags,../tags,../../tags,../../../tags,../../../../tags,../../../../../tags
set tags=./tags;/		" Search tags to the root directory
"set tags+=/home/sklee/foo/tags

"if filereadable("cscope.out")
"    cs add cscope.out
"elseif filereadable("../cscope.out")
"    cs add ../cscope.out
"elseif filereadable("../../cscope.out")
"    cs add ../../cscope.out
"elseif filereadable("../../../cscope.out")
"    cs add ../../cscope.out
"endif

filetype indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" From http://cvs.sourceforge.net/viewcvs.py/python/python/dist/src/Misc/vimrc?rev=1.6&view=auto

" Number of spaces to use for an indent.
" This will affect Ctrl-T and 'autoindent'.
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4 softtabstop=4
au BufRead,BufNewFile *.c,*.cpp,*.h set shiftwidth=8

" Number of spaces that a pre-existing tab is equal to.
" For the amount of space used for a new tab use shiftwidth.
au BufRead,BufNewFile *py,*pyw,*.c,*.cpp,*.h set tabstop=8

" Replace tabs with the equivalent number of spaces.
" Also have an autocmd for Makefiles since they require hard tabs.
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.c,*.cpp,*.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab

" Use the below highlight group when displaying bad whitespace is desired
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
