" Plugins Section  - Fold 2
call plug#begin('~/.local/share/nvim/site/autoload')
" A Vim Plguins for Lively Previewing LaTeX PDF Output
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'gruvbox-community/gruvbox'
" Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" Plug 'junegunn/seoul256.vim'
Plug 'ron89/thesaurus_query.vim', { 'on': 'ThesaurusQueryReplaceCurrentWord', 'for': 'txt'}
Plug 'dpelle/vim-LanguageTool', { 'on': 'LanguageToolCheck' }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim', { 'as': 'dracula'}
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-jedi'
Plug 'vim-airline/vim-airline' " Airline
Plug 'vim-airline/vim-airline-themes'
Plug 'LunarWatcher/auto-pairs', { 'tag': '*' }
Plug 'sbdchd/neoformat'
" Plug 'davidhalter/jedi-vim' " Jedi-vim to jump to definitions
Plug 'scrooloose/nerdtree'
Plug 'machakann/vim-highlightedyank'
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" tabular plugin used to format tables
Plug 'godlygeek/tabular'
" JSON front matter highlight plugin
" Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown'
" if you don't have node and yarn, use pre build
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
" Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }   "Code-completion engine
Plug 'dhruvasagar/vim-table-mode'
Plug 'djoshea/vim-autoread'
call plug#end()

" Plugin Specific Settings
" Allows for transparent background in neovim from :h dracula & https://github.com/dracula/vim/issues/88
let g:dracula_colorterm = 0
colorscheme dracula

let g:limelight_conceal_ctermfg = 1

" Deoplete
" let g:deoplete#enable_at_startup = 1

" Ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-d>"   " Use <Tab> to trigger autocompletion

" shortcut to go to next position
let g:UltiSnipsJumpForwardTrigger='<c-j>'

" shortcut to go to previous position
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

" Vim-Markdown
" disable header folding
let g:vim_markdown_folding_disabled = 1

" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0

" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format
" disable automatic insertion of bullet points and the new list item indent
" let g:vim_markdown_auto_insert_bullets = 0
" let g:vim_markdown_new_list_item_indent = 0

" Markdown-Preview
" do not close the preview tab when switching to other buffers
let g:mkdp_auto_close = 0
nnoremap <M-m> :MarkdownPreview<CR>
nnoremap <C-p> :MarkdownPreviewToggle<CR>
nnoremap <M-,> :MarkdownPreviewStop<CR>

" Jedi-vim
"disable autocompletion, because we use deoplete for completion
" let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
" let g:jedi#use_splits_not_buffers = right
let g:jedi#use_splits_not_buffers = "left"

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
