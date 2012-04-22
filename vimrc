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
setlocal spell spelllang=en_gb
" set nospell

set wildmenu
set wildmode=list:longest,full
set mouse=a
set backspace=2
set number

set smartcase
set ignorecase

set scrolloff=3

set title

set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

runtime macros/matchit.vim

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

set encoding=utf-8
set laststatus=2

let g:Powerline_symbols = 'fancy'

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

" Run the current file with rspec
map <Leader>rb :call RunVimTmuxCommand("clear; rspec " . bufname("%"))<CR>

" Prompt for a command to run
map <Leader>rp :PromptVimTmuxCommand<CR>

" Run last command executed by RunVimTmuxCommand
map <Leader>rl :RunLastVimTmuxCommand<CR>

" Inspect runner pane
map <Leader>ri :InspectVimTmuxRunner<CR>

" Close all other tmux panes in current window
map <Leader>rx :CloseVimTmuxPanes<CR>

" Interrupt any command running in the runner pane
map <Leader>rs :InterruptVimTmuxRunner<CR>

" Prompt for a command to run
map <LocalLeader>vp :PromptVimTmuxCommand<CR>

" If text is selected, save it in the v buffer and send that buffer it to tmux
vmap <LocalLeader>vs "vy :call RunVimTmuxCommand(@v)<CR>

" Select current paragraph and send it to tmux
nmap <LocalLeader>vs vip<LocalLeader>vs<CR>
