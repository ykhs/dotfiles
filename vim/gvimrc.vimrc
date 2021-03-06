scriptencoding utf-8

let $LANG='ja'
set noerrorbells
set novisualbell
set visualbell t_vb=
set guioptions-=m
set guioptions-=T
set background=dark

" Font
" ==============================================================================
set linespace=1
if has('win32')
    set guifont=DejaVu_Sans_Mono:h10
    set guifontwide=Migu_1M_regular:h10:cSHIFTJIS
    set linespace=1
elseif has('mac')
    set guifont=Menlo:h14
    set linespace=4
elseif has('xfontset')
    set guifontset=a14,r14,k14
    set linespace=0
else
    set guifont=DejaVu\ Sans\ Mono\ 10
endif
