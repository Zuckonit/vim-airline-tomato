vim-airline-tomato
==================
  
## Introduction
This is a vim-airline extension for an easy application of the [Pomodoro Technique](http://en.wikipedia.org/wiki/Pomodoro_Technique).
  
## Required
* [Airline](https://github.com/bling/vim-airline): The extension is based on vim-airline (like powerline, but faster and with a deeper KISS flavor)
* [powerline-font](https://github.com/Lokaltog/powerline-fonts): if you use wild char's, you may need install powerline font.

## Optional
* [pomicons](https://github.com/gabrielelana/pomicons): This is a font with 8 symbols to talk about the "Pomodoro Technique"® (You can use these special symbols to change the configuration). You can use one of the [awesome-terminal-fonts](https://github.com/gabrielelana/awesome-terminal-fonts) that contains both powerline and pomicons symbols.
   
## Configuration
* If you want to change the working time:
> let g:tomato#interval = 60 * 60
  
* If you wat to change rest time:
> let g:tomato#rest_time = 20 * 60
  
* If you want to change language(English or Chinese):
> let g:tomato#lang = 'chinese'
  
* If you want to change working text:
> let g:tomato#remind = "☻"  (" \uf003 " if you are using [awesome-terminal-fonts](https://github.com/gabrielelana/awesome-terminal-fonts))
  
* If you want to change rest text:
> let g:tomato#restinfo = "☺" (" \ue1f1 " if you are using [awesome-terminal-fonts](https://github.com/gabrielelana/awesome-terminal-fonts))

* If you want to enable clock:
> let g:tomato#show_clock = 1

* If you want to show a count down:
> let g:tomato#show_clock = 1  
> let g:tomato#show_count_down = 1 


## Reset (reset the count of tomato to be one)
*  manually reset
>  :call tomato#reset()
  
*  set auto reset when number over a value
>  let g:tomato#auto_reset_num = 24 (here put the number you wanna set)  
>  if the g:tomato#auto_reset_num = -1, then the auto reset will be forbidden  
>  if there is no g:tomato#auto_reset_num in your config, the default auto_reset_num is 24 * 60 / g:tomato#interval, the total tomato numbers of one day.

## Screenshot
![pomicons](https://github.com/gabrielelana/vim-airline-tomato/raw/pomicons-configuration/.screenshot/pomicons.png)

## Thanks
> Gabriele Lana <gabriele.lana@gmail.com> (for providing awesome fonts)  
> [hellolj](https://github.com/hellolj) (for README gramma check)  
> [CodeFalling](https://github.com/CodeFalling) (for providing functions clock and countdown)  

## License
> [MIT](https://raw.githubusercontent.com/Zuckonit/vim-airline-tomato/master/LICENSE)


==============================================================================
vim:tw=78:ts=8:ft=help:norl:noet:fen:fdl=0:
