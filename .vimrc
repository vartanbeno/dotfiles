syntax on
set ruler
set tabstop=4
au FileType gitcommit set tw=72

set mouse=a
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end
