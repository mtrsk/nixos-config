"*****************************************************************************
" Deoplete
"*****************************************************************************

" Use deoplete.
let g:deoplete#enable_at_startup = 1

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
\ 'nix': ['rnix-lsp'],
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

" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0

" Intero
let g:intero_backend = {
\ 'command': 'ghci',
\ 'cwd': expand('%:p:h'),
\}

"*****************************************************************************
" Markdown
"*****************************************************************************

let g:vim_markdown_folding_disabled = 1

"*****************************************************************************
" Terraform
"*****************************************************************************

let g:terraform_fmt_on_save=1
let g:terraform_align=1
