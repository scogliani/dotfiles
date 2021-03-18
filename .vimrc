if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
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
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'
Plug 'tell-k/vim-autopep8'
Plug 'pbondoer/vim-42header'
Plug 'wakatime/vim-wakatime'
Plug 'mileszs/ack.vim'
Plug 'tyru/open-browser.vim'
Plug 'aklt/plantuml-syntax'

" colorscheme
Plug 'vim-scripts/darktango.vim'
Plug 'ewilazarus/preto'
Plug 'pgdouyon/vim-yin-yang'

call plug#end()

let mapleader = " "

set nu
syntax enable

" highlight OverLength ctermbg=DarkBlue ctermfg=white guibg=#592929
" set colorcolumn=81

set hlsearch
set ignorecase
set smartcase
set incsearch

map <silent> <leader>/ :nohlsearch<CR>

" Automatically removing all trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

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
set tags=./tags;/
let g:tagbar_left=1
let g:tagbar_autofocus=1
nnoremap <silent> <leader>q :TagbarToggle<CR>

" NERDTree
" for more information: help nerdtree.txt
nnoremap <leader>e :NERDTreeToggle<CR>
let NERDTreeWinSize=30
let NERDTreeMinimalUI=1

" Undotree
" for more information: help undotree.txt
nnoremap <leader>g :UndotreeToggle<CR>
let g:undotree_WindowLayout=2
let g:undotree_SetFocusWhenToggle=1
if has("persistent_undo")
  set undodir=~/.vim/undodir
  if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
  endif
  set undofile
endif

" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight=1
let g:cpp_experimental_simple_template_highlight=1
let g:cpp_concepts_highlight=1

" markdown-preview
nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle

" editorconfig
" for more information: help editorconfig.txt
let g:EditorConfig_core_mode="external_command"
let g:EditorConfig_exec_path="/usr/bin/editorconfig"
let g:EditorConfig_exclude_patterns=['fugitive://.*']
let g:EditorConfig_max_line_indicator="line"

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

" rust
autocmd FileType rust nnoremap <leader>f :RustFmt<CR>

" clang-format
autocmd FileType c noremap <leader>f :ClangFormat<CR>
autocmd FileType cpp noremap <leader>f :ClangFormat<CR>

" autopep8
autocmd FileType python noremap <buffer> <leader>f :call Autopep8()<CR>

" coc.nvim
autocmd FileType json syntax match Comment +\/\/.\+$+

" ale
nmap <silent> <C-e> <Plug>(ale_next_wrap)

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
        \   '%d⨉ %d⚠ ',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

" ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let g:ack_mappings = {
      \  'v':  '<C-W><CR><C-W>L<C-W>p<C-W>J<C-W>p',
      \ 'gv': '<C-W><CR><C-W>L<C-W>p<C-W>J' }

set statusline=
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ %{LinterStatus()}

let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'


" open-browser
" for more information: help openbrowser.txt
