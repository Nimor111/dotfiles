filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"needed for plugin installer pathogen vim
execute pathogen#infect()

" try font change
" set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
" set encoding=utf-8

"ruler
set ruler

"syntax highlighting
syntax on

"determine type of file based on name and contents
filetype plugin indent on

"compatible makes vim compatible with vi on older unix 
set nocompatible

"hide files instead of closing them when they have unwritten changes
" set hidden

"display line numbers on the left
set number

"start nerdtree automatically with vim
" autocmd vimenter * NERDTree

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
Plugin 'Shougo/neocomplete.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-unimpaired'
Plugin 'jiangmiao/auto-pairs'
Plugin 'elixir-lang/vim-elixir'
Plugin 'Twinside/vim-haskellConceal'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-salve'
Plugin 'mattn/emmet-vim'
Plugin 'svjunic/RadicalGoodSpeed'
Plugin 'jnurmine/Zenburn'
Plugin 'rust-lang/rust.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'AndrewRadev/sideways.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'tpope/vim-fugitive'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'mileszs/ack.vim'


"set airline theme
let g:airline_theme='term'

" syntastic settings TODO check
map <Leader>s :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_scala_checkers = ['']
let g:syntastic_python_checkers = ['pep8']
let g:syntastic_python_pep8_args='--ignore=E501,E225'
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_cpp_checkers = ['g++ -std=c++11']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_rust_checkers = ['rustc']
let g:syntastic_cpp_clang_exec =  '/usr/bin/clang'

"for colorscheme
" set background=light
" let g:solarized_termcolors=256
" colorscheme solarized
" colors zenburn
" colorscheme radicalgoodspeed 
colorscheme zenburn 
" colorscheme kolor 

" gruvbox settings
let g:gruvbox_italic=1

"column at col 80
set colorcolumn=120
highlight colorcolumn ctermbg=DarkGray

"fold stuff
" augroup vimrc
" 	  au BufReadPre * setlocal foldmethod=indent
" 	  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
" augroup END
set foldmethod=indent
set foldlevel=99

"remove trailing whitespaces on save for specific file types
autocmd FileType c,cpp,python,ruby autocmd BufWritePre <buffer> :%s/\s\+$//e

"don't put plugin links after this 
call vundle#end() 

"256 colour vim
" set t_Co=256

" map <silent> tw :GhcModTypeInsert<CR>
" map <silent> ts :GhcModSplitFunCase<CR>
" map <silent> tq :GhcModType<CR>
" map <silent> te :GhcModTypeClear<CR>

" settings for jedi python library / autocomplete
let g:jedi#auto_initialization = 1
let g:jedi#show_call_signatures = "2"

" " binds for jedi thingie
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
"
" called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
	if exists(':NeoCompleteLock')==2
	      exe 'NeoCompleteLock'
	endif
endfunction

" Called once only when the multiple selection is canceled
" (default <Esc>)
function! Multiple_cursors_after()
	if exists(':NeoCompleteUnlock')==2
		exe 'NeoCompleteUnlock'
	endif
endfunction

" fix issue with airline not appearing when NerdTree is off
set laststatus=2

" show powerline symbols in airline
let g:airline_powerline_fonts = 1

" map sideways keys
nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>

" use ag
let g:ackprg = 'ag --vimgrep'
