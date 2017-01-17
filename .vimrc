" This .vimrc needs junegunn/vim-plug
call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/Conque-GDB'
Plug 'altercation/vim-colors-solarized', { 'dir': '~/.vim/colors' }
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'scrooloose/nerdtree'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'

call plug#end()

" NERDTree
nnoremap <C-e> :NERDTreeToggle<CR>
let NERDTreeWinSize = 30
let NERDTreeMinimalUI = 1

" Undotree
nnoremap <C-t> :UndotreeToggle<CR>
let g:undotree_SplitWidth = 30

set nu
syntax enable

" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

set foldmethod=syntax
set foldlevelstart=1

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XM
