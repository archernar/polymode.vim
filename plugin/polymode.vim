let s:polyeditmode = 0 
let s:polyenabled = -1 
let s:fbar = "" 
let s:gfbar0 = "<F2> Next Window, <F3> Next Buffer, <F4> New ShellScript, <F5> Python, <F6> Command, <F7> MRU, <F8> UndoTree, <F9> PasteMode"
let s:gfbar1 = "OHHHH"
let s:fbarct = -1 
let s:poly2 = 0
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
function! PolyModeResetQuiet()
          let s:polyenabled = -1
          call KeyReset("")
          return s:polyenabled 
endfunction
function! PolyModeReset()
          let s:polyenabled = -1
          call KeyReset("Polymode Off (keys reset)")
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
          let s:polyenabled = 2 
     endif
     if s:polyenabled == 0 
          call KeyReset("Polymode On (End to exit)", "r v s e b")
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
     if s:polyenabled > 2 
          let s:polyenabled = -1 
          call KeyReset("Movement")
          nnoremap <silent> <Insert> :call PolyMode(-2)<cr>
          return s:polyenabled 
     endif
endfunction
