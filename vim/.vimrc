set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set nu
set rnu
set autoindent
set backspace=2
set wrap
set guioptions-=l                                                       "Disable Gui scrollbars.
set guioptions-=L
set guioptions-=r
set guioptions-=R
set hlsearch								"Highlight all matched terms.
let mapleader = ","
" set spell 
set smartindent
syntax on

" System mapping--------------------
nmap H ^
nmap L $

" autocmd VimEnter * RltvNmbr
" inoremap ' ''<ESC>i
" inoremap " ""<ESC>i
" inoremap ( ()<ESC>i
" inoremap [ []<ESC>i
" inoremap { {<CR>}<ESC>O
call plug#begin('~/.vim/plugged')

" Plug 'kien/rainbow_parentheses.vim'
Plug 'luochen1990/rainbow'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdcommenter'
" Plug 'https://github.com/vim-scripts/RltvNmbr.vim.git'
Plug 'valloric/youcompleteme'
Plug 'preservim/nerdtree'
Plug 'scrooloose/syntastic'

call plug#end()

 

"============================================
"Settings for Syntastic 
"============================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"=======================================
"Resolve conflict between YCM and Syntastic
"=====================================
let g:ycm_show_diagnostics_ui = 0

"=======================================
"Rainbow
"=====================================
let g:rainbow_active = 1

"=======================================
"nerd commenter config
"=====================================
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Set the <leader> to comma
let g:NERDSpaceDelims = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
"=======================================
" nerd tree
"=====================================
" autocmd vimenter * NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" NERDTree automatically
map <C-n> :NERDTreeToggle<CR>

"=======================================
"spelling check highlighting style
"=====================================
" Only for .md file check
autocmd BufRead,BufNewFile *.md setlocal spell
" Change highlighting style for different checking
hi clear SpellBad
hi SpellBad cterm=underline
hi clear SpellCap 
hi SpellCap cterm=italic
hi clear SpellRare
hi SpellRare cterm=undercurl
hi clear SpellLocal
hi SpellLocal cterm=italic
