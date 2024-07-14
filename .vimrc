" General Editor Settings
set tabstop=2
set shiftwidth=2
set expandtab
set nocompatible
set autoindent
set smartindent
set ruler
set showcmd
set incsearch
set shellslash
set number
set relativenumber
set termguicolors
set background=dark
set laststatus=2
set cino+=L0
syntax on
filetype plugin on
filetype indent on
filetype off
setlocal indentkeys-=:


" Keybindings for { completion, "jk" for escape, ; for : in normal mode, ctrl-a to select all }
inoremap {<CR>  {<CR>}<Esc>O
inoremap {}     {}
imap jk         <Esc>
nnoremap ; :
map <C-a> <esc>ggVG<CR>
set belloff=all

" Append template to new C++ files
" autocmd BufNewFile *.cpp 0r /media/dev/VIMCP/lib/template_01.cpp

" Compile and Run
" Note that this line requires the build.sh script!
autocmd filetype cpp nnoremap <F9> :w <bar> !build.sh %:r <CR>
autocmd filetype cpp nnoremap <F10> :!./%:r <CR>

" LaTeX Settings
autocmd FileType tex :NoMatchParen
autocmd FileType tex :set tw=110

" Plugins Setup
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'

if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'lervag/vimtex'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tpope/vim-fugitive'
Plug 'lukelbd/vim-statusline'
Plug 'sainnhe/everforest'

call plug#end()

" Editor Theme
colorscheme everforest

" Buffer Specific Configuration for .tex Files
filetype plugin indent on
let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options = '-reuse-instance @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'
let g:tex_flavor = 'latex'
let g:vimtex_motion_matchparen = 0
let g:vimtex_fold_manual = 1
let g:vimtex_matchparen_enabled = 0

augroup TexFileSettings
  autocmd!
  autocmd BufNewFile,BufRead *.tex
    \ set nocursorline |
    \ set nornu |
    \ set number |
    \ let g:loaded_matchparen=1 |
augroup END

