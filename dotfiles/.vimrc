set nocompatible               " be iMproved
filetype off                   " required!

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-powerline'
Bundle 'nanotech/jellybeans.vim'
"undle 'tpope/vim-fugitive'
"undle 'Lokaltog/vim-easymotion'
"undle 'rstacruz/sparkup', {'rtp': 'vim/'}
"undle 'tpope/vim-rails.git'
" vim-scripts repos
"Bundle 'L9'
"undle 'FuzzyFinder'
" non github repos
"undle 'git://git.wincent.com/command-t.git'
"undle 'altercation/vim-colors-solarized'




syntax enable
set background=dark
"colorscheme solarized
colorscheme jellybeans

filetype plugin indent on     " required!

function! Tabstyle_tabs()
	" Using 4 column tabs
	set softtabstop=4
	set shiftwidth=4
	set tabstop=4
	set noexpandtab
endfunction

function! Tabstyle_spaces()
	set softtabstop=4
	set shiftwidth=4
	set tabstop=4
	set expandtab
endfunction
call Tabstyle_spaces()

function! TabC()
	set softtabstop=4
	set shiftwidth=4
	set tabstop=4
	set expandtab
endfunction


function! TabJava()
	set softtabstop=2
	set shiftwidth=2
	set tabstop=2
	set expandtab
endfunction
autocmd BufRead *.java call TabJava() 




"set t_Co=16
"let g:solarized_termcolors=256
"set background=light
"set background=dark
"colorscheme solarized
"call togglebg#map("<F5>")
"hi Normal ctermbg=white
syntax enable



set incsearch ignorecase hlsearch
" Press space to clear search highlighting and any message already displayed.
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>


if v:version > 700
    set cursorline
     hi CursorLine cterm=NONE,underline ctermbg=none ctermfg=NONE 
     hi CursorColumn cterm=NONE  ctermbg=black ctermfg=NONE 
endif

let mapleader=','
inoremap <leader>, <C-x><C-o>

let g:mapleader=','
" source $MYVIMRC reloads the saved $MYVIMR
:nmap <Leader>s :source $MYVIMRC
" " opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
:nmap <Leader>v :e $MYVIMRC
"fast saving
nmap <leader>w :w!<cr>
"new tab
nmap <leader>t :tabnew <cr>


if has("spell")
    " toggle spelling with F4 key
    map <F4> :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 *  &spell, 3)<CR>

    " they were using white on white
   highlight PmenuSel ctermfg=black ctermbg=lightgray

    " limit it to just the top 10 items
    set sps=best,10                    

    highlight clear SpellBad
    highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
    highlight clear SpellCap
    highlight SpellCap term=underline cterm=underline
    highlight clear SpellRare
    highlight SpellRare term=underline cterm=underline
    highlight clear SpellLocal
    highlight SpellLocal term=underline cterm=underline
endif
