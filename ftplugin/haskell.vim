set shiftwidth=2 softtabstop=2 expandtab

let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
