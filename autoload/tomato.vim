scriptencoding utf-8

let s:lang = exists('g:tomato#lang') ? g:tomato#lang : 'english'
let s:interval = exists('g:tomato#interval') ? g:tomato#interval : 25*60
let s:ar_num = exists('g:tomato#auto_reset_num') ? g:tomato#auto_reset_num : 24*60*60 / s:interval
let s:rest_time = exists('g:tomato#rest_time') ? g:tomato#rest_time : 5*60
let s:remind = "Tomato"
let s:restinfo = "Take a rest"
if s:lang == "chinese"
    let s:remind = "番茄"
    let s:restinfo = "休息下"
endif
let s:show_clock = 0
let s:show_count_down = 0

let s:remind = exists('g:tomato#remind') ? g:tomato#remind : s:remind
let s:restinfo = exists('g:tomato#restinfo') ? g:tomato#restinfo : s:restinfo
let s:total = s:rest_time + s:interval
let s:tomato_file = expand("~/.tomato-vim")
let s:show_clock = exists('g:tomato#show_clock') ? g:tomato#show_clock : s:show_clock
let s:show_count_down = exists('g:tomato#show_count_down') ? g:tomato#show_count_down : s:show_count_down

function! tomato#reset() abort
    call writefile([1], s:tomato_file)
endfunction

function! tomato#get() abort
    let n = 1
    let s:clock = 0
    let s:remindtext = ""
    if filereadable(s:tomato_file)
        let period = (localtime() - getftime(s:tomato_file)) % s:total
        let number = (localtime() - getftime(s:tomato_file)) / s:total
        let n = readfile(s:tomato_file, '', 2)[0] + number
        let s:clock =  period
        if n > s:ar_num && s:ar_num != -1
            call tomato#reset()
        endif
        if period > s:interval
            let s:remindtext = s:restinfo
        else
            if number > 0
                call writefile([n], s:tomato_file)
            endif
            let s:remindtext = s:remind
        endif
    else
        call writefile([1], s:tomato_file)
    endif
    if s:show_clock
        if s:show_count_down
            let count_down = (s:interval - s:clock > 0) ? (s:interval - s:clock) : (s:rest_time - (s:clock - s:interval))
            return printf("%s[%d:%d][%d]", s:remindtext,count_down / 60,count_down % 60, n)
        else
            return printf("%s[%d:%d][%d]", s:remindtext,s:clock / 60 % (s:interval / 60),s:clock %60, n)
        endif
    else
        return printf("%s[%d]",s:remindtext,n)
    endif
endfunction
