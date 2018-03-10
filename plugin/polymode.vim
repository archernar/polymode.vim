let s:polyenabled = -1 
let s:y3xxxxxxxxx = 0 
let s:poly2 = 0
let s:coco = 81
let s:fbar = gfbar
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
function! CloseLibrary()
     execute "b ~/.vim/vimscript.txt"
     execute "bd"
     execute "b ~/.vim/vimtutor.txt"
     execute "bd"
     execute "b ~/.vim/vimnotes"
     execute "bd"
     call PolyModeReset()
endfunction

function! OpenLibrary()
     execute "botright split ~/.vim/vimscript.txt"
     execute "botright split ~/.vim/vimtutor.txt"
     execute "botright split ~/.vim/vimnotes"
     call PolyModeReset()
endfunction

function! PolyModeSourceVimrc()
          let s:polyenabled = 0
          source $MYVIMRC
          call PolyModeReset()
          return s:polyenabled 
endfunction

function! KeyReset(...)
          let s:nnn = 0
          if a:0 == 1 
               let s:nnn = (&columns - ( len(s:fbar) + len(a:1) )) -3
               if s:nnn < 0
                    let s:nnn = 0
               endif
          endif
          if a:0 == 1 
               echo a:1.repeat(' ', s:nnn).s:fbar
          endif
          nnoremap <silent> <Insert>   <insert>
          nnoremap <silent> <Right>    <right>
          nnoremap <silent> <Left>     <left>
          nnoremap <silent> <Up>       <up>
          nnoremap <silent> <Down>     <down>
          nnoremap <silent> <PageUp>   <pageup>
          nnoremap <silent> <PageDown> <pagedown>
          nnoremap <silent> <End>  :call PolyModeReset()<cr>
          return s:polyenabled 
endfunction
function! PolyModeResetQuiet()
          let s:polyenabled = -1
          call KeyReset()
          return s:polyenabled 
endfunction
function! PMR()
          call PolyModeReset()
endfunction
function! PolyModeReset()
          call PolyModeResetQuiet()
          let s:nnn = (&columns - ( len(s:fbar) + len("Polymode (reset)") )) -3
          if s:nnn < 0
               let s:nnn = 0
          endif
          echo "Polymode (reset)".repeat(' ', s:nnn).s:fbar
          return s:polyenabled 
endfunction

function! PolyModeBuffergatorToggle()
          let s:polyenabled = -1
          BuffergatorToggle
          call PolyModeReset()
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
function! CoCoUp()
     let s:coco += 1
     execute "set colorcolumn=".s:coco
     echo s:coco
endfunction
function! CoCoDown()
     let s:coco -= 1
     execute "set colorcolumn=".s:coco
     echo s:coco
endfunction

function! PolyModeSet(n)
     let s:polyenabled == n 
     call PolyMode(0)
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
          let s:polyenabled = 20 
     endif

     if s:polyenabled == 14 
          let s:polyenabled = 6 
     endif

     if s:polyenabled == 0 
          call KeyReset("Split")
          nnoremap <silent> <Insert> :call PolyMode(-2)<cr>
          nnoremap <silent> <Right>    <C-w>v:call PolyModeReset()<cr><C-W>w
          nnoremap <silent> <Left>     <C-w>v:call PolyModeReset()<cr><C-W>w
          nnoremap <silent> <Up>       <C-w>s:call PolyModeReset()<cr><C-W>w
          nnoremap <silent> <Down>     <C-w>s:call PolyModeReset()<cr><C-W>w
          return s:polyenabled 
     endif
     if s:polyenabled == 1 
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
     if s:polyenabled == 2 
          call KeyReset("Close Window")
          nnoremap <silent> <Insert> :call PolyMode(-2)<cr>
          nnoremap <silent> <PageUp>    :close<cr>:call PolyModeReset()<cr>
          nnoremap <silent> <PageDown>  :close<cr>:call PolyModeReset()<cr>
          return s:polyenabled
     endif
     if s:polyenabled == 3 
          call KeyReset("VimNotes")
          nnoremap <silent> <Insert> :call PolyMode(-2)<cr>
          nnoremap <silent> <PageUp> :call OpenLibrary()<cr>
          nnoremap <silent> <PageDown> :call OpenLibrary()<cr>
          return s:polyenabled
     endif

     if s:polyenabled == 4
          call KeyReset("NERDTree")
          nnoremap <silent> <Insert> :call PolyMode(-2)<cr>
          nnoremap <silent> <PageUp>    :call PolyModeNERDTreeToggle()<cr>
          return s:polyenabled
     endif
     if s:polyenabled == 5
          call KeyReset("VimScript Help")
          nnoremap <silent> <Insert> :call PolyMode(-2)<cr>
          nnoremap <silent> <PageUp>    :edit ~/.vim/vimscript.txt<cr>:call PolyModeReset()<cr>
          nnoremap <silent> <PageDown>  :edit ~/.vim/vimscript.txt<cr>:call PolyModeReset()<cr>
          return s:polyenabled
     endif
     if s:polyenabled == 6
          call KeyReset("Vim Tutor Text")
          nnoremap <silent> <Insert> :call PolyMode(-2)<cr>
          nnoremap <silent> <PageUp>    :edit ~/.vim/vimtutor.txt<cr>:call PolyModeReset()<cr>
          nnoremap <silent> <PageDown>  :edit ~/.vim/vimtutor.txt<cr>:call PolyModeReset()<cr>
          return s:polyenabled
     endif
     if s:polyenabled == 7
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
          nnoremap <silent> <PageUp>    :call PolyModeBuffergatorToggle()<cr>
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
     if s:polyenabled > 20 
          let s:polyenabled = -1 
          call KeyReset("Movement")
          nnoremap <silent> <Insert> :call PolyMode(-2)<cr>
          return s:polyenabled 
     endif
endfunction

nnoremap <leader> <Home>  :call PolyModeReset()<cr>
