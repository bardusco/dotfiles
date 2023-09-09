" vim: set foldmethod=marker foldlevel=0 nomodeline:
" ============================================================================
" .vimrc of Danilo Bardusco {{{
" ============================================================================
set encoding=utf-8

" relative line numbers
set nu
set rnu

" highlight search patterns
set hlsearch

" Enable true colors
set termguicolors

" update time for Jedi #coc-vim
set updatetime=100
set colorcolumn=79

" virtualenvs for neovim
let g:python3_host_prog = '~/.virtualenvs/neovim3/bin/python3'
let g:python_host_prog = '~/.virtualenvs/neovim2/bin/python2'

" disbale perl provider
let g:loaded_perl_provider = 0

" Define prefix dictionary
let g:which_key_map =  {}
let g:which_local_key_map =  {}

let g:mapleader = "\<Space>"
let g:maplocalleader = '\'

" ============================================================================
" Setting up tab settings {{{
" ============================================================================

set tabstop=4
set shiftwidth=4
set softtabstop=4
set tabpagemax=20
set showtabline=4
set autoindent
set expandtab
set smartindent
set smarttab

" ============================================================================
" }}}
" ============================================================================

" ============================================================================
" Folding {{{
" ============================================================================

set foldmethod=syntax
set foldlevel=99
" Enable folding with the spacebar
"nnoremap <space> za

" ============================================================================
" }}}
" ============================================================================

" ============================================================================
" Cursor Line {{{
" https://vim.fandom.com/wiki/Highlight_current_line
" ============================================================================

set cursorline
hi clear CursorLine
hi CursorLine ctermbg=8
hi CursorLineNr term=bold cterm=bold ctermfg=2 ctermbg=8

let g:which_local_key_map.c = 'toogle-cursor-line'
nnoremap <LocalLeader>c :set cursorline!<CR>

let g:which_local_key_map.l = 'mark-line'
nnoremap <silent> <LocalLeader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

" ============================================================================
" }}}
" ============================================================================

" ============================================================================
" Plugins {{{
" ============================================================================

"Install Plug Pugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

call plug#begin('~/.vim/plugged')
" If you need Vim help for vim-plug itself (e.g. :help plug-options), register vim-plug as a plugin.
Plug 'junegunn/vim-plug'

" remember vim states on exit/load
Plug 'zhimsel/vim-stay'

" statusline
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'

Plug 'petobens/poet-v'

" theme
Plug 'morhetz/gruvbox'

Plug 'cespare/vim-toml'

" fuzzy search
" usage : <C-p> to search files on current directory recursively
" https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } | Plug 'junegunn/fzf.vim' | Plug 'chengzeyi/fzf-preview.vim'

" Align format
" usage :Tab /:
" http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
Plug 'godlygeek/tabular'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'preservim/nerdtree'                          , {'on': 'NERDTreeToggle'}
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight' , {'on': 'NERDTreeToggle'}
    Plug 'Xuyuanp/nerdtree-git-plugin'             , {'on': 'NERDTreeToggle'}
    Plug 'ryanoasis/vim-devicons'                  , {'on': 'NERDTreeToggle'}
    Plug 'airblade/vim-gitgutter'                  , {'on': 'NERDTreeToggle'}

" TODO: fazer o patch da font para melhorar a visualização das barras
Plug 'Yggdroot/indentLine'

Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': ':CocInstall coc-pyright coc-snippets coc-emoji coc-prettier'}
command! -nargs=0 Prettier :CocCommand prettier.formatFile

Plug 'honza/vim-snippets'

Plug 'tpope/vim-fugitive'
 
" Brace live reload web development https://github.com/turbio/bracey.vim
" usage :Bracey starts a new browser window with the content from buffer
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server', 'on': 'Bracey'}

" https://github.com/prettier/vim-prettier
" usage :Prettier or <leader>p 
" Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'branch': 'release/1.x', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html', 'toml'] }
" let g:prettier#autoformat = 1
" #autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" Python folding that works
Plug 'tmhedberg/SimpylFold' 
" desabilitei pq ele estava forçando o foldmethod para manual e não deixando o
" modeline executar aqui nesse arquivo
Plug 'Konfekt/FastFold' 

