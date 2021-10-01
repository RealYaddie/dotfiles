" Plugins Section {{{
call plug#begin()
" A Vim Plguins for Lively Previewing LaTeX PDF Output
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'gruvbox-community/gruvbox'
Plug 'ron89/thesaurus_query.vim', { 'on': 'ThesaurusQueryReplaceCurrentWord', 'for': 'txt'}
Plug 'dpelle/vim-LanguageTool', { 'on': 'LanguageToolCheck' }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
call plug#end()
" }}}
" Colors and Tabs {{{
colorscheme badwolf
syntax enable
set tabstop=4	" number of visual spaces per TAB
set softtabstop=4 	" number of spaces in TAB when editing
set autoindent
set shiftwidth=4
set expandtab		" tabs are spaces
set completeopt=menu,noinsert,noselect
" }}}
" UI Config {{{
set number	" show line numbers
set relativenumber  " 
set showcmd	" show command in the bottom bar
set cursorline	" highlight current line
filetype indent on	" load filetype-specific indent files
set lazyredraw		" redraw the screen only when we need to.
set showmatch		" highlight matching [{()}]
set mouse=a
" }}}
" Searching {{{
set incsearch	" search as characters are entered
set hlsearch	" highlight matches
" }}}
" Folding {{{
" za opens/closes the fold around the current block
set foldenable 		" enable folding
set foldlevelstart=10	" open most folds by default
set foldmethod=indent   " fold based on indent level
" }}}
" Kite Settings {{{
let g:kite_tab_complete=1   " instead of <C-y> use tab to accept completeion
" }}}
" Statusline Stuff {{{
"set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
"set laststatus=2  " always display the status line
" }}}
" Messing with the leader {{{
let mapleader=" "   " Map leader to spacebar
"set timeoutlen 500 " Set timeout length to 500 ms
nnoremap <leader><CR> :noh<CR>
" }}}
" Splits {{{
set splitbelow splitright
" Remapping splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusting split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vertical to horizontal or horizontal to verti
map <leader>th <C-w>t<C-w>H
map <leader>tk <C-w>t<C-w>K

" Removes pipes | that act as seperators for the splits
"set fillchars+=vert:\ 
" }}}
" Abbreviations {{{
" }}}
" Vim-latexsuite Stuff *latest addition/change*{{{
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after   " vim-latexsuite installs in /usr/share/vim/vimfiles
nnoremap <silent><leader>ca :LLPStartPreview<CR>
" }}}
" Scrolling {{{
inoremap <C-E> <C-X><C-E>   " scrolling on insert
inoremap <C-Y> <C-X><C-Y>
set scrolloff=8     " start scrolling down screen when 8 lines from it
" }}}
set modelines=1
" vim:foldmethod=marker:foldlevel=0
