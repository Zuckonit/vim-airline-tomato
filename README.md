vim-airline-tomato
==================
  
##INTRODUCTION 
This is vim-airline extension to display  Pomodoro Technique
  
##Required
* [Airline](https://github.com/bling/vim-airline): This is a extension of airline (like powerline, but more fast and KISS)
* [powerline-font](https://github.com/Lokaltog/powerline-fonts): if you use chinese font, you may need install powerline font
   
#Configuration
`
  If you want to change the working time:
>
    let g:tomato#interval = 60 * 60
<
  If you wat to change rest time:
>
    let g:tomato#rest_time = 20 * 60
<
  If you wat to change language(english or chinese):
>
    let g:tomato#lang = 'chinese'

  If you wat to change working text:
>
    let g:tomato#remind = ":("

  If you wat to change rest text:
>
    let g:tomato#remind = ":)"
==============================================================================
vim:tw=78:ts=8:ft=help:norl:noet:fen:fdl=0:
`
  
##License
MIT
