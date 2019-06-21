" plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
Plug 'terryma/vim-multiple-cursors'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'tmhedberg/SimpylFold'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'ternjs/tern_for_vim', {'do': 'npm install && npm install -g tern'}
Plug 'carlitux/deoplete-ternjs'

call plug#end()

" leader key
let mapleader=' '

" navigate through deoplete autocomplete list with Tab
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" vim-airline theme
let g:airline_theme='bubblegum'

" start deoplete with nvim
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})

" nerdcommenter - turn off automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

"start nerdtree automatically with vim
"close vim if only nerdtree is open
augroup nerdtree
	autocmd vimenter * NERDTree
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

"map turn on NERDTree key
map <Leader>k :NERDTreeToggle<CR>

" neomake linters
" use flake8 in personal projects, work projects use pylint
let g:neomake_python_enabled_makers = ['pylint']

" auto syntax check
" call neomake#configure#automake('nrwi', 500)

" open folds by default when opening file
set foldlevelstart=20

" colorscheme
colorscheme gruvbox

" numbers
set number

" highlight the screen line of the cursor
set cursorline

" tern-js for autocomplete
let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
