let s:colorset = ['darkblue', 'PaperColor', 'default', 'delek', 'desert', 'elflord', 'evening', 'koehler', 'morning', 'murphy', 'pablo', 'peachpuff','ron', 'shine', 'slate', 'torte', 'zellner', 'blue']
let s:colorsetptr=-1
function! Colorlet(n)
     let s:colorsetptr = s:colorsetptr + (1*a:n)
     if s:colorsetptr < 0 
         let s:colorsetptr = (len(s:colorset)-1)
     endif
     if s:colorsetptr > (len(s:colorset)-1)
         let s:colorsetptr = 0
     endif
     execute "colorscheme ".  s:colorset[s:colorsetptr]
"     call append(line('$'),s:colorset[s:colorsetptr])
      let @a = s:colorset[s:colorsetptr]
"     normal! G
"     execute "put a"

endfunction
