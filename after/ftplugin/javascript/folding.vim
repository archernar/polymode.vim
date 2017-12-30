
function! JSFolds()
     let thisline = getline(v:lnum)
     if match(thisline,'^\s*function') >= 0
         return ">1"
     else
         return "="
     endif
     return "1"
endfunction
setlocal foldmethod=expr
setlocal foldexpr=JSFolds()

function! Pad(s,amt)
     return a:s . repeat(' ',a:amt - len(a:s))
endfunction

function! JSFoldText()
     let foldsize = (v:foldend - v:foldstart)
     let sz = Pad(getline(v:foldstart),70)
"     return getline(v:foldstart).' ('.foldsize.' lines)    '
     return sz.' ('.foldsize.' lines)    '
endfunction
setlocal foldtext=JSFoldText()
