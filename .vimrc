"for Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"needed for plugin installer pathogen vim
execute pathogen#infect()

"ruler
set ruler

"syntax highlighting
syntax on

"determine type of file based on name and contents
filetype plugin indent on

"compatible makes vim compatible with vi on older unix 
set nocompatible

"hide files instead of closing them when they have unwritten changes
set hidden

"display line numbers on the left
set number

"start nerdtree automatically with vim
autocmd vimenter * NERDTree

"map turn on NERDTree key
map <Leader>k :NERDTreeToggle<CR>

"close vim if only nerdtree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-commentary'
Plugin 'flazz/vim-colorschemes'
Plugin 'elzr/vim-json'
Plugin 'tpope/vim-endwise'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'ervandew/supertab'
Plugin 'davidhalter/jedi-vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/neocomplete.vim'

"set airline theme
let g:airline_theme='bubblegum'

" syntastic settings TODO check
map <Leader>s :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pep8']
let g:syntastic_ruby_checkers = ['rubocop']

"for colorscheme
" set background=light
" let g:solarized_termcolors=256
colorscheme molokai 

" map change background
" map <Leader>bg :let &colorscheme = ( &colorscheme == "molokai" ? "solarized" : "molokai" )<CR>

"column at col 80
set colorcolumn=80
highlight colorcolumn ctermbg=DarkGray

"fold stuff
" augroup vimrc
" 	  au BufReadPre * setlocal foldmethod=indent
" 	  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
" augroup END

"remove trailing whitespaces on save for specific file types
autocmd FileType c,cpp,python,ruby autocmd BufWritePre <buffer> :%s/\s\+$//e

"don't put plugin links after this 
call vundle#end() 

"256 colour vim
set t_Co=256

" map <silent> tw :GhcModTypeInsert<CR>
" map <silent> ts :GhcModSplitFunCase<CR>
" map <silent> tq :GhcModType<CR>
" map <silent> te :GhcModTypeClear<CR>

" settings for jedi python library / autocomplete
let g:jedi#auto_initialization = 1
let g:jedi#show_call_signatures = "2"

" binds for jedi thingie
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>gg"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

" pretty self explanatory
set cmdheight=2
set pastetoggle=<F12>

" map copying and selecting whole text - windows like
vnoremap <C-c> "+y
nnoremap <C-a> ggVG

" sth to do with copying to outside vim
" set clipboard=unnamedplus
"
" let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
" let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
" let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
" let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
" let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
" let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`

let g:haskell_classic_highlighting = 1

let g:neocomplete#enable_at_startup = 1

" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
