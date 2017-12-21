set encoding=utf-8
scriptencoding utf-8

let g:mapleader = ','

augroup vimrc
  autocmd!
augroup END

set shortmess+=I
set nowritebackup
set nobackup
set noswapfile
set undofile
set undodir=$HOME/.vim_undo
set hidden

filetype plugin indent on
syntax on

" ColorScheme
" ==============================================================================
let g:hybrid_custom_term_colors = 1
colorscheme hybrid
set t_Co=256

" Encoding
" ==============================================================================
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp,ucs-2,latin1
set termencoding=utf-8

" Edit
" ==============================================================================
set backspace=indent,eol,start
set clipboard+=unnamed
set history=50
set nrformats-=octal
set timeoutlen=3500
set formatoptions+=mM
set virtualedit=block
set whichwrap=b,s,h,l,<,>,[,],~
if exists('&ambiwidth')
  set ambiwidth=double
endif
set wildmenu

" make したら :copen
autocmd vimrc QuickfixCmdPost make copen

" insertモードを抜けるとIMEオフ
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline
inoremap :set iminsert=0
" Indent
" -----------------------------------------------------------------------------
set expandtab
set cindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
let g:vim_indent_cont=0

" View
" ==============================================================================
set number
set title
set cmdheight=2
set laststatus=2
set showcmd
set ruler
set display=lastline
set noequalalways
set shellslash
set list
set listchars=tab:^\ ,trail:~
set showmatch
set synmaxcol=200
set cursorline
set lazyredraw

" 対応する括弧の強調
set matchtime=1
let g:loaded_matchparen = 1

set showtabline=2

set statusline=%t\ %m%r%h%w[%Y][%{&fenc}][%{&ff}]%=%11p%%\ %l,%c

" Search
" ==============================================================================
set hlsearch
set ignorecase
set smartcase
set incsearch
set wrapscan

" 検索結果が中央に来るように
nnoremap n nzzzv
nnoremap N Nzzzv

autocmd vimrc BufEnter * silent! lcd %:p:h

" grep周り
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :<C-u>cfirst<CR>
nnoremap ]Q :<C-u>clast<CR>

" Common Keymap
" ==============================================================================
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>

noremap ; :
noremap : ;

nnoremap <F5> :source %<CR>
nnoremap ZZ <Nop>

nnoremap j gj
nnoremap k gk

nnoremap <silent> <ESC><ESC> :nohl<CR>

" Plugin
" ==============================================================================

" kwbd
" ------------------------------------------------------------------------------
nnoremap <C-q><C-q> :Kwbd<CR>

" indent-guides
" ------------------------------------------------------------------------------
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

" over.vim
" ------------------------------------------------------------------------------
nnoremap <silent> <Leader>o <C-u>:OverCommandLine<CR>%s/

" sneak.vim
" ------------------------------------------------------------------------------
nmap <enter> <Plug>SneakNext
xmap <enter> <Plug>SneakNext
nmap <bs>    <Plug>SneakPrevious
xmap <bs>    <Plug>SneakPrevious

" WordCount
" ------------------------------------------------------------------------------
set statusline+=[wc:%{WordCount()}]
set updatetime=500

" CtrlP
" ------------------------------------------------------------------------------
let g:ctrlp_map = '<Nop>'
"nnoremap <LeaderGstatus>p :<C-u>CGstatusGstatustrlPMixed<CR>
noremap <C-p><C-p> :<C-u>CtrlP<CR>
noremap <C-p><C-b> :<C-u>CtrlPBuffer<CR>
noremap <C-p><C-m> :<C-u>CtrlPMRUFiles<CR>
noremap <C-p><C-l> :<C-u>CtrlPLine<CR>
noremap <C-p><C-g> :<C-u>CtrlPGhq<CR>

" Open new file in current window
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_extensions = ['line', 'mixed']
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:18'

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$|node_modules|vendor\/bundle'

" ctrlp-ghqでディレクトリを直接開けるように
let ctrlp_ghq_default_action = 'e'

" caw.vim
" ------------------------------------------------------------------------------
nmap <Leader>c <Plug>(caw:hatpos:toggle)
vmap <Leader>c <Plug>(caw:hatpos:toggle)

" Simple-Javascript-Indenter
" ------------------------------------------------------------------------------
let g:SimpleJsIndenter_BriefMode = 2
let g:SimpleJsIndenter_CaseIndentLevel = -1

" easy-align
" ------------------------------------------------------------------------------
vmap <Enter> <Plug>(EasyAlign)

" 外部設定ファイル
" ==============================================================================
" vimrc.local が存在していれば読み込む
if filereadable(expand('$HOME/.vim/vimrc.local'))
  source ~/.vim/vimrc.local
endif
