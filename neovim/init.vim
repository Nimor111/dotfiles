" plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
"Plug 'venantius/vim-cljfmt'
"Plug 'guns/vim-clojure-static'
"Plug 'guns/vim-clojure-highlight'
"Plug 'tpope/vim-fireplace'
" autoconnect to repls
"Plug 'tpope/vim-classpath'
" static support for lein.
"Plug 'tpope/vim-salve'
Plug '907th/vim-auto-save'
Plug 'LnL7/vim-nix'
Plug 'Chiel92/vim-autoformat'
Plug 'cespare/vim-toml'
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
Plug 'Chiel92/vim-autoformat'
Plug 'derekwyatt/vim-scala'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'idris-hackers/idris-vim'
Plug 'Numkil/ag.nvim'
Plug 'neovimhaskell/haskell-vim'
Plug 'parsonsmatt/intero-neovim'
Plug 'derekelkins/agda-vim'
Plug 'purescript-contrib/purescript-vim'
Plug 'unblevable/quick-scope'

call plug#end()

" line numbers relative to current location
set relativenumber

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
" let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})

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
let g:neomake_haskell_enabled_makers = ['hlint']

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

" show whitespace as .
set list
set listchars=tab:\ \ ,trail:·

" clear all trailing whitespace on save
autocmd FileType * autocmd BufWritePre <buffer> :%s/\s\+$//e

" switch tabs
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" comments highlighting for json
autocmd FileType json syntax match Comment +\/\/.\+$+

" Configuration for coc.nvim

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Some server have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=4

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)

" Remap for do action format
nnoremap <silent> <leader>g :call CocAction('format')<CR>

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" disable deoplete for scala files
autocmd FileType scala
       \ call deoplete#custom#buffer_option('auto_complete', v:false)

" disable lua for scala files
autocmd FileType lua
       \ call deoplete#custom#buffer_option('auto_complete', v:false)

" disable deoplete for json files
autocmd FileType json
       \ call deoplete#custom#buffer_option('auto_complete', v:false)

" disable deoplete for elm files
autocmd FileType elm
       \ call deoplete#custom#buffer_option('auto_complete', v:false)

" disable deoplete for rust and toml files
autocmd FileType rust
       \ call deoplete#custom#buffer_option('auto_complete', v:false)

autocmd FileType toml
       \ call deoplete#custom#buffer_option('auto_complete', v:false)

" disable deoplete for purescript files
autocmd FileType purescript
       \ call deoplete#custom#buffer_option('auto_complete', v:false)

" disable deoplete for clojure files
autocmd FileType clojure
       \ call deoplete#custom#buffer_option('auto_complete', v:false)

" escape time
set ttimeoutlen=100

" easier navigation
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>

" ignore some folders with CtrlP
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" open files in new tab with ctrlp
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

" haskell-vim settings
let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2
let g:haskell_indent_case_alternative = 1
let g:cabal_indent_section = 2

" intero settings
augroup interoMaps
  au!
  " Maps for intero. Restrict to Haskell buffers so the bindings don't collide.

  " Background process and window management
  au FileType haskell nnoremap <silent> <leader>is :InteroStart<CR>
  au FileType haskell nnoremap <silent> <leader>ik :InteroKill<CR>

  " Open intero/GHCi split horizontally
  au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR>
  " Open intero/GHCi split vertically
  au FileType haskell nnoremap <silent> <leader>iov :InteroOpen<CR><C-W>H
  au FileType haskell nnoremap <silent> <leader>ih :InteroHide<CR>

  " Reloading (pick one)
  " Automatically reload on save
  au BufWritePost *.hs InteroReload

  " Load individual modules
  au FileType haskell nnoremap <silent> <leader>il :InteroLoadCurrentModule<CR>
  au FileType haskell nnoremap <silent> <leader>if :InteroLoadCurrentFile<CR>

  " Type-related information
  " Heads up! These next two differ from the rest.
  au FileType haskell map <silent> <leader>t <Plug>InteroGenericType
  au FileType haskell map <silent> <leader>T <Plug>InteroType
  au FileType haskell nnoremap <silent> <leader>it :InteroTypeInsert<CR>

  " Navigation
  au FileType haskell nnoremap <silent> <leader>jd :InteroGoToDef<CR>

  " Managing targets
  " Prompts you to enter targets (no silent):
  au FileType haskell nnoremap <leader>ist :InteroSetTargets<SPACE>

  " Evaluate an expression in REPL
  au FileType haskell nnoremap <silent> <leader>ne :InteroEval<CR>
augroup END

" Change the intero window size; default is 10.
let g:intero_window_size = 10

" Enable type information on hover (when holding cursor at point for ~1 second).
let g:intero_type_on_hover = 1

" OPTIONAL: Make the update time shorter, so the type info will trigger faster.
set updatetime=1000

" Ctrl-{hjkl} for navigating out of terminal panes
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-f> <C-\><C-n><C-w>l

" intero
let g:intero_backend = {
        \ 'command': 'ghci',
        \ 'cwd': expand('%:p:h'),
        \}

set hidden

" vim ale
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" jump between ale errors
nmap <silent> <leader>m <Plug>(ale_previous_wrap)
nmap <silent> <leader>n <Plug>(ale_next_wrap)

" map turning off highlighting in searches
nmap <leader>f :set nohlsearch<CR>

" local leader key
let maplocalleader = ' '

" format haskell files on save
augroup haskell-format
  autocmd BufWrite *.hs :Autoformat
  " Don't automatically indent on save, since vim's autoindent for haskell is buggy
  autocmd FileType haskell let b:autoformat_autoindent=0
augroup END

" have verbose logs for autoformat
let g:autoformat_verbosemode=1

" set elm filetype
augroup elm
  autocmd BufRead,BufNewFile *.elm set filetype=elm
  "autocmd BufWrite *.elm :call CocAction('format')<CR>
augroup END
