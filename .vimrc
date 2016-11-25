set nocompatible " must be first line (r) 
filetype on
filetype off                  " required
syntax on

" Candy Coloring "
set t_Co=256
set background=dark
colorscheme candy

" File "
set expandtab
set shiftwidth=2
set softtabstop=2

" Vundle Bundle "
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" arg for begin() will let you pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" Vundle gonna Vundle (r)
Plugin 'VundleVim/Vundle.vim'

Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'marijnh/tern_for_vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mxw/vim-jsx'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'MaxMEllon/vim-jsx-pretty'
Plugin 'Valloric/YouCompleteMe'

"Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

" GENERAL "
filetype plugin indent on   " Automatically detect file types.
set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
set nobackup
set nowritebackup
set noswapfile
scriptencoding utf-8

" this would make any ! scripts run in the directory of the buffer

set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
set hidden                          " Allow buffer switching without saving

highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" VIM UI "
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows

hi CursorLine   guibg=#333333
hi LineNr       guifg=#555555

set number                      " Show current line number
set relativenumber              " Show relative line numbers
    
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4               " Let backspace delete indent

"-------------------------------------------------------------------------------
"" Plugin Settings
"-------------------------------------------------------------------------------
" JS 
let g:javascript_plugin_flow = 1

" JSX
let g:syntastic_javascript_checkers = ['eslint']
let g:jsx_ext_required = 0

" delimitMat
let delimitMate_quotes = "\" \'"
let delimitMate_smart_quotes = 0

" Powerline
let g:Powerline_symbols='fancy'

" Syntax Highlighting
let g:used_javascript_libs = 'react'
let g:vim_jsx_pretty_colorful_config = 1

" CtrlP
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 'r'
nnoremap <silent> <D-t> :CtrlP<CR>
nnoremap <silent> <D-r> :CtrlPMRU<CR>

" Silver Searcher "
if executable('ag')
    " use ag over grep"
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
    let g:ctrlp_use_caching = 0
endif

" Mappings
map <leader>r :NERDTreeFind<cr>

" Auto Commands"
au VimEnter * NERDTree | wincmd p
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif " Always switch to the current file directory 
