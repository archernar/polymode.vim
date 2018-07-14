" README.md Start
" Commands                        Mode
" --------                        ----
" nmap, nnoremap, nunmap          Normal mode
" imap, inoremap, iunmap          Insert and Replace mode
" vmap, vnoremap, vunmap          Visual and Select mode
" xmap, xnoremap, xunmap          Visual mode
" smap, snoremap, sunmap          Select mode
" cmap, cnoremap, cunmap          Command-line mode
" omap, onoremap, ounmap          Operator pending mode
" http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)
" README.md End
" 
" 
let s:polyeditmode = 0 
let s:polyenabled = -1 
let s:fbar = "" 
let s:gfbar0 = "<F2> Next Window, <F3> Next Buffer, <F4> New ShellScript, <F5> Python, <F6> Command, <F7> MRU, <F8> UndoTree, <F9> PasteMode"
let s:gfbar1 = "OHHHH"
let s:fbarct = -1 
let s:poly2 = 0

function! PolyModeVersion()
     echo "PolyMode Version 1.0"
endfunction

function! SetRegistersBE()
      let szIn = input('Set Prefix (@b): ')
      let @b = szIn
      let szIn = input('Set Suffix (@e): ')
      let @e = szIn
      echo "\r"
      echo ""
      echo "@b is \"".@b."\", @e is \"".@e."\""
endfunction
function! OpenNotes()
     execute "botright split /home/mestes/.vimnotes"
     let @x = join(readfile("/home/mestes/.vimnotes","\n"))
     call PolyModeReset()
endfunction
function! PolyModeSourceVimrc()
          let s:polyenabled = 0
          source $MYVIMRC
          call PolyModeReset()
          return s:polyenabled 
endfunction


function! KeyReset(...)
     let s:fbarct = s:fbarct + 1
     if   s:fbarct == 0  
          let s:fbar = g:help0
     endif
     if   s:fbarct == 1  
          let s:fbar = g:help0
     endif
     if   s:fbarct == 2  
          let s:fbar = g:help0
          let s:fbarct = -1
     endif
          let l:local = ""
          if a:0 > 0 
               let l:szTemp = a:1
               if a:0 > 1 
                    let l:szTemp = a:1 . "  (" . a:2 . ") "
               endif
               if  s:polyeditmode == 1
                    let l:szTemp = a:1 . " (edit mode)" 
               endif
               let l:local = l:szTemp
          endif
          let s:nnn = (&columns - ( len(s:fbar) + len(l:local) )) -3
          if s:nnn < 0
               let s:nnn = 0
          endif
          if a:0 > 0 
               echo l:local.repeat(' ', s:nnn).s:fbar
          endif
            call  PolyModeMapReset()
"           nnoremap <silent> r r
"           nnoremap <silent> <Insert>   <Nop>
"           nnoremap <silent> <Right>    <right>
"           nnoremap <silent> <Left>     <left>
"           nnoremap <silent> <Up>       <up>
"           nnoremap <silent> <Down>     <down>
"           nnoremap <silent> <PageUp>   <pageup>
"           nnoremap <silent> <PageDown> <pagedown>
"           nnoremap <silent> <Delete>   <delete>
"           nnoremap <silent> <End>  :call PolyModeReset()<cr>
          return s:polyenabled 
endfunction
function! PolyModeNERDTreeToggle()
          let s:polyenabled = -1
          NERDTreeToggle
          call PolyModeReset()
          return s:polyenabled 
endfunction
function! SetHLSearchOn()
     set hlsearch
     echo "HL On"
endfunction
function! SetHLSearchOff()
     set nohlsearch
     echo "HL Off"
endfunction
function! PolyModeEditToggle()
          if s:polyeditmode == 0 
               let s:polyeditmode = 1 
          else 
               let s:polyeditmode = 0 
          endif
          echom s:polyeditmode 
endfunction
function! RQ()
          call PolyModeResetQuiet()
          return s:polyenabled 
endfunction
function! PolyModeResetQuiet()
          let s:polyenabled = -1
          call KeyReset("")
          execute "ccl"
          return s:polyenabled 
endfunction
function! PolyModeReset()
          let s:polyenabled = -1
          call KeyReset("Polymode Off (keys reset)")
          execute "ccl"
          return s:polyenabled 
endfunction

function! PolyModeSet(...)
     let s:polyenabled = a:1 
     call PolyMode(0)
endfunction

function! PromptAndEdit()
     let szIn = input('Edit File>> ')
     execute "edit ". szIn
     let s:polyenabled = -1
     call PolyModeMapReset()
endfunction

function! PolyModeNull()
endfunction

let s:regicycle = 0
function! RegiMode()
     let s:regicycle = s:regicycle + 1
     if s:regicycle == 1 
         echo "\"\""
         let @c="\""
         let @d="\""
     endif
     if s:regicycle == 2 
         echo "()"
         let @c="("
         let @d=")"
         let s:regicycle = 0
     endif
