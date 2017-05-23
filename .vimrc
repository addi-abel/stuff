version 6.0
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
map #1 :!more ~/.vi_help
map #2 :set number
map #3 :set nonumber
map! <xHome> <Home>
map! <xEnd> <End>
map! <S-xF4> <S-F4>
map! <S-xF3> <S-F3>
map! <S-xF2> <S-F2>
map! <S-xF1> <S-F1>
map! <xF4> <F4>
map! <xF3> <F3>
map! <xF2> <F2>
map! <xF1> <F1>
map <xHome> <Home>
map <xEnd> <End>
map <S-xF4> <S-F4>
map <S-xF3> <S-F3>
map <S-xF2> <S-F2>
map <S-xF1> <S-F1>
map <xF4> <F4>
map <xF3> <F3>
map <xF2> <F2>
map <xF1> <F1>
let &cpo=s:cpo_save
unlet s:cpo_save
set autowrite
set background=dark
set backspace=2
set cscopeprg=/usr/bin/cscope
set cscopetag
set cscopeverbose
set fileencodings=utf-8,latin1
set formatoptions=tcql
set helplang=en
set history=50
set hlsearch
set ignorecase
set report=1
set ruler
set showmatch
set viminfo='20,\"50
set noautoindent
set showmode
set wrapmargin=0
set tabstop=4
set shiftwidth=4
set expandtab
autocmd BufReadPost * :silent !update_konsole_tab set 'vim: %:t'
autocmd BufWritePre *.{c,cpp,cc,h,hpp,pp,py,m,mm,md} :%s/\s\+$//e
autocmd VimLeavePre * :silent !update_konsole_tab clean
:filetype plugin on
:syntax on
