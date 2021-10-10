" Python stuff for virtual environments - Fold 1
" let g:python3_host_prog = '/home/leosmith/.pyenv/versions/py3nvim/bin/python3'
" let g:python_host_prog = '/home/leosmith/.pyenv/versions/py2nvim/bin/python'

" Stuff to add nvim-from-vim
let &packpath = &runtimepath
"source ~/.vimrc

" Plugins Section  - Fold 2
call plug#begin('~/.local/share/nvim/site/autoload')
" A Vim Plguins for Lively Previewing LaTeX PDF Output
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'gruvbox-community/gruvbox'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'junegunn/seoul256.vim'
Plug 'ron89/thesaurus_query.vim', { 'on': 'ThesaurusQueryReplaceCurrentWord', 'for': 'txt'}
Plug 'dpelle/vim-LanguageTool', { 'on': 'LanguageToolCheck' }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim', { 'as': 'dracula'}
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Deoplete
" Plug 'zchee/deoplete-jedi'
Plug 'vim-airline/vim-airline' " Airline
Plug 'LunarWatcher/auto-pairs', { 'tag': '*' }
Plug 'sbdchd/neoformat'
Plug 'davidhalter/jedi-vim' " Jedi-vim to jump to definitions
Plug 'scrooloose/nerdtree'
Plug 'machakann/vim-highlightedyank'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }   "Code-completion engine
call plug#end()

" Colors, Tabs and UI Config and Remapping leader - Fold 3
" Trying to make colorscheme work properly
" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set t_Co=256

let g:limelight_conceal_ctermfg = 1
" colorscheme seoul256
" Allows for transparent background in neovim from :h dracula & https://github.com/dracula/vim/issues/88
let g:dracula_colorterm = 0
colorscheme dracula

filetype plugin indent on
set nocompatible

set expandtab	" tabs are spaces
set tabstop=4	" number of visual spaces per tab
set softtabstop=4	" number of spaces in TAB when editing
set autoindent
set shiftwidth=4
set completeopt=menu,noinsert,noselect
set number	" show line numbers
set relativenumber
set showcmd	" show command in the bottom bar
set cursorline	" highlight the current line
set lazyredraw	" redraw the screen only when we need to.
set incsearch	" search as characters are entered
set hlsearch	" highlight matches
set clipboard+=unnamedplus  " Let neovim use the system clipboard
set mouse=a     " Allows for scrolling in vim when running from a tmux session
set encoding=utf8 " Set utf8 as standard encoding and en_US as the standard language
set showmatch   " set show matching parenthesis
set scrolloff=3	    " start scrolling down screen when 8 lines away from the bottom of it

" spell-check set to <leader>o, 'o' for orthography'. {Courtesy of Luke Smith}
map <leader>sp :setlocal spell! spelllang=en_us<CR>

let mapleader=" " 	" Map the leader key to spacebar
nnoremap <leader><CR> :noh<CR>  " disables highlight on search results.

" Terminal Settings
tnoremap <Esc> <C-\><C-n>   " Use Esc to go into normal mode
set title "Change the terminal's title
" let &titleold="st"

" Scrolling - Fold 4
" Scrolling on insert, mapping C-E and C-Y like in normal mode
inoremap <C-E> <C-X><C-E>
inoremap <C-Y> <C-X><C-Y>

" Folding - Fold 5
" za opens/closes the folder around current fold block/ zR opens all folds in
" a document with them
set foldenable
set foldlevelstart=10	" open most folds by default
set foldmethod=indent	" fold base on indent level

" Splits - Fold 6
set splitbelow splitright

" Remapping splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusting split sizes a bit more friendly
nnoremap <silent> <C-Left> :vertical resize +3<CR>
nnoremap <silent> <C-Right> :vertical resize -3<CR>
nnoremap <silent> <C-Up> :resize +3<CR>
nnoremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vertical to horizontal or horizontal to vertical
map <leader>th <C-w>t<C-w>H " 2 horizontal splits into 2 vertical splits
map <leader>tk <C-w>t<C-w>K " 2 vertical splits into 2 horizontal splits
" Remove pipes | that act as seperators for the splits
" set fillchars+=vert:\

" Buffers - Fold 7
nnoremap <silent> <leader>bn :bnext<CR>
nnoremap <silent> <leader>bp :bprev<CR>

" Tabs - Fold 8
" Better tab experience - from https://webdevetc.com/
map <silent> <leader>tn :tabnew<CR>
map <silent> <leader>t<leader> :tabnext
map <silent> <leader>tm :tabmove
map <silent> <leader>tc :tabclose<CR>
map <silent> <leader>to :tabonly<CR>

" Shortcuts/Abbreviations - Fold 9
nnoremap <leader>w :w<CR>
nnoremap <leader>h :tabnew<CR>:help<CR><C-w><C-w>:quit<CR> " Display help in new tab
" Add newline without leaving normal mode and stay on the current line
nnoremap <M-o> o<Esc> " Newline below
nnoremap <M-S-O> O<Esc> " Newline above

" Vim-latexsuite Stuff - Fold 10
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
" set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after	" vim-latexsuite installs in /usr/share/vim/vimfiles
nnoremap <silent><leader>ca :LLPStartPreview<CR>

" Plugin Specific Settings - Fold 11
" Jedi-vim
"disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
" let g:jedi#use_splits_not_buffers = right
let g:jedi#use_splits_not_buffers = "left"

hi HighlightedyankRegion cterm=reverse gui=reverse " Highlighted Yank Region
let g:highlightedyank_highlight_duration = 250 " Set highlight duration time to 1000ms aka 1 second.

" Nerdtree Stuff
nnoremap <leader>nf :NERDTreeFind<CR>
let NERDTreeStatusline="%{exists('b:NERDTree')?fnamemodify(b:NERDTree.root.path.str(), ':~'):''}"
nnoremap <C-n> :NERDTreeToggle<CR>

" Neoformat
let g:neoformat_basic_format_align = 1 " Enable alignment
let g:neoformat_basic_format_retab = 1 " Enable tab to space conversion
let g:neoformat_basic_format_trim = 1 " Enable trimmming of trailing whitespace

" Auto Pairs LunarWatcher
let g:AutoPairsMapBS=1

" Autocommands - Fold 12
" PYTHON
" Run python file
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" MARKDOWN
" autocmd FileType markdown
" Goyo and Limelight integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

nnoremap <leader>G :Goyo<CR>
nnoremap <leader>GG :Goyo!<CR>

" Functions - Fold 13
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

" Latest additions (sep 30 2021)

" Automatically deletes all trailing whitespace and newlines at end of file on save.
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

set modelines=1
" vim:foldmethod=marker:foldlevel=0
