function! s:SID()
    return matchstr(expand('<sfile>'), '<SNR>\zs\d\+\ze_SID$')
endfun

function! s:yank_search(...)
    let sel_save = &selection
    let &selection = "inclusive"
    let reg_save = @@

    if a:0
      echo "goed"
        let l:type = a:0
        if l:type == 'line'
            silent exe "normal! '[V']y"
        elseif l:type == 'block'
            silent exe "normal! `[\<C-V>`]y"
        else
            silent exe "normal! `[v`]y"
        endif
    else
      echo "fout"
        silent exe "normal! `<" . visualmode() . "`>y"
    endif

    let l:sel = @@
    let &selection = sel_save
    let @@ = reg_save

    let @/ = '\V' . substitute(l:sel, '\\', '\\\\', 'g')
endfunction

function! s:replace_search(...)
  " call <SID>yank_search(a:000)
  call call('<SNR>' . s:SID() . "_yank_search", a:000)
  call feedkeys("cgn")
endfunction

function! s:delete_search(...)
  " call <SID>yank_search(a:000)
  " call "<SID>yank_search(" . a:000 . ")"
  " exec call("<SID>yank_search" . a:000)
  call call('<SNR>' . s:SID() . "_yank_search", a:000)
  call feedkeys("dgn")
endfunction

nnoremap <Plug>(refactor-c) :<C-u>set opfunc=<SID>replace_search<CR>g@
xnoremap <Plug>(refactor-c) :<C-u>call <SID>replace_search()<CR>
nnoremap <Plug>(refactor-c-line) :<C-U>set opfunc=<SID>replace_search<Bar>:call feedkeys(v:count1.'g@$')<CR>

nnoremap <Plug>(refactor-d) :<C-u>set opfunc=<SID>delete_search<CR>g@
xnoremap <Plug>(refactor-d) :<C-u>call <SID>delete_search()<CR>
nnoremap <Plug>(refactor-d-line) :<C-U>set opfunc=<SID>delete_search<Bar>:call feedkeys(v:count1.'g@$')<CR>

nnoremap <Plug>(refactor-y) :<C-u>set opfunc=<SID>yank_search<CR>g@
xnoremap <Plug>(refactor-y) :<C-u>call <SID>yank_search()<CR>
nnoremap <Plug>(refactor-y-line) :<C-U>set opfunc=<SID>yank_search<Bar>:call feedkeys(v:count1.'g@$')<CR>

if !hasmapto('<Plug>(refactor-c)')
    nmap c. <Plug>(refactor-c)
    nmap c.. <Plug>(refactor-c-line)
    xmap .c <Plug>(refactor-c)
endif

if !hasmapto('<Plug>(refactor-d)')
    nmap d. <Plug>(refactor-d)
    nmap d.. <Plug>(refactor-d-line)
    xmap .d <Plug>(refactor-d)
endif

if !hasmapto('<Plug>(refactor-y)')
    nmap y. <Plug>(refactor-y)
    nmap y.. <Plug>(refactor-y-line)
    xmap .y <Plug>(refactor-y)
endif

" vim: set et sw=2:
