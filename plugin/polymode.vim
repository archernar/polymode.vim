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
     execute "botright split /home/mestes/.vim/vimnotes"
     let @x = join(readfile("/home/mestes/.vim/vimnotes","\n"))
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
          let s:fbar = g:help1
     endif
     if   s:fbarct == 2  
          let s:fbar = g:help2
          let s:fbarct = -1
     endif
          let l:local = ""
          if a:0 == 1 
               let l:szTemp = a:1
               if  s:polyeditmode == 1
                    let l:szTemp = a:1 . " (edit mode)" 
               endif
               let l:local = l:szTemp
          endif
          let s:nnn = (&columns - ( len(s:fbar) + len(l:local) )) -3
          if s:nnn < 0
               let s:nnn = 0
          endif
          echo l:local.repeat(' ', s:nnn).s:fbar
          nnoremap <silent> <Insert>   <Nop>
          nnoremap <silent> <Right>    <right>
          nnoremap <silent> <Left>     <left>
          nnoremap <silent> <Up>       <up>
          nnoremap <silent> <Down>     <down>
          nnoremap <silent> <PageUp>   <pageup>
          nnoremap <silent> <PageDown> <pagedown>
          nnoremap <silent> <Delete>   <delete>
          nnoremap <silent> <End>  :call PolyModeReset()<cr>
          return s:polyenabled 
endfunction
function! PolyModeNERDTreeToggle()
          let s:polyenabled = -1
          NERDTreeToggle
          call PolyModeReset()
          return s:polyenabled 
endfunction
function! VimNotes()
     echo system('cat ~/.vim/vimnotes')
     echo " "
     echo "F2: Cycle Window, F3: Cycle Buffer, F4:Split Window, F5: Split Window, F10: Quit All, F12: Save and Build"
     echo "<leader>p InstallPlugins! "
     call PolyModeResetQuiet()
     return 0
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
          call KeyReset("Polymode (key reset)")
          return s:polyenabled 
endfunction

function! PolyModeSet(...)
     let s:polyenabled = a:1 
     call PolyMode(0)
endfunction

function! PolyModeNull()
endfunction
function! Poly2Mode()
     call PolyModeReset()
     if s:poly2 == 0
          let s:poly2 = 1
          wincmd _
          wincmd \|
          return s:poly2 
     endif
     if s:poly2 == 1
          let s:poly2 = 0
          wincmd =
          return s:poly2 
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
          call KeyReset("Help")
          " With Help slected certain shortcut keys are enabled
          " For Enhanced Zoom
          nnoremap <silent> e :call PolyModeSet(2)<cr>
          " For NERDTree
          nnoremap <silent> n :call PolyModeSet(9)<cr>
          " For Buffergator
          nnoremap <silent> b :call PolyModeSet(16)<cr>
          nnoremap <silent> <Insert> :call PolyMode(-2)<cr>
          nnoremap <silent> <PageUp> :call OpenMyNotes()<cr>:call PolyModeReset()<cr>
          nnoremap <silent> <PageDown> :call OpenMyNotes()<cr>:call PolyModeReset()<cr>
          return s:polyenabled 
     endif
     if s:polyenabled == 1 
          call KeyReset("Split")
          nnoremap <silent> <Insert> :call PolyMode(-2)<cr>
          nnoremap <silent> <PageUp>   <C-w>s:call PolyModeNull()<cr><C-W>w
          nnoremap <silent> <PageDown> <C-w>v:call PolyModeNull()<cr><C-W>w
          nnoremap <silent> <leader><PageUp>    :close<cr>:call PolyModeNull()<cr>
          nnoremap <silent> <leader><PageDown>  :close<cr>:call PolyModeNull()<cr>
          nnoremap <silent> <Delete>  :close<cr>:call PolyModeNull()<cr>
          return s:polyenabled 
     endif
     if s:polyenabled == 2 
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
     if s:polyenabled == 3 
          call KeyReset("Close Window")
          nnoremap <silent> <Insert> :call PolyMode(-2)<cr>
          nnoremap <silent> <PageUp>    :close<cr>:call PolyModeReset()<cr>
          nnoremap <silent> <PageDown>  :close<cr>:call PolyModeReset()<cr>
          return s:polyenabled
     endif
     if s:polyenabled == 4 
          call KeyReset("R1: VimTutor")
          nnoremap <silent> <Insert> :call PolyMode(-2)<cr>
          nnoremap <silent> <PageUp> :call OpenInTempBuffer("~/.vim/vimtutor.txt")<cr>
          nnoremap <silent> <PageDown> :call OpenInTempBuffer("~/.vim/vimtutor.txt")<cr>
          return s:polyenabled
     endif

     if s:polyenabled == 5 
          call KeyReset("R2: VimScript")
          nnoremap <silent> <Insert> :call PolyMode(-2)<cr>
          nnoremap <silent> <PageUp> :call OpenInTempBuffer("~/.vim/vimscript.txt")<cr>
          nnoremap <silent> <PageDown> :call OpenInTempBuffer("~/.vim/vimscript.txt")<cr>
          return s:polyenabled
     endif
     if s:polyenabled == 6 
          call KeyReset("R3: VimNotes (edit mode)")
          nnoremap <silent> <Insert>   :call PolyMode(-2)<cr>
          nnoremap <silent> <PageUp>   :call EditInTempBuffer("~/.vim/vimnotes")<cr>
          nnoremap <silent> <PageDown> :call EditInTempBuffer("~/.vim/vimnotes")<cr>
          return s:polyenabled
     endif
     if s:polyenabled == 7
          call KeyReset("R4: VimScript Help")
          nnoremap <silent> <Insert> :call PolyMode(-2)<cr>
          nnoremap <silent> <PageUp>    :call OpenInTempBuffer("~/.vim/vimscript.txt")<cr>
          nnoremap <silent> <PageDown>    :call OpenInTempBuffer("~/.vim/vimscript.txt")<cr>
          return s:polyenabled
     endif
     if s:polyenabled == 8
          call KeyReset("Vim Tutor Text")
          nnoremap <silent> <Insert> :call PolyMode(-2)<cr>
          nnoremap <silent> <PageUp>    :edit ~/.vim/vimtutor.txt<cr>:call PolyModeReset()<cr>
          nnoremap <silent> <PageDown>  :edit ~/.vim/vimtutor.txt<cr>:call PolyModeReset()<cr>
          return s:polyenabled
     endif
     if s:polyenabled == 9
          call KeyReset("NERDTree")
          nnoremap <silent> <Insert>   :call PolyMode(-2)<cr>
          nnoremap <silent> <PageUp>   :call PolyModeNERDTreeToggle()<cr>:call PolyModeReset()<cr>
          nnoremap <silent> <PageDown> :call PolyModeNERDTreeToggle()<cr>:call PolyModeReset()<cr>
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
     if s:polyenabled > 22 
          let s:polyenabled = -1 
          call KeyReset("Movement")
          nnoremap <silent> <Insert> :call PolyMode(-2)<cr>
          return s:polyenabled 
     endif
endfunction

