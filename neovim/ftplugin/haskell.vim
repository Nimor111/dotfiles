set shiftwidth=4 softtabstop=4 expandtab

" disable coc-nvim completion for haskell files
augroup coc-haskell
  " deletes command
  autocmd!
  au BufEnter *.hs :CocDisable
augroup END

let b:ale_linters = {'haskell': ['hlint']}
let g:ale_haskell_ghc_options = '-fno-code -v0 -isrc'
