function! VimNotesToggle()
     if g:vim_notes_is_open
          if @% == g:vim_notes
               bdelete
               let g:vim_notes_is_open = 0
          endif
     else
          execute "split ".g:vim_notes
          let g:vim_notes_is_open = 1
     endif
endfunction


function! Smash()
          execute "new | 0read ! ls -la"
          execute "file zood"
          execute "1"
endfunction



