" From my init.vim

" spell-check set to <leader>o, 'o' for orthography'. {Courtesy of Luke Smith}
map <leader>o :setlocal spell! spelllang=en_us<CR>

nnoremap <leader><CR> :noh<CR>  " disables highlight on search results.

" Terminal Settings
tnoremap <Esc> <C-\><C-n>   " Use Esc to go into normal mode

" Scrolling on insert, mapping C-E and C-Y like in normal mode
inoremap <C-E> <C-X><C-E>
inoremap <C-Y> <C-X><C-Y>

" Remapping splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusting split sizes a bit more friendly
nnoremap <silent> <M-Left> :vertical resize +3<CR>
nnoremap <silent> <M-Right> :vertical resize -3<CR>
nnoremap <silent> <M-Up> :resize +3<CR>
nnoremap <silent> <M-Down> :resize -3<CR>

" Change 2 split windows from vertical to horizontal or horizontal to vertical
map <leader>th <C-w>t<C-w>H " 2 horizontal splits into 2 vertical splits
map <leader>tk <C-w>t<C-w>K " 2 vertical splits into 2 horizontal splits
" Remove pipes | that act as seperators for the splits
" set fillchars+=vert:\

" Shortened buffer navigations
" TAB in general mode will move to next buffer
"SHIFT-TAB will go back
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>

" Better tab experience - from https://webdevetc.com/
map <silent> <leader>tn :tabnew<CR>
map <silent> <leader>t<leader> :tabnext
map <silent> <leader>tm :tabmove
map <silent> <leader>tc :tabclose<CR>
map <silent> <leader>to :tabonly<CR>

" Alternate way of saving
nnoremap <leader>w :w<CR>
" Display help in new tab
nnoremap <leader>h :tabnew<CR>:help<CR><C-w><C-w>:quit<CR>
" Add newline without leaving normal mode and stay on the current line
nnoremap <M-o> o<Esc> " Newline below
nnoremap <M-S-O> O<Esc> " Newline above

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" PLUGIN MAPPINGS
nnoremap <M-m> :MarkdownPreview<CR>
nnoremap <C-p> :MarkdownPreviewToggle<CR>
nnoremap <M-,> :MarkdownPreviewStop<CR>

nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <C-n> :NERDTreeToggle<CR>

nnoremap <leader>G :Goyo<CR>
nnoremap <leader>GG :Goyo!<CR>

" From Chris@Machine
" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Easier alternative to ESC in Insert mode
inoremap jk <Esc>
inoremap kj <Esc>

" Better tabbing, maintain visual selection
vnoremap < <gv
vnoremap > >gv

" Easy enabling & disabling of Goyo
nnoremap <leader>G :Goyo<CR>
nnoremap <leader>GG :Goyo!<CR>

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" Quality of Life(QOL) Remanps
" Ctrl-d & u center the cursor on the screen
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" When searching center the cursor on the screen, and do a zv fold
nnoremap n nzzzv
nnoremap N Nzzzv

" Remap up & down to go down visual lines; did the same for going to the end
" and start of the line as well
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap $ g$
