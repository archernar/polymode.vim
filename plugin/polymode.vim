" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.
 
"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.
 
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" This is the Vundle package, which can be found on GitHub.
" " For GitHub repos, you specify plugins using the
" " 'user/repository' format
Plugin 'gmarik/vundle'
"
" " We could also add repositories with a ".git" extension
Plugin 'scrooloose/nerdtree.git'
"
" " To get plugins from Vim Scripts, you can reference the plugin
" " by name as it appears on the site
Plugin 'Buffergator'
Plugin 'kien/ctrlp.vim'
"
"
"
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
 
" Enable syntax highlighting
syntax off
 
 
"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.
 
" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
" set hidden
 
" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall
 
" Better command-line completion
set wildmenu
 
" Show partial commands in the last line of the screen
set showcmd
 
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
" set hlsearch
 
" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline
 
 
"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.
 
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
 
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
 
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
 
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
 
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
 
" Always display the status line, even if only one window is displayed
set laststatus=2
 
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
 
" Use visual bell instead of beeping when doing something wrong
set visualbell
 
" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=
 
" Enable use of the mouse for all modes
" set mouse=a
 
" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2
 
" Display line numbers on the left
set number
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
 
" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>
 
 
"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.
 
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab
 
" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4
 
 
"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings
 
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
 
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

"------------------------------------------------------------
" http://vim.wikia.com/wiki/Easier_buffer_switching
" http://eseth.org/2007/vim-buffers.html
" http://vim.wikia.com/wiki/Switch_between_Vim_window_splits_easily
" http://superuser.com/questions/486532/how-to-open-files-in-vertically-horizontal-split-windows-in-vim-from-the-command
"
"http://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
"
":map and :noremap are recursive and non-recursive versions of the various mapping commands.


nnoremap <F5> :buffers<CR>:buffer<Space>

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
nnoremap <F3> :set nonumber!<CR>
"-- Cycle Window
:map <F2> <C-W>w
"-- Cycle Buffer
:map <F3> :bnext<CR>
"-- Split Window
:map <F4> <C-w>s
:map <F5> <C-w>v

"-- Window Setup
:map <F9> <C-w>s<CR><C-w>v<CR>

"-- Quit All
:map <F10> :qa<CR>

"-- Build
:map <F12> <ESC>:wa<CR>:!build<CR><CR>


set  rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256

" Leader - ( Spacebar )
let mapleader = " "

" http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)
nnoremap <Leader>' diwi""<ESC>hp<ESC>
nnoremap <Leader>nt :NERDTree<cr>

"
" zoom a vim pane, <C-w>= to re-balance

" resize panes
"nnoremap <silent> <Right> :vertical resize +5<cr>
"nnoremap <silent> <Left> :vertical resize -5<cr>
nnoremap <leader>-        :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>=        :wincmd =<cr>
nnoremap <leader>l        :resize -5<cr>
nnoremap <leader>m        :resize +5<cr>

nnoremap <leader>n        :call PolyMode()<cr>
nnoremap <Home>           :call PolyMode()<cr>
nnoremap <End>            :call Poly2Mode()<cr>

nnoremap <leader> <Right> :call PolyModeReset()<cr>
nnoremap <leader> <Left>  :call PolyModeReset()<cr>
nnoremap <leader> <Up>    :call PolyModeReset()<cr>
nnoremap <leader> <Down>  :call PolyModeReset()<cr>

"hi Normal ctermbg=black
hi Visual cterm=NONE ctermfg=black ctermbg=white
hi Search cterm=NONE ctermfg=white ctermbg=red
highlight ColorColumn  ctermbg=red
set colorcolumn=0

nnoremap <silent> n n:call HLNext(0.4)<cr>
nnoremap <silent> N N:call HLNext(0.4)<cr>
nnoremap <silent> ;; :s/^/"/<cr>:s/$/"/<cr>:s/https.*v=//<cr>:s/&list.*"//<cr>:s/$/"/<cr>
" https://www.youtube.com/watch?v=zKbZeUvPnWI&index=1&list=PLpH1IDQEoE8Q8842yVe-V8m7PN-R9rlwi
" zKbZeUvPnWI&index=1&list=PLpH1IDQEoE8Q8842yVe-V8m7PN-R9rlwi
" https://www.youtube.com/watch?v=zKbZeUvPnWI&index=1&list=PLpH1IDQEoE8Q8842yVe-V8m7PN-R9rlwi
" https://www.youtube.com/watch?v=zKbZeUvPnWI&index=1&list=PLpH1IDQEoE8Q8842yVe-V8m7PN-R9rlwi
" https://www.youtube.com/watch?v=zKbZeUvPnWI&index=1&list=PLpH1IDQEoE8Q8842yVe-V8m7PN-R9rlwi
nnoremap <silent> ;p :s/^.*http/http/<cr>:s/http.*watch[?]v=//<cr>:s/[&].*$//<cr>:s/$/",/<cr>:s/^/"/<cr>
" :s/$/"/<cr>:s/https.*v=//<cr>:s/&list.*"//<cr>:s/$/"/<cr>
vmap  <expr>  h        DVB_Drag('left')
vmap  <expr>  l        DVB_Drag('right')
vmap  <expr>  j        DVB_Drag('down')
vmap  <expr>  k        DVB_Drag('up')

function Test()
    let fn=input("Filename: ", "")
    split
    wincmd w
    exec "e ".fn 
    return 0 
endfunction
nnoremap <leader>' :call Test()<cr>


"autocmd WinEnter * :set cursorline
"autocmd WinEnter * :redraw
"autocmd WinEnter * :sleep 1
"autocmd WinEnter * :set nocursorline
" **************************************************************************************************************
" **************************************************************************************************************
" **************************************************************************************************************
"
"

let s:polyenabled = 0
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
          let s:polyenabled = 0
          echo "Movement"
          call KeyReset()
          return s:polyenabled 
     endif
endfunction


