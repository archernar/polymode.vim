let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
nnoremap <silent>  <S-Down> :BuffergatorMruCycleNext rightbelow sbuffer
nnoremap <silent>  <S-Right> :BuffergatorMruCycleNext rightbelow vert sbuffer
nnoremap <silent>  <S-Up> :BuffergatorMruCycleNext leftabove sbuffer
nnoremap <silent>  <S-Left> :BuffergatorMruCycleNext leftabove vert sbuffer
nnoremap <silent>  <Down> :BuffergatorMruCyclePrev rightbelow sbuffer
nnoremap <silent>  <Right> :BuffergatorMruCyclePrev rightbelow vert sbuffer
nnoremap <silent>  <Up> :BuffergatorMruCyclePrev leftabove sbuffer
nnoremap <silent>  <Left> :BuffergatorMruCyclePrev leftabove vert sbuffer
nnoremap <silent>  T :BuffergatorTabsClose
nnoremap <silent>  tc :BuffergatorTabsClose
nnoremap <silent>  to :BuffergatorTabsOpen
nnoremap <silent>  t :BuffergatorTabsOpen
nnoremap <silent>  B :BuffergatorClose
nnoremap <silent>  b :BuffergatorOpen
nnoremap  3 $"tp0jw
nnoremap  2 "ep
nnoremap  1 "bP
nnoremap  x $a<br>0j
vnoremap <silent>  <Home> :s/^["] //
nnoremap  w viwa"bi"lel
nnoremap  q :call VimNotesToggle()
nnoremap  h :silent execute "help " . expand("<cWORD>") 
nnoremap  g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " .":copen
nnoremap  m :resize +5
nnoremap  l :resize -5
nnoremap  = :wincmd =
nnoremap  - :wincmd _:wincmd |
nnoremap  ev :split $MYVIMRC
nnoremap  p :PluginUpdate
nnoremap  nt :NERDTreeToggle
nnoremap  ' diwi""hp
nnoremap  ] *
nnoremap <silent>  <F4> :close
nnoremap <silent>  <F3> :wincmd =
nnoremap <silent>  <F2> :wincmd _:wincmd |
nnoremap  <F12> :call SaveAndExecuteGawk()
nnoremap  <F6> :colorscheme pablohi Visual   cterm=reverse
nnoremap <silent> 1 1
nnoremap <silent> 2 2
nnoremap <silent> 3 3
nnoremap <silent> O O
vmap \q c()P
nnoremap <silent> a a
nnoremap <silent> b b
nnoremap <silent> c c
nnoremap <silent> d d
nnoremap <silent> e e
nnoremap <silent> f f
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> gB :BuffergatorMruCycleNext
nnoremap <silent> gb :BuffergatorMruCyclePrev
nnoremap <silent> o o
nnoremap <silent> r r
nnoremap <silent> s s
nnoremap <silent> v v
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
vnoremap <silent> <Home> :s/^/" /gv
vnoremap <PageUp> o^i# ------------------------------------------------------------------#  kll
nnoremap <silent> <Del> <Del>
nnoremap <PageDown> viWo"cPlviW"cp
nnoremap <silent> <PageUp> <PageUp>
nnoremap <silent> <Down> <Down>
nnoremap <silent> <Up> <Up>
nnoremap <silent> <Left> <Left>
nnoremap <silent> <Right> <Right>
nnoremap <Insert> <Nop>
nnoremap <F4> :tabn
nnoremap <F3> :MRU
nnoremap <F2> :bnext:call PolyModeReset()
nnoremap <F1> w:call PolyModeReset()
nnoremap <silent> <End> :call PolyModeReset()
nnoremap <Home> :call PolyMode(-1)
nnoremap <F12> :wa:!build
nnoremap <F9> :set paste!
nnoremap <F8> :UndotreeToggle
nnoremap <silent> <F6> :call Tcmd()
nnoremap <silent> Â :BuffergatorMruCycleNext
nnoremap <silent> â :BuffergatorMruCyclePrev
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set background=dark
set backspace=indent,eol,start
set cmdheight=2
set confirm
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set foldlevelstart=20
set helplang=en
set hidden
set ignorecase
set laststatus=2
set pastetoggle=<F11>
set printoptions=paper:letter
set ruler
set runtimepath=~/.vim,~/.vim/bundle/Vundle.vim,~/.vim/bundle/polymode.vim,~/.vim/bundle/vim-carbon-now-sh,~/.vim/bundle/nerdtree,~/.vim/bundle/Buffergator,~/.vim/bundle/vim-fugitive,~/.vim/bundle/undotree,~/.vim/bundle/papercolor-theme,~/.vim/bundle/github-search.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after,~/.vim/bundle/Vundle.vim,~/.vim/bundle/Vundle.vim/after,~/.vim/bundle/polymode.vim/after,~/.vim/bundle/vim-carbon-now-sh/after,~/.vim/bundle/nerdtree/after,~/.vim/bundle/Buffergator/after,~/.vim/bundle/vim-fugitive/after,~/.vim/bundle/undotree/after,~/.vim/bundle/papercolor-theme/after,~/.vim/bundle/github-search.vim/after,/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set shiftwidth=4
set showcmd
set smartcase
set softtabstop=4
set nostartofline
set statusline=%!pyeval('powerline.new_window()')
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set tabline=%!pyeval('powerline.tabline()')
set notimeout
set ttimeout
set ttimeoutlen=200
set visualbell
set wildmenu
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/scm/polymode.vim/plugin
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 ~/ZERG/x
badd +76 ~/.vimrc
badd +170 polymode.vim
silent! argdel *
edit polymode.vim
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
vnoremap <buffer> <silent> [" :exe "normal! gv"|call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
nnoremap <buffer> <silent> [" :call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
vnoremap <buffer> <silent> [] m':exe "normal! gv"|call search('^\s*endf*\%[unction]\>', "bW")
nnoremap <buffer> <silent> [] m':call search('^\s*endf*\%[unction]\>', "bW")
vnoremap <buffer> <silent> [[ m':exe "normal! gv"|call search('^\s*fu\%[nction]\>', "bW")
nnoremap <buffer> <silent> [[ m':call search('^\s*fu\%[nction]\>', "bW")
vnoremap <buffer> <silent> ]" :exe "normal! gv"|call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
nnoremap <buffer> <silent> ]" :call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
vnoremap <buffer> <silent> ][ m':exe "normal! gv"|call search('^\s*endf*\%[unction]\>', "W")
nnoremap <buffer> <silent> ][ m':call search('^\s*endf*\%[unction]\>', "W")
vnoremap <buffer> <silent> ]] m':exe "normal! gv"|call search('^\s*fu\%[nction]\>', "W")
nnoremap <buffer> <silent> ]] m':call search('^\s*fu\%[nction]\>', "W")
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:\"\ -,mO:\"\ \ ,eO:\"\",:\"
setlocal commentstring=\"%s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'vim'
setlocal filetype=vim
endif
set foldcolumn=3
setlocal foldcolumn=3
setlocal foldenable
setlocal foldexpr=VimFolds()
setlocal foldignore=#
setlocal foldlevel=20
setlocal foldmarker={{{,}}}
set foldmethod=marker
setlocal foldmethod=expr
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=0
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetVimIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,=end,=else,=cat,=fina,=END,0\\
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,#
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=4
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%!pyeval('powerline.statusline(1)')
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != ''
setlocal syntax=
endif
setlocal tabstop=8
setlocal tags=
setlocal textwidth=78
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
let s:l = 171 - ((0 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
171
normal! 011|
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
