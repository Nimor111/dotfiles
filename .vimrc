filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"needed for plugin installer pathogen vim
execute pathogen#infect()

" try font change
" set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
" set encoding=utf-8

" source .file
set shell=/bin/zsh

"ruler
set ruler

"leader key
let mapleader=" "

"ignore case when using search pattern
set ignorecase 

"override 'ignorecase' when pattern has upper chars
set smartcase 

"highlight the screen line of the cursor
set cursorline 

"automatically set the indent of a new line
set autoindent 

"do clever autoindenting for next line (after if for etc.)
set smartindent 

"relative line numbers and line numbers
set number
set relativenumber

set showcmd

"syntax highlighting
syntax on

"determine type of file based on name and contents
filetype plugin indent on

"compatible makes vim compatible with vi on older unix 
set nocompatible

"hide files instead of closing them when they have unwritten changes
set hidden

"display line numbers on the left
" set number

"no swap file
set noswapfile

"command line completion show a list of matches
set wildmenu 

"specifies how command line completion works
set wildmode=full 

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
Plugin 'kien/ctrlp.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'tpope/vim-fugitive'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'mileszs/ack.vim'
Plugin 'slashmili/alchemist.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'janko-m/vim-test'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'trusktr/seti.vim'
Plugin 'mxw/vim-jsx'
Plugin 'airblade/vim-gitgutter'
Plugin 'arcticicestudio/nord-vim'
Plugin 'othree/html5.vim'
Plugin 'prettier/vim-prettier'
Plugin 'nbouscal/vim-stylish-haskell'
Plugin 'shime/vim-livedown'
Plugin 'w0rp/ale'
Plugin 'racer-rust/vim-racer'

"set airline theme
let g:airline_theme='gruvbox'

" syntastic settings TODO check
map <Leader>s :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_enable_signs=1

let g:syntastic_error_symbol='✗'
let g:syntastic_style_error_symbol='✠'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_warning_symbol='≈'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_scala_checkers = ['']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_pep8_args='--ignore=E501,E225'
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_cpp_checkers = ['g++ -std=c++11']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_rust_checkers = ['rustc']
let g:syntastic_cpp_clang_exec =  '/usr/bin/clang'

"for colorscheme
" set background=dark
" let g:solarized_termcolors=256
" colorscheme solarized
" colors zenburn
" colorschem nord
" colorscheme radicalgoodspeed 
" colorscheme seti
" colorscheme kolor 
colorscheme gruvbox

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
autocmd FileType c,cpp,python,ruby,javascript,rust autocmd BufWritePre <buffer> :%s/\s\+$//e

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

" use ag
let g:ackprg = 'ag --vimgrep'

" vim test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

let test#strategy = "vtr"
let test#python#runner = 'pytest'

"Substitute
nnoremap <c-s> :%s/
vnoremap <c-s> :s/

" Disable arrow keys
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

" JS highlighting
let g:javascript_plugin_flow = 1

" don't require .jsx extension
let g:jsx_ext_required = 0

" settings for prettify
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql PrettierAsync

" vim-go settings
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']

" some vim-go to def binds
nmap <silent> <leader>d :GoDef<CR>
nmap <silent> <leader>dd :GoTest<CR>

" use airline for vim ale errors
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Jump quickly through errors in ALE
nmap <silent> <Leader>j <Plug>(ale_previous_wrap)
nmap <silent> <Leader>m <Plug>(ale_next_wrap)

" ignore node modules in ctrl-p
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|_site|node_modules)$',
  \ }

" run a markdown grip preview on every save
autocmd BufWritePost *.md !grip -b

" run rustfmt on save
let g:rustfmt_autosave = 1

" use cargo check command on save
let g:ale_rust_cargo_use_check = 1

" set ale linter to be stack-ghc-mod and not standard ghc-mod
let g:ale_linters = {'haskell': ['hlint', 'stack-ghc-mod']}

" set .pl extension to be prolog
let g:filetype_pl="prolog"

" for racer vim
let g:racer_cmd = "/home/gbojinov/.cargo/bin/racer"

" complete function definitions
let g:racer_experimental_completer = 1

" mappings for racer vim plugin
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" turn off automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Highlight the search term while still typing it.
set hlsearch
set incsearch

" spell checker
set spell

" Show trailing whitespace as ·
set list
set listchars=tab:\ \ ,trail:·

" disable help screen, we all know it's annoying
nnoremap <F1> <NOP>

" snippet dirs
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
