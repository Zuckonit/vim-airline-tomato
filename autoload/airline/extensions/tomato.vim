function! airline#extensions#tomato#init(ext)
  call a:ext.add_statusline_funcref(function('airline#extensions#tomato#apply'))
endfunction

function! airline#extensions#tomato#apply(...)
  let w:airline_section_c = get(w:, 'airline_section_c', g:airline_section_c)
  let w:airline_section_c .= g:airline_left_sep . ' %{tomato#get()}'
endfunction
