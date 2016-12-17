set encoding=utf-8
scriptencoding utf-8

let g:mapleader = ','

augroup vimrc
  autocmd!
augroup END

" dein.vim
" ==============================================================================
filetype off
set runtimepath+=$HOME/.vim/dein.vim

call dein#begin(expand('$HOME/.vim/bundle'))

call dein#add('Shougo/unite.vim')
call dein#add('Shougo/unite-outline', {
\   'depends': ['Shougo/unite.vim']
\ })
call dein#add('sorah/unite-ghq', {
\   'depends': ['Shougo/unite.vim']
\ })
call dein#add('Shougo/vimfiler', {
\   'depends': ['Shougo/unite.vim']
\ })
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/neomru.vim', {
\   'depends': ['Shougo/unite.vim']
\ })
call dein#add('Shougo/vimshell')
call dein#add('Shougo/vimproc', {
\   'build': 'make'
\ })
call dein#add('tsaleh/vim-align')
call dein#add('tpope/vim-surround')
call dein#add('rgarver/Kwbd.vim')
call dein#add('tyru/caw.vim')
call dein#add('vim-scripts/sudo.vim')
call dein#add('fuenor/qfixgrep.git')
call dein#add('kien/ctrlp.vim')
call dein#add('mattn/ctrlp-ghq')
call dein#add('nathanaelkane/vim-indent-guides.git')
call dein#add('thinca/vim-fontzoom')
call dein#add('fuenor/vim-wordcount')
call dein#add('rhysd/clever-f.vim')
call dein#add('justinmk/vim-sneak')
call dein#add('osyo-manga/vim-over')

" HTML
call dein#add('othree/html5.vim')
call dein#add('nono/vim-handlebars')
call dein#add('digitaltoad/vim-jade')

" CSS
call dein#add('wavded/vim-stylus')

" JavaScript
call dein#add('othree/yajs.vim')
call dein#add('mxw/vim-jsx')
call dein#add('isRuslan/vim-es6')

" Ruby
call dein#add('ruby.vim')

" Markdown
call dein#add('tpope/vim-markdown')

" Haskell
call dein#add('kana/vim-filetype-haskell')
call dein#add('eagletmt/neco-ghc')
call dein#add('dag/vim2hs')

" ColorScheme
call dein#add('w0ng/vim-hybrid')

call dein#end()

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

set shortmess+=I
set nowritebackup
set nobackup
set noswapfile
set undofile
set undodir=$HOME/.vim_undo
set hidden

" ColorScheme
" ==============================================================================
let g:hybrid_use_Xresources = 1
set background=dark
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
syntax on
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

" unite.vim
" ------------------------------------------------------------------------------
function! s:unite_my_settings()
  imap <buffer> jj <Plug>(unite_insert_leave)
  nmap <buffer> <Esc> <Plug>(unite_exit)
  imap <buffer> <Esc> <Plug>(unite_exit)
  imap <buffer> <C-j> <Plug>(unite_exit)
  imap <buffer> <C-o> <Plug>(unite_insert_leave):<C-u>call unite#mappings#do_action('above')<CR>
endfunction

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1

" 大文字を入力したらignore_caseを無効にする
let g:unite_enable_smart_case = 1

" バッファ一覧
nnoremap <Leader>ub :<C-u>Unite -start-insert buffer<CR>

" 行一覧
nnoremap <Leader>ul :<C-u>Unite -no-start-insert line<CR>

" アウトライン一覧
nnoremap <Leader>uo :<C-u>Unite -no-start-insert outline<CR>

" ファイル一覧
nnoremap <Leader>uf :<C-u>UniteWithBufferDir -no-start-insert file<CR>

" 履歴一覧
nnoremap <Leader>um :<C-u>Unite -start-insert file_mru<CR>

" バッファ一覧
nnoremap <Leader>ug :<C-u>Unite -start-insert ghq<CR>

" neocomplete
" ------------------------------------------------------------------------------
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Enable omni completion.
autocmd vimrc FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd vimrc FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd vimrc FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd vimrc FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd vimrc FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" neosnippet
" ------------------------------------------------------------------------------
let g:neosnippet#snippets_directory= expand('$HOME/.vim/snippets')
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

" kwbd
" ------------------------------------------------------------------------------
nnoremap <C-q><C-q> :Kwbd<CR>

" Align
" ------------------------------------------------------------------------------
let g:Align_xstrlen=3

" VimFiler
" ------------------------------------------------------------------------------
let g:vimfiler_as_default_explorer = 1
noremap <C-\> :VimFilerCurrentDir -split -simple -winwidth=45 -no-quit<ENTER>
autocmd vimrc FileType vimfiler nmap <buffer> <CR> <Plug>(vimfiler_expand_or_edit)
"nnoremap <C-\> :<C-u>VimFilerBufferDir<CR>
"セーフモードを無効にした状態で起動する
let g:vimfiler_safe_mode_by_default = 0

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

" caw.vim
" ------------------------------------------------------------------------------
nmap <Leader>c <Plug>(caw:hatpos:toggle)
vmap <Leader>c <Plug>(caw:hatpos:toggle)

" Simple-Javascript-Indenter
" ------------------------------------------------------------------------------
let g:SimpleJsIndenter_BriefMode = 2
let g:SimpleJsIndenter_CaseIndentLevel = -1

" 外部設定ファイル
" ==============================================================================
" vimrc.local が存在していれば読み込む
if filereadable(expand('$HOME/.vim/vimrc.local'))
  source ~/.vim/vimrc.local
endif