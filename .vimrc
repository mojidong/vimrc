""""""""""""""""""""""""""""""  basic settings
language message zh_CN.UTF-8
set go=
set nocompatible
set nu 
set cul
set encoding=utf-8
set fileencodings=utf-8,gb18030,gbk,utf-16
set fileencoding=utf-8
set fileformats=unix,dos
set termencoding=utf-8
set hidden
set laststatus=2
set modelines=1
set statusline=%<%F\ %r\ %h\ [%{&ff}]\ [%{&fenc}]\ %=[%{strftime(\"%Y-%m-%d\ %H:%M\")}]\ %([%l,%c]%)\ %P\ 
set wildmenu
set foldcolumn=1
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set backup		" keep a backup file
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set hlsearch
set nowrapscan
set tabstop=4
set shiftwidth=4
set expandtab
set textwidth=80
set cc=+1
if has("gui_macvim")
    set guifont=Sauce\ Code\ Pro\ Nerd\ Font\ Complete\ Mono:h12
elseif has("gui_win32")
    set guifont=Sauce_Code_Powerline:h12
else
    set guifont=Input\ Mono\ 12
endif
syntax on
let mapleader = ","
let maplocalleader = ","

""""""""""""""""""""""""""""""  vundle settings
" filetype off
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
call plug#begin('~/.vim/plugged')
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-rails'
Plug 'Yggdroot/indentLine'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/DrawIt'
Plug 'kien/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'
Plug 'sjl/gundo.vim'
Plug 'Valloric/YouCompleteMe', {'do':'./install.py --clang-completer --gocode-completer'}
call plug#end()
" call vundle#end()
" filetype plugin indent on
""""""""""""""""""""""""""""""  plugin settings
" NERDTree
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2
map <F2> :NERDTreeToggle<cr>

" ZenCoding
let g:user_emmet_leader_key = ','

" syntastic 
"let g:syntastic_auto_loc_list=1

" tagbar
map <F3> :TagbarToggle<cr>
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

" solarized
set background=dark
colo solarized

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" vim-easy-align
vnoremap <silent> <Enter> :EasyAlign<cr>

" easymotion

let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

map <Leader>w <Plug>(easymotion-bd-w)
map <Leader>f <Plug>(easymotion-bd-f)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

" gundo
map <F5> :GundoToggle<cr>
let g:gundo_prefer_python3=1

"""""""""""""""""""""""""""""" map
imap <c-s> <ESC>:w<cr>
map <TAB> :bn<cr>
map <c-TAB> :bp<cr>
map <Leader>c "+y
map <Leader>v "+p
cmap w!! w !sudo tee %


" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

set backupskip=/tmp/*,/private/tmp/*

" autocmd

augroup CM
    au!
    autocmd BufNewFile,BufRead *.go :set ft=go
    if has("gui_win32")
        autocmd GUIEnter * simalt ~x
    endif
augroup END 
