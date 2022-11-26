" Word Processor Mode.
function! Writer ()
    " Sets
    setlocal spell spelllang=en_us
    setlocal formatoptions=t1
    setlocal textwidth=80
    setlocal noautoindent
    setlocal shiftwidth=5
    setlocal tabstop=5
    setlocal expandtab
    setlocal wrap
    setlocal linebreak
    " Movement changes
    map j gj
    map k gk
endfunction
com! WR call Writer()
