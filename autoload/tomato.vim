scriptencoding utf-8

let s:lang = exists('g:tomato#lang') ? g:tomato#lang : 'english'
let s:interval = exists('g:tomato#interval') ? g:tomato#interval : 25*60
let s:rest_time = exists('g:tomato#rest_time') ? g:tomato#rest_time : 5*60
let s:remind = "Tomato"
let s:restinfo = "Take a rest"
if s:lang == "chinese"
    let s:remind = "番茄"
    let s:restinfo = "休息下"
endif
let s:remind = exists('g:tomato#remind') ? g:tomato#remind : s:remind
let s:total = s:rest_time + s:interval
let s:tomato_file = expand("~/.tomato-vim")
"echo s:total, getftime(s:tomato_file)
function! tomato#get() abort
    let n = 1
    if filereadable(s:tomato_file)
        let period = (localtime() - getftime(s:tomato_file)) % s:total
        let number = (localtime() - getftime(s:tomato_file)) / s:total
        let n = readfile(s:tomato_file, '', 2)[0] + number
        if period > s:interval
            let s:remind = s:restinfo
        else
            if number > 0
                call writefile([n], s:tomato_file)
            endif
        endif
    else
        call writefile([1], s:tomato_file)
    endif
    return printf("%s[%d]", s:remind, n)
endfunction

function! tomato#reset() abort
    call writefile([1], s:tomato_file)
endfunction
