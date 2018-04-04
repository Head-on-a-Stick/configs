set number
set smartcase
set autoindent
set tabstop=8 softtabstop=0 expandtab shiftwidth=3 smarttab
set incsearch
set hlsearch
set cursorline
set whichwrap=b,s,<,>,[,]
set backspace=2
set ruler
set laststatus=2
set noshowcmd
set ttyfast
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor="latex"
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
syntax on
hi CursorLine	cterm=NONE	ctermbg=236	ctermfg=NONE
hi LineNr	cterm=NONE	ctermbg=236	ctermfg=GREY
hi StatusLine	cterm=NONE	ctermbg=236	ctermfg=YELLOW
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END
