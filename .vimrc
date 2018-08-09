if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'Valloric/YouCompleteMe'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/Conque-GDB'
Plug 'vim-scripts/darktango.vim'

call plug#end()

let mapleader = " "

set nu
syntax enable

highlight OverLength ctermbg=DarkBlue ctermfg=White guibg=NONE
set colorcolumn=80

set hlsearch
set ignorecase
set smartcase
set incsearch
map <silent> <leader>/ :nohlsearch<CR>

" Automatically removing all trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" ctags
set tags=./tags;/

"
" folding setup activation
set foldmethod=syntax
set foldlevelstart=1
let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

" darktango
colorscheme darktango

" ctrlp
" for more information: help ctrlp.txt
nnoremap <leader>. :CtrlPTag<CR>

" tagbar
" for more information: help tagbar.txt
let g:tagbar_left=1
let g:tagbar_autofocus=1
nnoremap <silent> <leader>q :TagbarToggle<CR>

" NERDTree
" for more information: help nerdtree.txt
nnoremap <leader>e :NERDTreeToggle<CR>
let NERDTreeWinSize = 30
let NERDTreeMinimalUI = 1

" Undotree
" for more information: help undotree.txt
nnoremap <leader>g :UndotreeToggle<CR>
let g:undotree_WindowLayout = 2
let g:undotree_SetFocusWhenToggle = 1
if has("persistent_undo")
  set undodir=~/.vim/undodir
  if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
  endif
  set undofile
endif

" YouCompleteMe
" for more information: help youcompleteme
" let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

" vim-markdown-plugin
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_browser='Firefox'
let vim_markdown_preview_github=1
