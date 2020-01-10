set autoindent
set cindent
set tabstop=4
set shiftwidth=4
set expandtab
syntax on

function Comp()
    :w
    :!time g++ --std=c++11 -Wall -Wshadow -Wextra -Wpedantic -O2 -static -o _%< % -lm
endfunction

function Exec()
    :w     
    :!time g++ --std=c++11 -Wall -Wshadow -Wextra -Wpedantic -O2 -static -o _%< % -lm && ./_%<
endfunction

function Debug()
    :w
    :!time g++ --std=c++11 -Wall -Wshadow -Wextra -Wpedantic -O0 -o _%< % -lm -fsanitize=signed-integer-overflow -fsanitize=undefined -g -fsanitize=address && ./_%<
endfunction

function Input()
    :exec ":vs " . expand("%:r") . ".in"
endfunction

function Output()
    :exec ":vs " . expand("%:r") . ".out"
endfunction

function Okput()
    :exec ":vs " . expand("%:r") . ".ok"
endfunction

function RunBash()
    :w
    :!./%
endfunction

let mapleader = " "

map<leader>c :call Comp()<Return>
map<leader>e :call Exec()<Return>
map<leader>i :call Input()<Return>
map<leader>o :call Output()<Return>
map<leader>k :call Okput()<Return>
map<leader>d :call Debug()<Return>
map<leader>b :call RunBash()<Return>
