let s:polyenabled = -1
let s:yxxxxxxxxxx = -1
let s:poly2 = 0
let s:coco = 81
function VimNotes()
     echo system('cat /home/mestes/.vim/vimnotes')
     echo " "
     echo " "
     echo "F2: Cycle Window, F3: Cycle Buffer, F4:Split Window, F5: Split Window, F10: Quit All, F12: Save and Build"
     call PolyModeResetQuiet()
     return 0
endfunction

function ListBuffers()
     ls
     call PolyModeResetQuiet()
endfunction

function! KeyReset()
          nnoremap <silent> <Right> <right>
          nnoremap <silent> <Left> <left>
          nnoremap <silent> <Up> <up>
          nnoremap <silent> <Down> <down>
          nnoremap <silent> <PageUp>   <pageup>
          nnoremap <silent> <PageDown> <pagedown>
          return s:polyenabled 
endfunction
function! PolyModeReset()
          call PolyModeResetQuiet()
          echo "Movement"
          return s:polyenabled 
endfunction

function! PolyModeResetQuiet()
          let s:polyenabled = 0
          call KeyReset()
          return s:polyenabled 
endfunction

function Poly2Mode()
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

function SetHLSearchOn()
     set hlsearch
     echo "HL On"
endfunction
function SetHLSearchOff()
     set nohlsearch
     echo "HL Off"
endfunction
function CoCoUp()
     let s:coco += 1
     execute "set colorcolumn=".s:coco
     echo s:coco
endfunction
function CoCoDown()
     let s:coco -= 1
     execute "set colorcolumn=".s:coco
     echo s:coco
endfunction

function! PolyMode()
     if s:polyenabled == -1 
          let s:polyenabled = s:polyenabled + 1
          echo "Buffergator"
          call KeyReset()
          nnoremap <silent> <PageUp>    :BuffergatorOpen<cr>
          return s:polyenabled
     endif
     if s:polyenabled == 0 
          let s:polyenabled = s:polyenabled + 1
          echo "VimNotes"
          call KeyReset()
          nnoremap <silent> <Right> :call VimNotes()<cr>
          nnoremap <silent> <Left>  :call VimNotes()<cr>
          nnoremap <silent> <Up>    :call VimNotes()<cr>
          nnoremap <silent> <Down>  :call VimNotes()<cr>
          nnoremap <silent> <PageUp>    :call VimNotes()<cr>
          nnoremap <silent> <PageDown>  :call VimNotes()<cr>
          return s:polyenabled
     endif

     if s:polyenabled == 1
          let s:polyenabled = s:polyenabled + 1
          echo "Split"
          call KeyReset()
          nnoremap <silent> <Right> <C-w>v:call PolyModeReset()<cr>
          nnoremap <silent> <Left>  <C-w>v:call PolyModeReset()<cr>
          nnoremap <silent> <Up>    <C-w>s:call PolyModeReset()<cr>
          nnoremap <silent> <Down>  <C-w>s:call PolyModeReset()<cr>
          return s:polyenabled 
     endif
     if s:polyenabled == 2
          let s:polyenabled = s:polyenabled + 1
          echo "Resize"
          call KeyReset()
          nnoremap <silent> <Right> :vertical resize +5<cr>
          nnoremap <silent> <Left> :vertical resize -5<cr>
          nnoremap <silent> <Up> :resize -5<cr>
          nnoremap <silent> <Down> :resize +5<cr>
          return s:polyenabled 
     endif
     if s:polyenabled == 3
          let s:polyenabled = s:polyenabled + 1
          echo "Zoom"
          call KeyReset()
          nnoremap <silent> <Right> :wincmd _<cr>:wincmd \|<cr>
          nnoremap <silent> <Left>  :wincmd =<cr>
          nnoremap <silent> <Up>    :wincmd _<cr>:wincmd \|<cr>
          nnoremap <silent> <Down>  :wincmd =<cr>
          return s:polyenabled 
     endif
     if s:polyenabled == 4
          let s:polyenabled = s:polyenabled + 1
          echo s:coco
          call KeyReset()
          nnoremap <silent> <Right> :call CoCoUp()<cr>
          nnoremap <silent> <Left>  :call CoCoDown()<cr>
          return s:polyenabled 
     endif
     if s:polyenabled == 5
          let s:polyenabled = s:polyenabled + 1
          echo "Drag"
          call KeyReset()
          vmap <Right> :call DVB_Drag('left')<cr>
          return s:polyenabled 
     endif
     if s:polyenabled == 6
          let s:polyenabled = s:polyenabled + 1
          echo "HL Search"
          call KeyReset()
          nnoremap <silent> <Up> :call SetHLSearchOn()<cr>
          nnoremap <silent> <Down> :call SetHLSearchOff()<cr>
          return s:polyenabled 
     endif
     if s:polyenabled == 7
          let s:polyenabled = s:polyenabled + 1 
          echo "List Buffers"
          call KeyReset()
          nnoremap <silent> <Left>  :ls<cr>
          nnoremap <silent> <Right> :ls<cr>
          nnoremap <silent> <Up>    :call ListBuffers()<cr>
          nnoremap <silent> <Down>  :ls<cr>
          return s:polyenabled 
     endif
     if s:polyenabled == 8
          let s:polyenabled = -1
          echo "Movement"
          call KeyReset()
          return s:polyenabled 
     endif
endfunction
