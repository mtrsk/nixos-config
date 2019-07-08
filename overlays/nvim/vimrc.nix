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

" Clipboard

" noremap <Leader>y "*y
" noremap <Leader>p "*p
" noremap <Leader>Y "+y
" noremap <Leader>P "+p

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
nnoremap <silent> <C-t> :NERDTreeToggle<CR>

let NERDTreeShowHidden=1

"*****************************************************************************
" ALE
"*****************************************************************************

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

let g:ale_fixers = {
\   'javascript': ['standard'],
\   'haskell': ['stylish-haskell'],
\   'latex': ['chktex', 'lacheck'],
\}

"*****************************************************************************
" Language Server Protocol Config.
"*****************************************************************************

let g:LanguageClient_serverCommands = {
  \ 'haskell' : ['hie-wrapper'],
  \ 'python': ['pyls'],
  \ }

let g:LanguageClient_autoStart = 0

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
map <Leader>lk :call LanguageClient#textDocument_hover()<CR>
map <Leader>lg :call LanguageClient#textDocument_definition()<CR>
map <Leader>lr :call LanguageClient#textDocument_rename()<CR>
map <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
map <Leader>lb :call LanguageClient#textDocument_references()<CR>
map <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
map <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>

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

" Hindent
let g:hindent_on_save = 1

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

let g:vimtex_view_method="zathura"
let g:vimtex_indent_on_ampersands=0
let g:vimtex_indent_on_ampersands=0
let g:vimtex_quickfix_open_on_warning=0
let latexmk_options = '-pdf -verbose -file-line-error -synctex=1 -interaction=nonstopmode'
command! LatexShellescape let g:vimtex_latexmk_options = latexmk_options . ' -shell-escape'
command! LatexShellescapeOff let g:vimtex_latexmk_options = latexmk_options
" Ignore spelling inside tabular {}
fun! TexNoSpell()
  syntax region texNoSpell
    \ start="\\thref{"rs=s
    \ end="}\|%stopzone\>"re=e
    \ contains=@NoSpell,texStatement,texHperref
  syntax region texNoSpell
    \ start="\\coordinate"rs=s
    \ end=")\|%stopzone\>"re=e
    \ contains=@NoSpell,texStatement
  syntax region texNoSpell
    \ start="\\begin{tabular}{"rs=s
    \ end="}\|%stopzone\>"re=e
    \ contains=@NoSpell,texBeginEnd
  syntax match texTikzParen /(.\+)/ contained contains=@NoSpell transparent
  syntax region texTikz
    \ start="\\begin{tikzpicture}"rs=s
    \ end="\\end{tikzpicture}\|%stopzone\>"re=e
    \ keepend
    \ transparent
    \ contains=texStyle,@texPreambleMatchGroup,texTikzParen
  syntax region texNoSpellBrace
    \ start="\\begin{tikzpicture}{"rs=s
    \ end="}\|%stopzone\>"re=e
  syntax match texStatement '\\setcounter' nextgroup=texNoSpellBraces
  syntax match texStatement '\\newcounter' nextgroup=texNoSpellBraces
  syntax match texStatement '\\value' nextgroup=texNoSpellBraces
  syntax region texNoSpellBraces matchgroup=Delimiter start='{' end='}' contained contains=@NoSpell
endfun
autocmd BufRead,BufNewFile *.tex :call TexNoSpell()

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