" Find and replace
Plug 'brooth/far.vim'

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'liuchengxu/vim-which-key'

Plug 'godlygeek/tabular'

Plug 'oelmekki/make-my-code-better.vim'

Plug '0xStabby/chatgpt-vim'

" ChatGPT dependencies
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'MunifTanjim/nui.nvim'

" ChatGPT
Plug 'jackMort/ChatGPT.nvim'

" vim-ai
Plug 'madox2/vim-ai'

" Para detectar virtual env do python e usar os linters corretos
Plug 'dense-analysis/ale'

" Para debugar código python no vim
Plug 'puremourning/vimspector'
Plug 'sagi-z/vimspectorpy', { 'do': { -> vimspectorpy#update() } }

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-pack/nvim-spectre'

" Dart/Flutter
Plug 'dart-lang/dart-vim-plugin'
Plug 'stevearc/dressing.nvim' " optional for vim.ui.select
Plug 'akinsho/flutter-tools.nvim'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Mason package installer
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'psf/black', { 'branch': 'stable' }

"Plug 'ervandew/supertab'
call plug#end()

" ============================================================================
" }}}
" ============================================================================

" ============================================================================
" Plugins configs {{{
" ============================================================================

" ============================================================================
" Gruvbox - theme {{{
" ============================================================================

let g:gruvbox_italic=1
autocmd vimenter * colorscheme gruvbox

" }}}
" ============================================================================

" ============================================================================
" Far - find and replace {{{
" ============================================================================

let g:far#source='rgnvim'
" let g:far#source='rg'
" let g:far#source='vimgrep'
" let g:far#source='ag'

set lazyredraw            " improve scrolling performance when navigating through large results

let g:far#window_width=60
" Use %:p with buffer option only
let g:far#file_mask_favorites=['%:p', '**/*.*', '**/*.js', '**/*.py', '**/*.java', '**/*.css', '**/*.html', '**/*.vim', '**/*.cpp', '**/*.c', '**/*.h', ]
let g:far#window_min_content_width=30
let g:far#enable_undo=1

let g:which_local_key_map.f = {
      \ 'name' : '+find & replace' ,
      \ 'b' : [':Farr --source=vimgrep'    , 'buffer'],
      \ 'p' : [':Farr --source=rgnvim'     , 'project'],
      \ }

" }}}
" ============================================================================

" ============================================================================
" indentLine {{{
" ============================================================================

"let g:indentLine_char = '⎸'
"let g:indentLine_char = '│'
let g:indentLine_char = '┊'
let g:indentLine_setColors = 0
let g:indentLine_color_term = 239
let g:indentLine_bgcolor_term = 202

" }}}
" ============================================================================

" ============================================================================
" Airline {{{
" ============================================================================

"let g:airline_theme='soda'
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
 
let g:airline_powerline_fonts = 1                                                                                                         
let g:airline_section_b = '%{getcwd()}' " in section B of the status line display the CWD                                                 

"Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1 
 
let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline                                            
let g:airline#extensions#tabline#tabs_label = ''       " can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
let g:airline#extensions#tabline#buffers_label = ''    " can put text here like TABS to denote tabs (I clear it so nothing is shown)      
let g:airline#extensions#tabline#fnamemod = ':t'       " disable file paths in the tab                                                    
let g:airline#extensions#tabline#show_tab_count = 0    " dont show tab numbers on the right                                                           
let g:airline#extensions#tabline#show_buffers = 1      " dont show buffers in the tabline                                                 
let g:airline#extensions#tabline#tab_min_count = 2     " minimum of 2 tabs needed to display the tabline                                  
let g:airline#extensions#tabline#show_splits = 1       " disables the buffer name that displays on the right of the tabline               
let g:airline#extensions#tabline#show_tab_nr = 0       " disable tab numbers                                                              
let g:airline#extensions#tabline#show_tab_type = 0     " disables the weird ornage arrow on the tabline
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#poetv#enabled = 1

" }}}
" ============================================================================

" ============================================================================
" Tabularize {{{
" ============================================================================

nmap <LocalLeader>t= :Tabularize /=<CR>
vmap <LocalLeader>t= :Tabularize /=<CR>
nmap <LocalLeader>t: :Tabularize /:\zs<CR>
vmap <LocalLeader>t: :Tabularize /:\zs<CR>
let g:which_local_key_map.t = {
    \ 'name' : '+tabularize',
    \ '=' : [':Tabularize /=<CR>','tabularize on ='],
    \ ':' : [':Tabularize /:\zs<CR>', 'tabularize on :'],
    \ }

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" }}}
" ============================================================================

" ============================================================================
" NERDTree {{{
" ============================================================================

let g:NERDTreeGitStatusUseNerdFonts = 1

" }}}
" ============================================================================

" ============================================================================
" Fast Fold {{{
" ============================================================================

nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
 
let g:markdown_folding = 1
let g:tex_fold_enabled = 1
let g:vimsyn_folding = 'af'
let g:xml_syntax_folding = 1
let g:javaScript_fold = 1
let g:sh_fold_enabled= 7
let g:ruby_fold = 1
let g:perl_fold = 1
let g:python_fold = 1
let g:perl_fold_blocks = 1
let g:r_syntax_folding = 1
let g:rust_fold = 1
let g:php_folding = 1

"}}}
" ============================================================================

" ============================================================================
" Simply Fold {{{
" ============================================================================

let g:SimpylFold_docstring_preview = 1

"}}}
" ============================================================================

" ============================================================================
" Vim stay {{{
" ============================================================================

set viewoptions-=options
set viewoptions=cursor,folds,slash,unix

" }}}
" ============================================================================

" ============================================================================
" Coc-vim {{{ 

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"Comentado por conta da mudança do coc para um custom menu. Validar que a
"linha abaixo está fiuncionando
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>d  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>r  :<C-u>CocListResume<CR>
"
" Configurar coc-pyright
let g:coc_global_extensions = ['coc-pyright']

" END OF COC-VIM
"
" }}}
" ============================================================================

" ============================================================================
" Poet-v - poetry vim {{{
" ============================================================================

let poetv_executables = ['poetry']
let poetv_auto_activate = 0
let poetv_statusline_symbol = ''
let poetv_set_environment = 1

"}}}
" ============================================================================

" ============================================================================
" DART vim {{{
" ============================================================================

let dart_html_in_string=v:true
let g:dart_style_guide = 2
let g:dart_format_on_save = 1

"}}}
" ============================================================================


" ============================================================================
" Which key {{{
" ============================================================================


call which_key#register('<Space>', "g:which_key_map")
call which_key#register('\', "g:which_local_key_map")

nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader>      :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  '\'<CR>
vnoremap <silent> <localleader> :<c-u>WhichKeyVisual  '\'<CR>

" Second level dictionaries:
" 'name' is a special field. It will define the name of the group, e.g., leader-f is the "+file" group.
" Unnamed groups will show a default empty string.

" =======================================================
" Create menus not based on existing mappings:
" =======================================================
" Provide commands(ex-command, <Plug>/<C-W>/<C-d> mapping, etc.)
" and descriptions for the existing mappings.
"
" Note:
" Some complicated ex-cmd may not work as expected since they'll be
" feed into `feedkeys()`, in which case you have to define a decicated
" Command or function wrapper to make it work with vim-which-key.
" Ref issue #126, #133 etc.
let g:which_key_map.b = {
    \ 'name' : '+buffer' ,
    \ '1' : ['b1'        , 'buffer 1']        ,
    \ '2' : ['b2'        , 'buffer 2']        ,
    \ 'd' : ['bd'        , 'delete-buffer']   ,
    \ 'f' : ['bfirst'    , 'first-buffer']    ,
    \ 'h' : ['Startify'  , 'home-buffer']     ,
    \ 'l' : ['blast'     , 'last-buffer']     ,
    \ 'n' : ['bnext'     , 'next-buffer']     ,
    \ 'p' : ['bprevious' , 'previous-buffer'] ,
    \ '?' : ['Buffers'   , 'fzf-buffer']      ,
    \ }

" }}}
" ============================================================================

" ============================================================================
" Open AI {{{
" ============================================================================
let g:open_ai_key = getenv('OPENAI_API_KEY')
" }}}
" ============================================================================
"
" ============================================================================
" Vim Spectre {{{
" ============================================================================


" }}}
" ============================================================================

" ============================================================================
" Ale {{{
" ============================================================================
function! VirtualEnvLinterPath(linter) abort
    let l:venv = expand('$VIRTUAL_ENV')
    if !empty(l:venv)
        let l:executable = l:venv . '/bin/' . a:linter
        if filereadable(l:executable)
            return l:executable
        endif
    endif
    return a:linter
endfunction

let g:ale_python_flake8_executable = VirtualEnvLinterPath('flake8')
let g:ale_python_pylint_executable = VirtualEnvLinterPath('pylint')

nnoremap <silent> <leader>n :ALENext<CR>
nnoremap <silent> <leader>p :ALEPrevious<CR>

" }}}
" ============================================================================

" ============================================================================
" Black {{{
" ============================================================================
let g:black_linelength = 79
" }}}
" ============================================================================

" ============================================================================
" VIM-AI {{{
" ============================================================================
" :AI
" - engine: complete | chat - see how to configure chat engine in the section below
" - options: openai config (see https://platform.openai.com/docs/api-reference/completions)
" - options.request_timeout: request timeout in seconds
" - options.selection_boundary: seleciton prompt wrapper (eliminates empty responses, see #20)
" - ui.paste_mode: use paste mode (see more info in the Notes below)
let g:vim_ai_complete = {
\  "engine": "complete",
\  "options": {
\    "model": "text-davinci-003",
\    "max_tokens": 1000,
\    "temperature": 0.1,
\    "request_timeout": 20,
\    "selection_boundary": "#####",
\  },
\  "ui": {
\    "paste_mode": 1,
\  },
\}
" 
" :AIEdit
" - engine: complete | chat - see how to configure chat engine in the section below
" - options: openai config (see https://platform.openai.com/docs/api-reference/completions)
" - options.request_timeout: request timeout in seconds
" - options.selection_boundary: seleciton prompt wrapper
" - ui.paste_mode: use paste mode (see more info in the Notes below)
let g:vim_ai_edit = {
\  "engine": "complete",
\  "options": {
\    "model": "text-davinci-003",
\    "max_tokens": 1000,
\    "temperature": 0.1,
\    "request_timeout": 20,
\    "selection_boundary": "#####",
\  },
\  "ui": {
\    "paste_mode": 1,
\  },
\}
" 
" This prompt instructs model to work with syntax highlighting
let s:initial_chat_prompt =<< trim END
>>> system

You are a general assistant.
If you attach a code block add syntax type after ``` to enable syntax highlighting.
END

" :AIChat
" - options: openai config (see https://platform.openai.com/docs/api-reference/chat)
" - options.initial_prompt: prompt prepended to every chat request
" - options.request_timeout: request timeout in seconds
" - options.selection_boundary: seleciton prompt wrapper
" - ui.populate_options: put [chat-options] to the chat header
" - ui.open_chat_command: preset (preset_below, preset_tab, preset_right) or a custom command
" - ui.scratch_buffer_keep_open: re-use scratch buffer within the vim session
" - ui.paste_mode: use paste mode (see more info in the Notes below)
let g:vim_ai_chat = {
\  "options": {
\    "model": "gpt-4",
\    "max_tokens": 4000,
\    "temperature": 0.8,
\    "request_timeout": 20,
\    "selection_boundary": "",
\    "initial_prompt": s:initial_chat_prompt,
\  },
\  "ui": {
\    "code_syntax_enabled": 1,
\    "populate_options": 0,
\    "open_chat_command": "preset_below",
\    "scratch_buffer_keep_open": 0,
\    "paste_mode": 1,
\  },
\}

let initial_prompt =<< trim END
>>> system

You are going to play a role of a completion engine with following parameters:
Task: Provide compact code/text completion, generation, transformation or explanation
Topic: general programming and text editing
Style: Plain result without any commentary, unless commentary is necessary
Audience: Users of text editor and programmers that need to transform/generate text
END

let chat_engine_config = {
\  "engine": "chat",
\  "options": {
\    "model": "gpt-3.5-turbo",
\    "max_tokens": 2000,
\    "temperature": 0.7,
\    "request_timeout": 20,
\    "selection_boundary": "",
\    "initial_prompt": initial_prompt,
\  },
\}

" let g:vim_ai_complete = chat_engine_config
" let g:vim_ai_edit = chat_engine_config

" custom command suggesting git commit message, takes no arguments
function! GitCommitMessageFn()
  let l:diff = system('git --no-pager diff --staged')
  let l:prompt = "generate a short commit message from the diff below:\n" . l:diff
  let l:range = 0
  let l:config = {
  \  "engine": "chat",
  \  "options": {
  \    "model": "gpt-3.5-turbo",
  \    "initial_prompt": ">>> system\nyou are a code assistant",
  \    "temperature": 1,
  \  },
  \}
  call vim_ai#AIRun(l:range, l:config, l:prompt)
endfunction
command! GitCommitMessage call GitCommitMessageFn()

" Notes:
" ui.paste_mode
" - if disabled code indentation will work but AI doesn't always respond with a code block
"   therefore it could be messed up
" - find out more in vim's help `:help paste`
" }}}
" ============================================================================
"
" ============================================================================
" VimInspector {{{
" ============================================================================
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspectorpy#launcher = "tmux"
let g:vimspectorpy#tmux#split = "h"
" }}}
" ============================================================================


" }}}
" ============================================================================

" ============================================================================
" Custom mappings {{{
" ============================================================================

map <C-i> :NERDTreeToggle<CR>
map <C-p> :FZF<CR>
map <C-g> :FZFGrep<CR>
nnoremap <S-m> :bnext<CR>
nnoremap <S-n> :bprev<CR>

map j !python -m json.tool<CR>

autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr><C-o>
autocmd FileType python let g:which_key_map.y = 'format yaf'

autocmd FileType toml nnoremap <leader>f :0,$!prettier --parser toml<Cr><C-o>
autocmd FileType toml let g:which_key_map.f = 'format toml'

autocmd VimEnter * AirlineRefresh

" }}}
" ============================================================================

" ============================================================================
" Helper functions {{{
" ============================================================================
"
" helper function to see the output of a command on a new split window
" usage :TabMessage map 
" usage :TabMessage !ls -lah
function! TabMessage(cmd)
  redir => message
  silent execute a:cmd
  redir END
  if empty(message)
    echoerr "no output"
  else
    " use "new" instead of "tabnew" below if you prefer split windows instead of tabs
    new
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
    silent put=message
  endif
endfunction
command! -nargs=+ -complete=command TabMessage call TabMessage(<q-args>)

" }}}
" ============================================================================

" }}}
" ============================================================================


lua <<EOF
-- chat gpt
require("chatgpt").setup({
    keymaps = {
        submit = "<C-s>",
        cycle_windows = "<C-l>"
    }
})

-- mason
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup()

-- flutter-tools
require("flutter-tools").setup {
    widget_guides = {
    enabled = true,
  },
  lsp = {
    color = { -- show the derived colours for dart variables
      enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
      background = false, -- highlight the background
      background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
      foreground = false, -- highlight the foreground
      virtual_text = true, -- show the highlight using virtual text
      virtual_text_str = "■", -- the virtual text character to highlight
    }
  }
}

EOF
