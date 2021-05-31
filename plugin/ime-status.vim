scriptencoding utf-8
" Description:  ime-status.vim: make sure there is no input method in normal mode
" Author:       YYC
" Version:      0.1
" URL:      
" ---------------------------------------------------------------------
let s:toDisableIME_exe = expand('<sfile>:h:h').'/bin/toDisableIME.exe'
let s:toEnableIME_exe = expand('<sfile>:h:h').'/bin/toEnableIME.exe'
function! ToDisableIME()
   let l:a = system(s:toDisableIME_exe)
endfunction

function! ToEnableIME()
   let l:a = system(s:toEnableIME_exe)
endfunction

"exit insert mode
autocmd InsertLeave * call ToDisableIME()
"enter insert mode
autocmd InsertEnter * call ToEnableIME()
"##### auto ahk with vim end ######
