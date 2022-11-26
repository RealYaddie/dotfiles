let g:mapleader= " " "Map the leader key to spacebar

filetype plugin indent on
set nocompatible
set title "Change the terminal's title
set autoindent
set expandtab	" tabs are spaces
set tabstop=4	" number of visual spaces per tab
set shiftwidth=4
set softtabstop=0	" number of spaces in TAB when editing
set completeopt=menu,noinsert,noselect
set number	" show line numbers
set relativenumber
set showcmd	" show command in the bottom bar
set cursorline	" highlight the current line
" highlight CursorLine ctermbg=LightBlue cterm=None term=None
set lazyredraw	" redraw the screen only when we need to.
set incsearch	" search as characters are entered
set hlsearch	" highlight matches
set clipboard+=unnamedplus  " Let neovim use the system clipboard
set mouse=a     " Allows for scrolling in vim when running from a tmux session
set encoding=utf8 " Set utf8 as standard encoding and en_US as the standard language
set showmatch   " set show matching parenthesis
set scrolloff=3	    " start scrolling down screen when 8 lines away from the bottom of it
set undodir=$HOME/.config/nvim/undodir      " directory for undo files
set undofile            " turn on persistent undo feature
" set ruler               " Show the cursor position all the time
set cmdheight=1         " More space for displaying messages
set updatetime=300      " Faster completion
set timeoutlen=500      " By default timeoutlen is 1000 ms
set formatoptions-=cro  " Stop newline continution of comments
"set autochdir          " Your working directory will always be the same as your working directory
set pumheight=10        " Makes popup menu smaller
set showtabline=2       " Always show tabs
set splitbelow splitright
set noshowmode          "We don't need to see things like -- INSERT -- anymore

" za opens/closes the folder around current fold block/ zR opens all folds in a document with them
set foldenable
set foldlevelstart=10	" open most folds by default
set foldmethod=indent	" fold base on indent level

" Trying to make colorscheme work properly
" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set t_Co=256


hi HighlightedyankRegion cterm=reverse gui=reverse " Highlighted Yank Region
let g:highlightedyank_highlight_duration = 250 " Set highlight duration time to 1000ms aka 1 second.

set modelines=1
" vim:foldmethod=marker:foldlevel=0
