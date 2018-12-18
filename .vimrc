if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/Conque-GDB'
Plug 'w0rp/ale'

" colorscheme
Plug 'vim-scripts/darktango.vim'
Plug 'ewilazarus/preto'
Plug 'pgdouyon/vim-yin-yang'

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

" template files
if has("autocmd")
  augroup templates
    autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh
    autocmd BufNewFile *.py 0r ~/.vim/templates/skeleton.py
  augroup END
endif

" colorscheme
colorscheme darktango

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

" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

" vim-markdown-plugin
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_browser='Firefox'
let vim_markdown_preview_github=1

" editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" fugitive
nnoremap <silent> <leader>st :Gstatus<CR>
nnoremap <silent> <leader>d  :Gdiff<CR>
nnoremap <silent> <leader>c  :Gcommit<CR>
nnoremap <silent> <leader>bl :Gblame<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
nnoremap <silent> <leader>gE :Gedit<space>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gR :Gread<space>
nnoremap <silent> <leader>a  :Gwrite<CR>
nnoremap <silent> <leader>gW :Gwrite!<CR>
nnoremap <silent> <leader>gq :Gwq<CR>
nnoremap <silent> <leader>gQ :Gwq!<CR>

" fzf
"
