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
  call call('<SNR>' . s:SID() . "_yank_search", a:000)
  call feedkeys("cgn")
endfunction

function! s:delete_search(...)
  call call('<SNR>' . s:SID() . "_yank_search", a:000)
  call feedkeys("dgn")
endfunction

nnoremap <Plug>(irreplaceable-c) :<C-u>set opfunc=<SID>replace_search<CR>g@
xnoremap <Plug>(irreplaceable-c) :<C-u>call <SID>replace_search()<CR>
nnoremap <Plug>(irreplaceable-c-line) :<C-U>set opfunc=<SID>replace_search<Bar>:call feedkeys(v:count1.'g@$')<CR>

nnoremap <Plug>(irreplaceable-d) :<C-u>set opfunc=<SID>delete_search<CR>g@
xnoremap <Plug>(irreplaceable-d) :<C-u>call <SID>delete_search()<CR>
nnoremap <Plug>(irreplaceable-d-line) :<C-U>set opfunc=<SID>delete_search<Bar>:call feedkeys(v:count1.'g@$')<CR>

nnoremap <Plug>(irreplaceable-y) :<C-u>set opfunc=<SID>yank_search<CR>g@
xnoremap <Plug>(irreplaceable-y) :<C-u>call <SID>yank_search()<CR>
nnoremap <Plug>(irreplaceable-y-line) :<C-U>set opfunc=<SID>yank_search<Bar>:call feedkeys(v:count1.'g@$')<CR>

if !hasmapto('<Plug>(irreplaceable-c)')
    nmap c. <Plug>(irreplaceable-c)
    nmap c.. <Plug>(irreplaceable-c-line)
    xmap .c <Plug>(irreplaceable-c)
endif

if !hasmapto('<Plug>(irreplaceable-d)')
    nmap d. <Plug>(irreplaceable-d)
    nmap d.. <Plug>(irreplaceable-d-line)
    xmap .d <Plug>(irreplaceable-d)
endif

if !hasmapto('<Plug>(irreplaceable-y)')
    nmap y. <Plug>(irreplaceable-y)
    nmap y.. <Plug>(irreplaceable-y-line)
    xmap .y <Plug>(irreplaceable-y)
endif

" vim: set et sw=2:
