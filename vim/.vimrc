" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
" Color
Plug 'sickill/vim-monokai'
Plug 'rakr/vim-one'
" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" ctags
"Plug 'ludovicchabant/vim-gutentags'
" code style
Plug 'bronson/vim-trailing-whitespace'
" Text objects for functions
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'
" ag
Plug 'mileszs/ack.vim'

Plug 'vim-utils/vim-man'
" Plug 'scrooloose/nerdtree'
" Plug 'vim-scripts/fcitx.vim'
Plug 'yianwillis/vimcdoc'

Plug 'tmux-plugins/vim-tmux'

Plug 'wsdjeg/vim-fetch'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'rhysd/vim-clang-format'


" Initialize plugin system
call plug#end()

" ack configuration
let g:ackprg = 'rg --vimgrep'

" gutentags
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_trace = 0
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" color
"set background=dark
colorscheme monokai
"colorscheme desert

" encode
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1

" auto switch to english input
set noimdisable

" auto backto undo file
set undofile

" tab and whitespace
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"number
set number
set relativenumber

" search
set smartcase
set incsearch
set hlsearch
set tags=./.tags;,.tags

" redraw
set ttyfast
set lazyredraw

set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.


" tmp file
set directory=.,$TMP,$TEMP
"set foldmethod=syntax

" key mapping
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
tnoremap <m-q> <c-\><c-n>
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
iabbrev @@ tanekliang@gmail.com

" trailing-whitespace
map <leader><space> :FixWhitespace<cr>

" Filetype related
autocmd BufNewFile,BufRead SConstruct,sconstruct,SConscript,sconscript set ft=python

" clang format
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "AlignConsecutiveMacros": "true",
            \ "DerivePointerAlignment": "false",
            \ "AlignEscapedNewlines": "Right",
            \ "PointerAlignment": "Right",
            \ "AllowShortBlocksOnASingleLine": "Never",
            \ "AllowShortCaseLabelsOnASingleLine": "false",
            \ "AllowShortFunctionsOnASingleLine": "true",
            \ "AllowShortLoopsOnASingleLine": "false",
            \ "IndentPPDirectives": "AfterHash",
            \ "ColumnLimit": 120,
            \ "AlignConsecutiveAssignments": "true",
            \ "BreakBeforeBraces" : "Custom"}

let g:clang_format#style_options.BraceWrapping = {
            \ "AfterClass" : 'false',
            \ "AfterControlStatement" : 'false',
            \ "AfterEnum" : 'false',
            \ "AfterFunction" : 'true',
            \ "AfterNamespace" : 'false',
            \ "AfterObjCDeclaration" : 'false',
            \ "AfterStruct" : 'false',
            \ "AfterUnion" : 'false',
            \ "AfterExternBlock" : 'false',
            \ "BeforeCatch" : 'false',
            \ "BeforeElse" : 'false',
            \ "IndentBraces" : 'false',
            \ "SplitEmptyFunction" : 'false',
            \ "SplitEmptyRecord" : 'false',
            \ "SplitEmptyNamespace" : 'false',
            \ }


" vimwiki configuration
" todo
autocmd! bufwritepost ~/.vimrc source %

