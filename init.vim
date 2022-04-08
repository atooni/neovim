" -----------------------------------------------------------------------------
" The general VIM settings 
" -----------------------------------------------------------------------------
set number                "show line numbers
" set relativenumber        "use relative line numbers 
set hidden
set nobackup              "do not create backup files
set nowritebackup         "do not create backups before overwriting a file 
set showmatch             "show matching brackets
set ignorecase            "ignorecase when searching 
set hlsearch              "highlight search results 
set incsearch             "incremental search while typing the regex

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set copyindent

" You will have a bad experience with diagnostic messages with the default 4000.
set updatetime=300

" Don't give |ins-completion-menu| messages.
set shortmess+=c

" Always show signcolumns
set signcolumn=yes

" Remap the leader to the comma
let mapleader=","

" Define a command that opens a Terminal in the current window
:command Bash terminal bash

" -----------------------------------------------------------------------------
" All the plugins that are currently in use 
" -----------------------------------------------------------------------------
call plug#begin('~/.nvim/plugged')
  Plug 'tpope/vim-fugitive'
  Plug 'ryanoasis/vim-devicons'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'fannheyward/telescope-coc.nvim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ajmwagar/vim-deus'
  Plug 'rafi/awesome-vim-colorschemes'
  Plug 'romainl/Apprentice'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'}
call plug#end()

" We can load the colorscheme only after we have loaded all the color schemes
colorscheme materialbox

" -----------------------------------------------------------------------------
" All they custom key mappings
" -----------------------------------------------------------------------------
nnoremap <S-Up> :resize +2<cr>
nnoremap <S-Down> :resize -2<cr>
nnoremap <S-Right> :vertical resize +2<cr>
nnoremap <S-Left> :vertical resize -2<cr>

" Easier navigation in vi windows
nnoremap <M-Right> <C-w><Right>
nnoremap <M-Left>  <C-w><Left>
nnoremap <M-Down>  <C-w><Down>
nnoremap <M-Up>    <C-w><Up>

inoremap <M-Right> <ESC><C-w><Right>
inoremap <M-Left>  <ESC><C-w><Left>
inoremap <M-Down>  <ESC><C-w><Down>
inoremap <M-Up>    <ESC><C-w><Up>

vnoremap <M-Right> <ESC><C-w><Right>
vnoremap <M-Left>  <ESC><C-w><Left>
vnoremap <M-Down>  <ESC><C-w><Down>
vnoremap <M-Up>    <ESC><C-w><Up>

" Some mappings for terminal mode 
tnoremap <ESC> <C-\><C-n>
 
tnoremap <M-Right> <C-\><C-n><C-w><Right>
tnoremap <M-Left>  <C-\><C-n><C-w><Left>
tnoremap <M-Down>  <C-\><C-n><C-w><Down>
tnoremap <M-Up>    <C-\><C-n><C-w><Up>

" -----------------------------------------------------------------------------
" Settings related to the file explorer
" -----------------------------------------------------------------------------
nmap <leader>e :CocCommand explorer<cr>

" -----------------------------------------------------------------------------
" All the relevant coc settings
" -----------------------------------------------------------------------------
" You will have a bad experience with diagnostic messages with the default 4000.
set updatetime=300

" Don't give |ins-completion-menu| messages.
set shortmess+=c

" Always show signcolumns
set signcolumn=yes


" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Used in the tab autocompletion for coc
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to either doHover or show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType scala setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of current line
xmap <leader>a  <Plug>(coc-codeaction-line)
nmap <leader>a  <Plug>(coc-codeaction-line)

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Trigger for code actions
" Make sure `"codeLens.enable": true` is set in your coc config
nnoremap <leader>cl :<C-u>call CocActionAsync('codeLensAction')<CR>

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Notify coc.nvim that <enter> has been pressed.
" Currently used for the formatOnType feature.
nnoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" -----------------------------------------------------------------------------
" Key bindings special to Scala metals 
" -----------------------------------------------------------------------------
" Help Vim recognize *.sbt and *.sc as Scala files
au BufRead,BufNewFile *.sbt,*.sc set filetype=scala

" Used to expand decorations in worksheets
nmap <Leader>ws <Plug>(coc-metals-expand-decoration)

" Toggle panel with Tree Views
nnoremap <silent> <space>t :<C-u>CocCommand metals.tvp<CR>
" Toggle Tree View 'metalsPackages'
nnoremap <silent> <space>tp :<C-u>CocCommand metals.tvp metalsPackages<CR>
" Toggle Tree View 'metalsCompile'
nnoremap <silent> <space>tc :<C-u>CocCommand metals.tvp metalsCompile<CR>
" Toggle Tree View 'metalsBuild'
nnoremap <silent> <space>tb :<C-u>CocCommand metals.tvp metalsBuild<CR>
" Reveal current current class (trait or object) in Tree View 'metalsPackages'
nnoremap <silent> <space>tf :<C-u>CocCommand metals.revealInTreeView metalsPackages<CR>

" nnoremap <silent> <C-m>i :<C-u>CocCommand metals.build-import<CR>

