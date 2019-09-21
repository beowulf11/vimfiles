"   _______   ______    _______     
"  |\   __  \|\  ___ \ |\   __  \    
"  \ \  \|\  \ \   __/|\ \  \|\  \   
"   \ \   __  \ \  \_|/_\ \  \\\  \  
"    \ \  \|\  \ \  \_|\ \ \  \\\  \ 
"     \ \_______\ \_______\ \_______\
"      \|_______|\|_______|\|_______|


" Plugins {{{

call plug#begin('~/.local/share/nvim/plugged')
	Plug 'itchyny/lightline.vim' 
	Plug 'scrooloose/nerdtree'
	Plug 'ap/vim-css-color'
	Plug 'scrooloose/nerdcommenter'
	Plug 'morhetz/gruvbox'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-vinegar'
    Plug 'tpope/vim-speeddating'
    Plug 'tpope/vim-eunuch'
	Plug 'tmhedberg/matchit'
	Plug 'sirver/ultisnips'
    Plug 'wellle/targets.vim'
    Plug 'ryanoasis/vim-devicons'    
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'Yggdroot/indentLine'
    Plug 'airblade/vim-gitgutter'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'sheerun/vim-polyglot'
    Plug 'lambdalisue/neovim-prompt'
    Plug 'raimondi/delimitmate'
    Plug 'RRethy/vim-illuminate'
    Plug 'bronson/vim-visual-star-search'
    Plug 'davidhalter/jedi-vim'
    Plug 'ajmwagar/vim-deus'
call plug#end()

"}}}

" Colors {{{

colorscheme deus
set termguicolors
syntax enable
syntax on
filetype plugin indent on

" }}}

" Tabs And Spaces {{{

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" }}}

" File Find {{{

set path+=**,*
set wildmenu
set wildmode=full

" }}}

" UI {{{

let g:gitgutter_sign_added = '|+'
let g:gitgutter_sign_modified = '|~'
let g:gitgutter_sign_removed = '|-'
let g:gitgutter_sign_removed_first_line = '--'
let g:gitgutter_sign_modified_removed = '~-'
set splitbelow
set splitright
set hlsearch
set cursorline
set number
set relativenumber
set fillchars=vert:┃ " for vsplits
set fillchars+=fold:· " for folds
hi VertSplit ctermfg=123

" }}}

" Section Folding {{{

set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax

" }}}

" VIMRC {{{

let mapleader=" "
set noshowmode " Disable --INSERT--
set mouse=a
set encoding=UTF-8
set hidden
set ignorecase
set smartcase
set autoindent
set history=1000
set undodir=~/.vim/undodir
set undofile
set updatetime=300

" }}}

" ENVIROMENT {{{

set shell=/bin/sh
let g:python_host_prog = "/usr/bin/python2"
let g:python3_host_prog = "/usr/bin/python3"

if has('nvim-0.3.2') || has("patch-8.1.0360")
    set diffopt=filler,internal,algorithm:histogram,indent-heuristic " Better git diff diagram
endif

" }}}

" Mappings {{{

cnoremap sudow w !sudo tee % >/dev/null
vnoremap < <gv
vnoremap > >gv
nnoremap Q q:
nnoremap '' ``
nnoremap <silent> <leader>y :tabnew<CR>
nnoremap <leader>o :only<CR>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>ev :sp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>no :nohl<CR>
nnoremap <leader>y :tabnew<cr>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap [q :cprev<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>
nnoremap <leader>n :let @" = expand("%")<CR>
nnoremap <leader>m :mark z<CR>:tabedit %<CR>'z

" }}}

" VIM-DEVICONS {{{

    let g:webdevicons_conceal_nerdtree_brackets = 0
    let g:WebDevIconsUnicodeDecorateFileNodes = 1
    let g:webdevicons_enable_airline_statusline = 1
    let g:webdevicons_enable_airline_tabline = 1
    let g:webdevicons_enable = 1
    let g:webdevicons_enable_nerdtree = 1

" }}}

" LIGHTLINE {{{

let g:lightline = {
  \   'colorscheme': 'deus',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'relativepath', 'modified' ]
  \     ],
  \     'right': [ [ 'lineinfo' ],
  \                [ 'percent' ],
  \                [ 'fileformat' ]
  \     ]
  \   },
  \   'inactive': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'filename', 'modified' ]
  \     ],
  \     'right': [ [ 'lineinfo' ],
  \                [ 'percent' ],
  \                [ 'fileformat' ]
  \     ]
  \   },
  \   'component': {
  \     'lineinfo': ' %3l:%-2v',
  \   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }
let g:lightline.separator = {
    \   'left': '', 'right': ''
  \}
let g:lightline.subseparator = {
    \   'left': '', 'right': ''
  \}

let g:lightline.component = {
\   'lineinfo': '%3l:%-2v'
\}
set laststatus=2

" }}}

" NERDTree {{{

nnoremap <leader>t :NERDTreeToggle<CR>
let g:NERDTreeMinimalUI = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDToggleCheckAllLines = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeHijackNetrw=1

" }}}

" NERDCOMMENTER {{{

inoremap <C-_> <C-o>:call NERDComment(0,"toggle")<C-m>
map <C-_> :call NERDComment(0,"toggle")<C-m>

" }}}

" ULTISNIPS {{{

let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsEditSplit="vertical"

" }}}

" INDENTLINE {{{

let g:indentLine_char = '¦'

" }}}

" FZF {{{

nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR> 
nnoremap <leader>r :Rg<CR>
nnoremap <leader><leader> :Lines <CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

"let g:fzf_buffers_jump = 1 " [Buffers] Jump to the existing window if possible
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

function! OpenFloatingWin()
  let height = &lines - 3
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  "Set the position, size, etc. of the floating window.
  "The size configuration here may not be so flexible, and there's room for further improvement.
  let opts = {
        \ 'relative': 'editor',
        \ 'row': height * 0.3,
        \ 'col': col + 30,
        \ 'width': width * 2 / 3,
        \ 'height': height / 2
        \ }

  let buf = nvim_create_buf(v:false, v:true)
  let win = nvim_open_win(buf, v:true, opts)

  "Set Floating Window Highlighting
  call setwinvar(win, '&winhl', 'Normal:Pmenu')

  setlocal
        \ buftype=nofile
        \ nobuflisted
        \ bufhidden=hide
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
endfunction
let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }

" }}}

" COC {{{

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

command! -nargs=0 Prettier :CocCommand prettier.formatFile
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
nmap <silent> <leader>d <Plug>(coc-definition)
nmap <silent> <leader>cr <Plug>(coc-references)
nmap <silent> <leader>cj <Plug>(coc-implementation)
nmap <silent> <leader>e <Plug>(coc-diagnostic-next)

" }}}

" ILLUMINATE {{{

let g:Illuminate_ftblacklist = ['nerdtree']

" }}}

" vim:foldmethod=marker:foldlevel=0
