" PLUGINS --------------------------------------------------------------------------------------------------------------------{{{

call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'townk/vim-autoclose'
Plug 'rust-lang/rust.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'ryanoasis/vim-devicons'

call plug#end()

" --------------------------------------------------------------------------------------------------------------------------- }}}

" VIM BASIC ------------------------------------------------------------------------------------------------------------------{{{

syntax on
filetype on
filetype plugin on
filetype indent on

" Set

set nocompatible
set termguicolors
set showmode
set number
set ruler
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set mouse=a
set nowrap
set scrolloff=10
set wildmenu
set wildmode=list:longest
set encoding=UTF-8

" Color scheme

colorscheme catppuccin_mocha
hi Normal guibg=NONE ctermbg=NONE

" Required for ctags

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" --------------------------------------------------------------------------------------------------------------------------- }}}

" OTHER ---------------------------------------------------------------------------------------------------------------------{{{

" Airline theme

let g:airline_theme='catppuccin_mocha'
let g:airline#extensions#tabline#enabled=1

" Indent line

let g:indentLine_char='¦'
let g:indentLine_color_term=8
let g:rustfmt_autosave=1

" Syntastic

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Hide EoB

let &fillchars ..= ',eob: '

" --------------------------------------------------------------------------------------------------------------------------- }}}

" NERDTree -------------------------------------------------------------------------------------------------------------------{{{

let g:NERDTreeFileLines=1
let g:NERDTreeShowHidden=1

" NERDTree Git

let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ 'Modified'  : 'modified',
    \ 'Staged'    : 'staged',
    \ 'Untracked' : 'untracked',
    \ 'Renamed'   : 'renamed',
    \ 'Unmerged'  : 'unmerged',
    \ 'Deleted'   : 'deleted',
    \ 'Dirty'     : 'dirty',
    \ 'Ignored'   : 'ignored',
    \ 'Clean'     : 'clean',
    \ 'Unknown'   : 'unknown',
    \ }

highlight NERDTreeGitModified guifg=#FFA500 ctermfg=214
highlight NERDTreeGitStaged guifg=#00FF00 ctermfg=10
highlight NERDTreeGitUntracked guifg=#FFFF00 ctermfg=11
highlight NERDTreeGitRenamed guifg=#00BFFF ctermfg=39
highlight NERDTreeGitUnmerged guifg=#FF0000 ctermfg=9
highlight NERDTreeGitDeleted guifg=#8B0000 ctermfg=1
highlight NERDTreeGitDirty guifg=#FFD700 ctermfg=3
highlight NERDTreeGitIgnored guifg=#808080 ctermfg=8
highlight NERDTreeGitClean guifg=#008000 ctermfg=2
highlight NERDTreeGitUnknown guifg=#A9A9A9 ctermfg=7

" Start NERDTree. If a file is specified, move the cursor to its window.

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

"  NERDTree mapping

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" ----------------------------------------------------------------------------------------------------------------------------- }}}

" MAPPING  -------------------------------------------------------------------------------------------------------------------- }}}

nnoremap <F8> :TagbarToggle<CR>

" ----------------------------------------------------------------------------------------------------------------------------- }}}
