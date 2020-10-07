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

" virtualenvs for neovim
let g:python3_host_prog = '~/.virtualenvs/neovim3/bin/python3'
let g:python_host_prog = '~/.virtualenvs/neovim2/bin/python2'

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
nnoremap <space> za

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
nnoremap <Leader>c :set cursorline!<CR>
nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

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

Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': ':CocInstall coc-python coc-snippets'}

Plug 'honza/vim-snippets'

Plug 'tpope/vim-fugitive'
 
" Brace live reload web development https://github.com/turbio/bracey.vim
" usage :Bracey starts a new browser window with the content from buffer
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server', 'on': 'Bracey'}

" https://github.com/prettier/vim-prettier
" usage :Prettier or <leader>p 
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'branch': 'release/1.x', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

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
"
let g:far#enable_undo=1
set lazyredraw            " improve scrolling performance when navigating through large results
set regexpengine=1        " use old regexp engine
set ignorecase smartcase  " ignore case only when the pattern contains no capital letters

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

" }}}
" ============================================================================

" ============================================================================
" Tabularize {{{
" ============================================================================

if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:\zs<CR>
    vmap <Leader>a: :Tabularize /:\zs<CR>
endif

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
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
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
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
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
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" END OF COC-VIM
"
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

map j !python -m json.tool

autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr><C-o>
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


