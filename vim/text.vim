" Place this in ~/.vim/syntax/text.vim and Vim will pick it up automagically for text files. (Must have `syntax on`)
" Vim syntax file
" Language: text
" Maintainer: Chris Penner
" Latest Revision: 14 May 2015

if exists("b:current_syntax")
  finish
endif

"----------------------------------------------------------------/
" Regex for capitalized words, add your own matches here:
syn match beginSentence '[A-Z][a-z]*'
syn match winbatchNumber        "\<[0-9]\+\(u\=l\=\|lu\|f\)\>"
syn match       rebolMoney      "\a*\$\d\+\('\d*\)*\([,.]\d\+\)\="
"----------------------------------------------------------------------------/
"  Setup syntax highlighting
"----------------------------------------------------------------------------/
"
let b:current_syntax = "text"

hi def link beginSentence       Typedef
hi def link winbatchNumber              Number
hi def link rebolMoney          Number
" Choose other options to get a different colour:
" Valid options: Comment Constant Function Keyword Operator PreProc Repeat Special Statement Type Typedef
