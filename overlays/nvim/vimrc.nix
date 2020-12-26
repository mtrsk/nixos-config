pkgs: ''
"*****************************************************************************
" Basic Setup
"*****************************************************************************
" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast

" Tabs
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

" Indentation
set autoindent

" Enable Hidden Buffers
set hidden

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Fix Backspace
" http://vim.wikia.com/wiki/Backspace_and_delete_problems
set backspace=indent,eol,start

"" Directories For SWP Files
set nobackup
set noswapfile

" Clipboard

set clipboard=unnamedplus

"*****************************************************************************
" Visual Settings
"*****************************************************************************

syntax on
set ruler
set colorcolumn=80
" With both number && relative number
" vim will use relativenumber for all
" lines except the current one
set number
set relativenumber

" Status Bar
set laststatus=2

"*****************************************************************************
"" Mappings
"*****************************************************************************

inoremap jj <Esc>

" Disable Arrow keys

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>

" Tabs
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>

nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>

" Terminal Mode
tnoremap <Esc> <C-\><C-n>

" Splits

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"*****************************************************************************
" Neomake
"*****************************************************************************

"call neomake#configure#automake('w')
"
"let g:neomake_open_list = 2

"*****************************************************************************
" NERDTree
"*****************************************************************************

" NERDTree mappings
nmap <leader>nt :NERDTreeToggle<CR>
nmap <leader>nf :NERDTreeFind<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"*****************************************************************************
" Deoplete
"*****************************************************************************

" Use deoplete.
let g:deoplete#enable_at_startup = 1

"*****************************************************************************
" ALE
"*****************************************************************************
" help
" ale-integration-rust

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {
\   'javascript': ['standard', 'flow'],
\   'haskell': ['hlint', 'ghc'],
\   'latex': ['chktex', 'lacheck'],
\}

let g:ale_haskell_ghc_options = '-fno-code -v0 -isrc'

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

let g:ale_fixers = {
\   'javascript': ['standard'],
\   'haskell': ['hindent', 'stylish-haskell'],
\   'python': ['isort'],
\   'rust': ['rustfmt'],
\}

"*****************************************************************************
" Language Server Protocol Config.
"*****************************************************************************

let g:LanguageClient_serverCommands = {
\ 'c': ['ccls', '--log-file=/tmp/cc.log'],
\ 'cpp': ['ccls', '--log-file=/tmp/cc.log'],
\ 'cuda': ['ccls', '--log-file=/tmp/cc.log'],
\ 'objc': ['ccls', '--log-file=/tmp/cc.log'],
\ 'haskell' : ['hie-wrapper'],
\ 'python': ['pyls'],
\ 'rust': ['rls'],
\ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> gh :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient_textDocument_references()<CR>
nnoremap <silent> gs :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<CR>

let g:LanguageClient_autoStart = 0

"*****************************************************************************
" Assembly
"*****************************************************************************

au BufRead,BufNewFile *.asm set filetype=nasm

"*****************************************************************************
" Haskell
"*****************************************************************************

" haskell-vim settings
let g:haskell_classic_highlighting = 1
let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2
let g:haskell_indent_case_alternative = 1
let g:cabal_indent_section = 2

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" Hindent
" let g:hindent_on_save = 0

" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0

" Intero
let g:intero_backend = {
\ 'command': 'ghci',
\ 'cwd': expand('%:p:h'),
\}

"*****************************************************************************
" LaTeX
"*****************************************************************************


"*****************************************************************************
" Markdown
"*****************************************************************************

let g:vim_markdown_folding_disabled = 1

"*****************************************************************************
" Rust
"*****************************************************************************

"*****************************************************************************
" Pywal
"*****************************************************************************

colorscheme wal

"*****************************************************************************
"" Vim-Airline
"*****************************************************************************

let g:airline_powerline_fonts = 1

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif
''
