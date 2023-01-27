" Resetting cursorline option everytime I enter vim(colorscheme always changes it)
augroup CustomCursorLine
    au!
    au VimEnter * :hi! CursorLine gui=underline cterm=underline
augroup END

" Close the auto-complete window when we select something from it
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" Use TAB to cycle through auto-complete options.
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Run python file
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" Goyo and Limelight integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Automatically deletes all trailing whitespace and newlines at end of file on save.
autocmd BufWritePre *\(.md\|.mkd\)\@<! %s/\s\+$//e
autocmd BufWritePre *\(.md\|.mkd\)\@<! %s/\n\+\%$//e

" Add space HTML character for markdown files
autocmd FileType * inoremap ;sp &#32;
