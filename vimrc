set nocompatible               " be iMproved
filetype off                   " required!


set shell=bash
set splitright
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
"Plugin 'delimitMate.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'christoomey/vim-tmux-navigator'



if has('lua')
    Plugin 'Shougo/neocomplete'
    Plugin 'Shougo/neosnippet'
    Plugin 'Shougo/neosnippet-snippets'
end

"undle 'Lokaltog/vim-easymotion'
" vim-scripts repos
"Bundle 'L9'
"undle 'FuzzyFinder'
" non github repos
"undle 'git://git.wincent.com/command-t.git'
"undle 'altercation/vim-colors-solarized'

call vundle#end()            " required
filetype plugin indent on    " required


"let g:airline_theme='hybrid'

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors
autocmd FileType qf wincmd J "fix the quickfix window
set nu
syntax enable
set background=dark
"set t_ut=
"colorscheme jellybeans
"let g:solarized_termcolors=256
colorscheme solarized

  

"au VimEnter * NERDTreeToggle 
nmap <F3> :NERDTreeToggle<CR>
au BufRead,BufNewFile *.md set filetype=markdown
set colorcolumn=80
set cmdheight=2


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


au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>i <Plug>(go-info)


set incsearch ignorecase hlsearch
" Press space to clear search highlighting and any message already displayed.
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>


"if v:version > 700
"  set cursorline
"   hi CursorLine cterm=NONE,underline ctermbg=none ctermfg=NONE 
"   hi CursorColumn cterm=NONE  ctermbg=black ctermfg=NONE 
"ndif


let mapleader=','
inoremap <leader>, <C-x><C-o>

let g:mapleader=','
nmap <Leader>s :source $MYVIMRC "source $MYVIMRC reloads the saved $MYVIMR
nmap <leader>w :w!<cr> 
nmap <leader>t :tabnew <cr> "new tab

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

if has('lua')
    set completeopt=menu
    let g:neocomplete#enable_at_startup = 1

    nmap <F4> :TagbarToggle<CR>
    let g:tagbar_type_go = {
        \ 'ctagstype' : 'go',
        \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
        \ },
        \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
        \ },
        \ 'ctagsbin'  : 'gotags',
        \ 'ctagsargs' : '-sort -silent'
    \ }

    " Plugin key-mappings.
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)

    " SuperTab like snippets behavior.
    imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \: pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \: "\<TAB>"

    " For snippet_complete marker.
    if has('conceal')
      set conceallevel=2 concealcursor=i
    endif
end
