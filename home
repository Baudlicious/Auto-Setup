syntax enable
filetype plugin on
set number relativenumber
set encoding=utf-8
set fileencoding=utf-8
set visualbell
set ruler
set hlsearch
set guifont=Fira\ Mono\ Medium\ for\ Powerline:h10
set t_Co=256
set background=dark

autocmd FileType python setlocal autoindent softtabstop=4 tabstop=4 shiftwidth=4 expandtab

"Wrapped lines behave like normal lines when using j,k
nnoremap j gj
nnoremap k gk

"Ctrl-L to clear highlighting
nnoremap <C-L> :nohl<ESC><C-L>

"Based on file type save file and run it..
autocmd FileType rust map <buffer> <F5> <Esc>:w<CR>:!clear;cargo run<CR>
autocmd FileType python map <buffer> <F5> <Esc>:w<CR>:!clear;python3 %<CR>

" Escapes with the press of jk in insert mode 
inoremap jk <Esc> 

" Auto install plug if not present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Plug stuff
call plug#begin('~/.vim/plugged')
Plug 'rust-lang/rust.vim'
Plug 'vim-airline/vim-airline/'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
 
" !!!!  air-line !!!!
let g:airline_powerline_fonts = 1
let g:airline_theme = 'ayu_mirage'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
