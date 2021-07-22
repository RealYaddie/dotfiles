" Python stuff for virtual environments {{{
" let g:python3_host_prog = '/home/leosmith/.pyenv/versions/py3nvim/bin/python3'
" let g:python_host_prog = '/home/leosmith/.pyenv/versions/py2nvim/bin/python'
" }}}
" Stuff to add nvim-from-vim {{{
let &packpath = &runtimepath
"source ~/.vimrc
" }}}
" Plugins Section {{{
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
" Deoplete
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-jedi'
" Airline
Plug 'vim-airline/vim-airline'
" Auto pairs
" Plug 'jiangmiao/auto-pairs'
Plug 'LunarWatcher/auto-pairs', { 'tag': '*' }
" Neoformat
Plug 'sbdchd/neoformat'
" Jedi-vim to jump to definitions
Plug 'davidhalter/jedi-vim'
" Nerdtree
Plug 'scrooloose/nerdtree'
" Highligheted yank area
Plug 'machakann/vim-highlightedyank'

Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }   "Code-completion engine
call plug#end()
" }}}
" Colors, Tabs and UI Config and Remapping leader {{{
" Trying to make colorscheme work properly
" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" colorscheme seoul256
colorscheme dracula

set tabstop=4	" number of visual spaces per tab
set softtabstop=4	" number of spaces in TAB when editing
set autoindent
set shiftwidth=4
set expandtab	" tabs are spaces
set completeopt=menu,noinsert,noselect

set number	" show line numbers
set relativenumber	"
set showcmd	" show command in the bottom bar
set cursorline	" highlight the current line

set lazyredraw	" redraw the screen only when we need to.

set incsearch	" search as characters are entered
set hlsearch	" highlight matches

" Clipboard
set clipboard+=unnamedplus

let mapleader=" " 	" Map the leader key to spacebar
nnoremap <leader><CR> :noh<CR>

" Terminal Remaps
tnoremap <Esc> <C-\><C-n>

set title   " Change the terminal's title
set showmatch   " set show matching parenthesis
" }}}
" Scrolling {{{
inoremap <C-E> <C-X><C-E>	" scrolling on insert
inoremap <C-Y> <C-X><C-Y>
set scrolloff=3	    " start scrolling down screen when 8 lines away from the bottom of it
" }}}
" Folding {{{
" za opens/closes the folder around current fold block/ zR opens all folds in
" a document with them
set foldenable
set foldlevelstart=10	" open most folds by default
set foldmethod=indent	" fold base on indent level
" }}}
" Splits {{{
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
map <leader>th <C-w>t<C-w>H
map <leader>tk <C-w>t<C-w>K
" Remove pipes | that act as seperators for the splits
" set fillchars+=vert:\
" }}}
" Tabs {{{
" Better tab experience - from https://webdevetc.com/
map <leader>tn :tabnew<CR>
map <leader>t<leader> :tabnext
map <leader>tm :tabmove
map <leader>tc :tabclose<CR>
map <leader>to :tabonly<CR>
nnoremap <leader>tf gt
nnoremap <leader>tF gT
" }}}
" Abbreviations {{{
" }}}
" Vim-latexsuite Stuff {{{
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
" set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after	" vim-latexsuite installs in /usr/share/vim/vimfiles
nnoremap <silent><leader>ca :LLPStartPreview<CR>
" }}}
" Settings for specific plugins {{{
" Deoplete
" let g:deoplete#enable_at_startup = 1

" Undo most recent completeion
" inoremap <expr><C-g>     deoplete#undo_completion()

" " <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function() abort
"   return deoplete#close_popup() . "\<CR>"
" endfunction

" <TAB>: completeion.
" inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Jedi-vim
"disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
" let g:jedi#use_splits_not_buffers = right
let g:jedi#use_splits_not_buffers = "left"

" Highlighted Yank Region
hi HighlightedyankRegion cterm=reverse gui=reverse
" Set highlight duration time to 1000ms aka 1 second.
let g:highlightedyank_highlight_duration = 500
" Nerdtree Stuff
nnoremap <leader>nf :NERDTreeFind<CR>
let NERDTreeStatusline="%{exists('b:NERDTree')?fnamemodify(b:NERDTree.root.path.str(), ':~'):''}"

nnoremap <C-n> :NERDTreeToggle<CR>
" Neoformat
" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to space conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" Auto Pairs LunarWatcher
let g:AutoPairsMapBS=1
" }}}
" Autocommands {{{
" Run python file
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" Goyo and Limelight integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" }}}
" Functions {{{
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

" Transparent Background toggle on.
function! TransparencyToggleOn ()
    highlight Normal ctermbg=none
    highlight NonText ctermbg=none
endfunction
com! TP call TransparencyToggleOn()

" Transparent Background toggle off.
function! TransparencyToggleOff ()
    highlight Normal ctermbg=236
    highlight NonText ctermbg=236
endfunction
com! TPOFF call TransparencyToggleOff()
" }}}
set modelines=1
" vim:foldmethod=marker:foldlevel=0
