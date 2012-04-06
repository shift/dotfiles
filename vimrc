call pathogen#infect()
syntax on
set background=dark
colorscheme solarized
set nocompatible
set autoindent
set expandtab
set smarttab
filetype plugin indent on

set shiftwidth=2
set softtabstop=2

set spl=en spell
" set nospell

set wildmenu
set wildmode=list:longest,full
set mouse=a
set backspace=2
set number

set smartcase

set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
	let p = '^\s*|\s.*\s|\s*$'
	if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
		let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
		let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
		Tabularize/|/l1
		normal! 0
		call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
	endif
endfunction

let mapleader=','
if exists(":Tabularize")
	nmap <Leader>a= :Tabularize /=<CR>
	vmap <Leader>a= :Tabularize /=<CR>
	nmap <Leader>a: :Tabularize /:\zs<CR>
	vmap <Leader>a: :Tabularize /:\zs<CR>
endif