endfunction


function! PolyMode(direction)
     if a:direction == -1
          let s:polyenabled = s:polyenabled + 1
     endif
     if a:direction == -2
          let s:polyenabled = s:polyenabled - 1
     endif
     if a:direction > 0 
          let s:polyenabled = a:direction
     endif
     if s:polyenabled < 0 
          let s:polyenabled = 21 
     endif
     if s:polyenabled == 14 
          let s:polyenabled = 9 
     endif
     if s:polyenabled == 0 
          call KeyReset("Polymode On (End to exit)", "r v s e b n 3 a p")
           nnoremap <silent> p :call PolyModeResetQuiet()<cr> :call Greppyon(1)<cr>
           nnoremap <silent> a :call PolyModeResetQuiet()<cr> :call Greppyon(1)<cr>
           nnoremap <silent> 3 :call PolyModeResetQuiet()<cr>:set relativenumber!<cr>
           nnoremap <silent> n :call PolyModeResetQuiet()<cr>:NERDTreeToggle<cr>
           nnoremap <silent> b :call PolyModeResetQuiet()<cr>:BuffergatorToggle<cr>
           nnoremap <silent> r <C-w>r:call PolyModeReset()<cr>
           nnoremap <silent> v :vnew<cr>:call PolyModeReset()<cr>
           nnoremap <silent> s :new<cr>:call PolyModeReset()<cr>
           nnoremap <silent> e <C-w>v<C-w>w:call PromptAndEdit()<cr>
           nnoremap <silent> <Insert> :call PolyMode(-2)<cr>
           nnoremap <silent> <PageUp>   :call OpenInTempBuffer("~/.vimnotes")<cr>:normal zR<cr>:resize +15<cr>
           nnoremap <silent> <PageDown> :call RegiMode()<cr>:call PolyModeResetQuiet()<cr>
          return s:polyenabled 
     endif
     if s:polyenabled == 1 
          call KeyReset("Split & Close Mode")
          nnoremap <silent> <Insert> :call PolyMode(-2)<cr>
          nnoremap <silent> <PageUp>   <C-w>s<C-w>w:call PromptAndEdit()<cr>
          nnoremap <silent> <PageDown> <C-w>v<C-w>w:call PromptAndEdit()<cr>
          nnoremap <silent> <leader><PageUp>  :close<cr>:call PolyModeReset()<cr>
          nnoremap <silent> <leader><PageDown>  :close<cr>:call PolyModeReset()<cr>
          nnoremap <silent> <Delete>  :close<cr>:call PolyModeNull()<cr>
          return s:polyenabled 
     endif
     if s:polyenabled == 2 
          call KeyReset("Edit & Close Mode")
          nnoremap <silent> <Insert> :call PolyMode(-2)<cr>
          nnoremap <PageUp> :call PromptAndEdit()<cr>
          nnoremap <silent> <leader><PageUp>  :close<cr>:call PolyModeReset()<cr>
          nnoremap <silent> <leader><PageDown>  :close<cr>:call PolyModeReset()<cr>
          nnoremap <silent> <Delete>  :close<cr>:call PolyModeNull()<cr>
          return s:polyenabled 
     endif
     if s:polyenabled == 3 
          call KeyReset("Enhanced Zoom")
          nnoremap <silent> <Insert> :call PolyMode(-2)<cr>
          nnoremap <silent> <PageUp> :wincmd _<cr>:wincmd \|<cr>:call PolyModeReset()<cr>
          nnoremap <silent> <PageDown> :wincmd =<cr>:call PolyModeReset()<cr>
          if 3 == 4
                  nnoremap <silent> <Insert> :wincmd =<cr>:call PolyModeReset()<cr>
          endif
          nnoremap <silent> <Right> :wincmd _<cr>:wincmd \|<cr>:call PolyModeReset()<cr>
          nnoremap <silent> <Left>  :wincmd =<cr>:call PolyModeReset()<cr>
          nnoremap <silent> <Up>    :wincmd _<cr>:wincmd \|<cr>:call PolyModeReset()<cr>
          nnoremap <silent> <Down>  :wincmd =<cr>:call PolyModeReset()<cr>
          return s:polyenabled 
     endif
     if s:polyenabled == 4 
          call KeyReset("Toggle Folds")
          nnoremap <silent> <Insert>   :call PolyMode(-2)<cr>
          nnoremap <silent> <PageUp>   zi:call PolyModeReset()<cr>
          nnoremap <silent> <PageDown> zi:call PolyModeReset()<cr>
          return s:polyenabled 
     endif
     if s:polyenabled == 5 
          call KeyReset("Close Window")
          nnoremap <silent> <Insert>   :call PolyMode(-2)<cr>
          nnoremap <silent> <PageUp>   :close<cr>:call PolyModeReset()<cr>
          nnoremap <silent> <PageDown> :close<cr>:call PolyModeReset()<cr>
          return s:polyenabled
     endif
     if s:polyenabled == 6 
          call KeyReset("NERDTree")
          nnoremap <silent> <Insert>   :call PolyMode(-2)<cr>
          nnoremap <silent> <PageUp>   :call PolyModeNERDTreeToggle()<cr>:call PolyModeReset()<cr>
          nnoremap <silent> <PageDown> :call PolyModeNERDTreeToggle()<cr>:call PolyModeReset()<cr>
          return s:polyenabled
     endif
     if s:polyenabled == 7 
          call KeyReset("Edit .vimrc")
          nnoremap <silent> <Insert>   :call PolyMode(-2)<cr>
          nnoremap <silent> <PageUp>   :call EditInTempBuffer("~/.vimrc")<cr>:normal zR<cr>:resize +15<cr>
          nnoremap <silent> <PageDown> :call EditInTempBuffer("~/.vimrc")<cr>:normal zR<cr>:resize +15<cr>
          return s:polyenabled
     endif
     if s:polyenabled == 8 
          call KeyReset("Vimscript Manual")
          nnoremap <silent> <Insert> :call PolyMode(-2)<cr>
          nnoremap <silent> <PageUp> :call OpenInTempBuffer("~/.vimscript.txt")<cr>
          nnoremap <silent> <PageDown> :call OpenInTempBuffer("~/.vimscript.txt")<cr>
          return s:polyenabled
     endif
     if s:polyenabled == 9 
          call KeyReset("Vim Tutor Text")
          nnoremap <silent> <Insert> :call PolyMode(-2)<cr>
          nnoremap <silent> <PageUp>   :call EditInTempBuffer("~/.vimtutor")<cr>:normal zR<cr>:resize +15<cr>
          nnoremap <silent> <PageDown> :call EditInTempBuffer("~/.vimtutor")<cr>:normal zR<cr>:resize +15<cr>
          return s:polyenabled
     endif
     if s:polyenabled == 10 
          let s:polyenabled = 15
     endif

     if s:polyenabled == 15
          call KeyReset("Resize")
          nnoremap <silent> <Insert> :call PolyMode(-2)<cr>
          nnoremap <silent> <Right> :vertical resize +5<cr>
          nnoremap <silent> <Left>  :vertical resize -5<cr>
          nnoremap <silent> <Up>    :resize -5<cr>
          nnoremap <silent> <Down>  :resize +5<cr>
          return s:polyenabled 
     endif
     if s:polyenabled == 16
          call KeyReset("Buffergator")
          nnoremap <silent> <Insert> :call PolyMode(-2)<cr>
          nnoremap <silent> <PageUp>   :BuffergatorToggle<cr>:call PolyModeReset()<cr>
          nnoremap <silent> <PageDown> :BuffergatorToggle<cr>:call PolyModeReset()<cr>
          return s:polyenabled
     endif
     if s:polyenabled == 17
          call KeyReset("Drag")
          nnoremap <silent> <Insert> :call PolyMode(-2)<cr>
          vmap <Right> :call DVB_Drag('left')<cr>
          return s:polyenabled 
     endif
     if s:polyenabled == 18
          call KeyReset("HL Search")
          nnoremap <silent> <Insert> :call PolyMode(-2)<cr>
          nnoremap <silent> <Up> :call SetHLSearchOn()<cr>
          nnoremap <silent> <Down> :call SetHLSearchOff()<cr>
          return s:polyenabled 
     endif
     if s:polyenabled == 19 
          call KeyReset("Source .vimrc")
          nnoremap <silent> <Insert> :call PolyMode(-2)<cr>
          nnoremap <silent> <PageUp> :call PolyModeSourceVimrc()<cr>
          return s:polyenabled 
     endif
     if s:polyenabled == 20 
          call KeyReset("Color Schemes")
          nnoremap <silent> <Insert> :call PolyMode(-2)<cr>
          nnoremap <silent> <PageUp> :call Colorlet(1)<cr>:echom @a<cr>
          nnoremap <silent> <PageDown> :call Colorlet(-1)<cr>:echom @a<cr>
          return s:polyenabled 
     endif
     if s:polyenabled == 21 
          call KeyReset("Edit Mode Toggle")
          nnoremap <silent> <Insert>   :call PolyMode(-2)<cr>
          nnoremap <silent> <PageUp>   :call PolyModeEditToggle()<cr>:call PolyModeReset()<cr>
          nnoremap <silent> <PageDown> :call PolyModeEditToggle()<cr>:call PolyModeReset()<cr>
          return s:polyenabled 
     endif
     if s:polyenabled > 21 
          let s:polyenabled = -1 
          call KeyReset("Movement")
          nnoremap <silent> <Insert> :call PolyMode(-2)<cr>
          return s:polyenabled 
     endif
endfunction
