let s:polyenabled = 0 
let s:y3xxxxxxxxx = 0 
let s:poly2 = 0
let s:coco = 81

function! KeyReset(...)
          if a:0 == 1 
               echo a:1
          endif
          nnoremap <silent> <Right>    <right>
          nnoremap <silent> <Left>     <left>
          nnoremap <silent> <Up>       <up>
          nnoremap <silent> <Down>     <down>
          nnoremap <silent> <PageUp>   <pageup>
          nnoremap <silent> <PageDown> <pagedown>
          nnoremap <leader> <End>  :call PolyModeReset()<cr>
          return s:polyenabled 
endfunction
function! PolyModeResetQuiet()
          let s:polyenabled = 0
          call KeyReset()
          return s:polyenabled 
endfunction
function! PolyModeReset()
          call PolyModeResetQuiet()
          echo "Polymode Movement"
          return s:polyenabled 
endfunction

function! PolyModeBuffergatorToggle()
          let s:polyenabled = 0
          BuffergatorToggle
          call PolyModeReset()
          return s:polyenabled 
endfunction
function! PolyModeNERDTreeToggle()
          let s:polyenabled = 0
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

function! PolyMode()
     if s:polyenabled == 0 
          let s:polyenabled = s:polyenabled + 1
          call KeyReset("NERDTree")
          nnoremap <silent> <PageUp>    :call PolyModeNERDTreeToggle()<cr>
          return s:polyenabled
     endif
     if s:polyenabled == 1 
          let s:polyenabled = s:polyenabled + 1
          call KeyReset("Buffergator")
          nnoremap <silent> <PageUp>    :call PolyModeBuffergatorToggle()<cr>
          return s:polyenabled
     endif
     if s:polyenabled == 2 
          let s:polyenabled = s:polyenabled + 1
          call KeyReset("VimNotes")
          nnoremap <silent> <PageUp>    :call VimNotes()<cr>
          return s:polyenabled
     endif

     if s:polyenabled == 3
          let s:polyenabled = s:polyenabled + 1
          call KeyReset("Split")
          nnoremap <silent> <Right>    <C-w>v:call PolyModeReset()<cr><C-W>w
          nnoremap <silent> <Left>     <C-w>v:call PolyModeReset()<cr><C-W>w
          nnoremap <silent> <PageDown> <C-w>v:call PolyModeReset()<cr><C-W>w
          nnoremap <silent> <Up>       <C-w>s:call PolyModeReset()<cr><C-W>w
          nnoremap <silent> <Down>     <C-w>s:call PolyModeReset()<cr><C-W>w
          nnoremap <silent> <PageUp>   <C-w>s:call PolyModeReset()<cr><C-W>w
          return s:polyenabled 
     endif
     if s:polyenabled == 4
          let s:polyenabled = s:polyenabled + 1
          call KeyReset("Resize")
          nnoremap <silent> <Right> :vertical resize +5<cr>
          nnoremap <silent> <Left>  :vertical resize -5<cr>
          nnoremap <silent> <Up>    :resize -5<cr>
          nnoremap <silent> <Down>  :resize +5<cr>
          return s:polyenabled 
     endif
     if s:polyenabled == 5
          let s:polyenabled = s:polyenabled + 1
          call KeyReset("Zoom")
          nnoremap <silent> <Right> :wincmd _<cr>:wincmd \|<cr>
          nnoremap <silent> <Left>  :wincmd =<cr>
          nnoremap <silent> <Up>    :wincmd _<cr>:wincmd \|<cr>
          nnoremap <silent> <Down>  :wincmd =<cr>
          return s:polyenabled 
     endif
     if s:polyenabled == 6
          let s:polyenabled = s:polyenabled + 1
          echo s:coco
          call KeyReset()
          nnoremap <silent> <Right> :call CoCoUp()<cr>
          nnoremap <silent> <Left>  :call CoCoDown()<cr>
          return s:polyenabled 
     endif
     if s:polyenabled == 7
          let s:polyenabled = s:polyenabled + 1
          call KeyReset("Drag")
          vmap <Right> :call DVB_Drag('left')<cr>
          return s:polyenabled 
     endif
     if s:polyenabled == 8
          let s:polyenabled = s:polyenabled + 1
          call KeyReset("HL Search")
          nnoremap <silent> <Up> :call SetHLSearchOn()<cr>
          nnoremap <silent> <Down> :call SetHLSearchOff()<cr>
          return s:polyenabled 
     endif
     if s:polyenabled == 9
          let s:polyenabled = s:polyenabled + 1
          call KeyReset("Source .vimrc")
          nnoremap <silent> <PageUp> :source $MYVIMRC<cr>
          return s:polyenabled 
     endif
     if s:polyenabled == 10 
          let s:polyenabled = 0 
          call KeyReset("Movement")
          return s:polyenabled 
     endif
endfunction

nnoremap <leader> <Home>  :call PolyModeReset()<cr>
