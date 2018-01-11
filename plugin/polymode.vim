let s:polyenabled = -1 
let s:y3xxxxxxxxx = 0 
let s:poly2 = 0
let s:coco = 81
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
          if a:0 == 1 
               echo a:1
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
          echo "Polymode (reset)"
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
     let s:polyenabled = s:polyenabled + a:direction

     if s:polyenabled < 0 
          let s:polyenabled == 0 
     endif

     if s:polyenabled == 0 
          call KeyReset("Split")
          nnoremap <silent> <Right>    <C-w>v:call PolyModeReset()<cr><C-W>w
          nnoremap <silent> <Left>     <C-w>v:call PolyModeReset()<cr><C-W>w
          nnoremap <silent> <Up>       <C-w>s:call PolyModeReset()<cr><C-W>w
          nnoremap <silent> <Down>     <C-w>s:call PolyModeReset()<cr><C-W>w
          nnoremap <silent> <PageUp>   <C-w>s:call PolyModeReset()<cr><C-W>w
          nnoremap <silent> <PageDown> <C-w>v:call PolyModeReset()<cr><C-W>w
          return s:polyenabled 
     endif
     if s:polyenabled == 1 
          call KeyReset("Enhanced Zoom")
          nnoremap <silent> <PageUp> :wincmd _<cr>:wincmd \|<cr>
          nnoremap <silent> <PageDown> :wincmd =<cr>
          nnoremap <silent> <Insert> :wincmd =<cr>

          nnoremap <silent> <Right> :wincmd _<cr>:wincmd \|<cr>
          nnoremap <silent> <Left>  :wincmd =<cr>
          nnoremap <silent> <Up>    :wincmd _<cr>:wincmd \|<cr>
          nnoremap <silent> <Down>  :wincmd =<cr>
          return s:polyenabled 
     endif
     if s:polyenabled == 2 
          call KeyReset("Close Window")
          nnoremap <silent> <PageUp>    :close<cr>:call PolyModeReset()<cr>
          nnoremap <silent> <PageDown>  :close<cr>:call PolyModeReset()<cr>
          return s:polyenabled
     endif
     if s:polyenabled == 3 
          call KeyReset("VimNotes")
          nnoremap <silent> <PageUp>  :call OpenLibrary()<cr>
          nnoremap <silent> <PageDown> :botright split ~/.vim/vimnotes<cr>:botright split ~/.vim/vimscript.txt<cr>:botright split ~/.vim/vimtutor.txt<cr> :call PolyModeReset()<cr>
          return s:polyenabled
     endif

     if s:polyenabled == 4
          call KeyReset("NERDTree")
          nnoremap <silent> <PageUp>    :call PolyModeNERDTreeToggle()<cr>
          return s:polyenabled
     endif
     if s:polyenabled == 5
          call KeyReset("VimScript Help")
          nnoremap <silent> <PageUp>    :edit ~/.vim/vimscript.txt<cr>:call PolyModeReset()<cr>
          nnoremap <silent> <PageDown>  :edit ~/.vim/vimscript.txt<cr>:call PolyModeReset()<cr>
          return s:polyenabled
     endif
     if s:polyenabled == 6
          call KeyReset("Vim Tutor Text")
          nnoremap <silent> <PageUp>    :edit ~/.vim/vimtutor.txt<cr>:call PolyModeReset()<cr>
          nnoremap <silent> <PageDown>  :edit ~/.vim/vimtutor.txt<cr>:call PolyModeReset()<cr>
          return s:polyenabled
     endif

     if s:polyenabled == 7
          let s:polyenabled = 15
     endif

     if s:polyenabled == 15
          call KeyReset("Resize")
          nnoremap <silent> <Right> :vertical resize +5<cr>
          nnoremap <silent> <Left>  :vertical resize -5<cr>
          nnoremap <silent> <Up>    :resize -5<cr>
          nnoremap <silent> <Down>  :resize +5<cr>
          return s:polyenabled 
     endif
     if s:polyenabled == 16
          call KeyReset("Buffergator")
          nnoremap <silent> <PageUp>    :call PolyModeBuffergatorToggle()<cr>
          return s:polyenabled
     endif
     if s:polyenabled == 17
          echo s:coco
          call KeyReset()
          nnoremap <silent> <Right> :call CoCoUp()<cr>
          nnoremap <silent> <Left>  :call CoCoDown()<cr>
          return s:polyenabled 
     endif
     if s:polyenabled == 18
          call KeyReset("Drag")
          vmap <Right> :call DVB_Drag('left')<cr>
          return s:polyenabled 
     endif
     if s:polyenabled == 19
          call KeyReset("HL Search")
          nnoremap <silent> <Up> :call SetHLSearchOn()<cr>
          nnoremap <silent> <Down> :call SetHLSearchOff()<cr>
          return s:polyenabled 
     endif
     if s:polyenabled == 20 
          call KeyReset("Source .vimrc")
          nnoremap <silent> <PageUp> :call PolyModeSourceVimrc()<cr>
          return s:polyenabled 
     endif
     if s:polyenabled == 21 
          call KeyReset("Color Schemes")
          nnoremap <silent> <PageUp> :call Colorlet(1)<cr>:echom @a<cr>
          nnoremap <silent> <PageDown> :call Colorlet(-1)<cr>:echom @a<cr>
          return s:polyenabled 
     endif
     if s:polyenabled == 22 
          let s:polyenabled = -1 
          call KeyReset("Movement")
          return s:polyenabled 
     endif
endfunction

nnoremap <leader> <Home>  :call PolyModeReset()<cr>
