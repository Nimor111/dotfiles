" set encoding
scriptencoding utf-8

filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
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
let mapleader=' '

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

"syntax highlighting
syntax on

"determine type of file based on name and contents
filetype plugin indent on

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
"close vim if only nerdtree is open
augroup nerdtree
  autocmd vimenter * NERDTree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

"map turn on NERDTree key
map <Leader>k :NERDTreeToggle<CR>

"plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-commentary'
Plugin 'flazz/vim-colorschemes'
Plugin 'elzr/vim-json'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ervandew/supertab'
Plugin 'davidhalter/jedi-vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-unimpaired'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Twinside/vim-haskellConceal'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'mattn/emmet-vim'
Plugin 'rust-lang/rust.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'tpope/vim-fugitive'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'mileszs/ack.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'janko-m/vim-test'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'mxw/vim-jsx'
Plugin 'airblade/vim-gitgutter'
Plugin 'othree/html5.vim'
Plugin 'prettier/vim-prettier'
Plugin 'shime/vim-livedown'
Plugin 'racer-rust/vim-racer'
Plugin 'ryanoasis/vim-devicons'
Plugin 'Chiel92/vim-autoformat'
Plugin 'purescript-contrib/purescript-vim'
Plugin 'FrigoEU/psc-ide-vim'
Plugin 'chemzqm/vim-jsx-improve'
Plugin 'w0rp/ale'
Plugin 'ianks/vim-tsx'
Plugin 'epilande/vim-es2015-snippets'
Plugin 'epilande/vim-react-snippets'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'elmcast/elm-vim'
Plugin 'tikhomirov/vim-glsl'
Plugin 'thyrgle/vim-dyon'
Plugin 'fatih/vim-go'
Plugin 'nsf/gocode'
Plugin 'StanAngeloff/php.vim'
Plugin 'alx741/vim-hindent'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Ivo-Donchev/vim-react-goto-definition'
Plugin 'ap/vim-css-color'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'Quramy/tsuquyomi'
Plugin 'scrooloose/nerdtree'

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
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_pep8_args='--ignore=E501,E225'
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_rust_checkers = ['rustc']
let g:syntastic_haskell_checkers = ['hlint']
" let g:syntastic_cpp_clang_exec =  '/usr/bin/clang'

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'

"for colorscheme
set background=dark
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
augroup whitespace
  autocmd FileType * autocmd BufWritePre <buffer> :%s/\s\+$//e
augroup END

"don't put plugin links after this
call vundle#end()

"256 colour vim
set t_Co=256

" settings for jedi python library / autocomplete
let g:jedi#auto_initialization = 1
let g:jedi#show_call_signatures = '2'

" " binds for jedi thingie
let g:jedi#goto_command = '<leader>d'
let g:jedi#goto_assignments_command = '<leader>g'
let g:jedi#goto_definitions_command = '<leader>gg'
let g:jedi#documentation_command = 'K'
let g:jedi#usages_command = '<leader>n'
let g:jedi#completions_command = '<C-Space>'
let g:jedi#rename_command = '<leader>r'

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

let test#strategy = 'vtr'
let test#python#runner = 'pytest'

"Substitute
nnoremap <c-s> :%s/
vnoremap <c-s> :s/

" Disable arrow keys
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . 'noremap ' . key . ' <Nop>'
  endfor
endfor

" JS highlighting
let g:javascript_plugin_flow = 1

" don't require .jsx extension
let g:jsx_ext_required = 1

" settings for prettify
let g:prettier#autoformat = 0
augroup prettier
  autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql PrettierAsync
augroup END

" vim-go settings
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']

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
" autocmd BufWritePost *.md !grip -b

" run rustfmt on save
let g:rustfmt_autosave = 1

" use cargo check command on save
let g:ale_rust_cargo_use_check = 1

" set ale linter to be stack-ghc-mod and not standard ghc-mod
let g:ale_linters = {'haskell': ['hlint', 'stack-ghc-mod'], 'cpp': ['clang'], 'cc': ['clang'], 'rust': ['cargo']}
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_cpp_clang_options = '-std=c++1z -Wall'

" set .pl extension to be prolog
let g:filetype_pl='prolog'

" for racer vim
let g:racer_cmd = '$HOME/.cargo/bin/racer'

" complete function definitions
let g:racer_experimental_completer = 1

" mappings for racer vim plugin
augroup racer
  au FileType rust nmap gd <Plug>(rust-def)
  au FileType rust nmap gs <Plug>(rust-def-split)
  au FileType rust nmap gx <Plug>(rust-def-vertical)
  au FileType rust nmap <leader>gd <Plug>(rust-doc)
augroup END

" turn off automatic comment insertion
augroup comment
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

" Highlight the search term while still typing it.
set hlsearch
set incsearch

" spell checker
" set spell

" Show trailing whitespace as ·
set list
set listchars=tab:\ \ ,trail:·

" disable help screen, we all know it's annoying
nnoremap <F1> <NOP>

" snippet dirs
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'

" map turning off highlighting in searches
nmap <leader>f :set nohlsearch<CR>

" autoformat C and cpp code
augroup CPP
  autocmd BufWritePost *.c,*.cc,*.cpp,*.h,*.hpp :Autoformat
augroup END

" set syntax highlighting on hbs files
" set .ron extension on ron files
augroup filetypes
  au BufRead,BufNewFile *.hbs set filetype=handlebars
  au BufRead,BufNewFile *.ron set filetype=ron
augroup END

" enable syntastic checks of purescript code
let g:psc_ide_syntastic_mode = 1

" Allow JSX in normal JS files
" let g:jsx_ext_required = 0

" options for vim-prettier js plugin
let g:prettier#config#single_quote = 'false'
let g:prettier#config#trailing_comma = 'none'

" Ignore pyc files in nerd tree
let NERDTreeIgnore = ['\.pyc$']

" vim-go
augroup golang
  autocmd FileType go inoremap <buffer> . .<C-x><C-o>
  autocmd FileType go nmap <silent> <leader>d :GoDef<CR>
  autocmd FileType go nmap <silent> <leader>dd :GoTest<CR>
  autocmd FileType go nmap <silent> <leader>h :GoRun<CR>
augroup END

" ultisnips
" let g:UltiSnipsExpandTrigger="<c-j>"

" make backspace work normally
set backspace=2 " make backspace work like most other programs

" hindent
let g:hindent_on_save = 1

" react def
noremap <leader>h :call ReactGotoDef()<CR>

" make prettier use single quotes by default
let g:prettier#config#single_quote = 'true'

" remove whitespace
nmap <leader>b :%s/\s\+$//e<CR>

" disable on save
let g:tsuquyomi_disable_quickfix = 1

" hints
" imports
augroup typescriptplugin
  autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
  autocmd FileType typescript nmap <buffer> <Leader>i :TsuImport<CR>
augroup END

" autoformat dart files
augroup dart
  autocmd bufwritepost *.dart silent !flutter format %
  set autoread
augroup END

" show commands longer than one symbol
set showcmd
