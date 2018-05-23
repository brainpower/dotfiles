" Vim color file
" Filename:      bp.vim
" Purpose:       A dark colorsheme for vim
" Authors:       (c) 2013-2018 brainpower <brainpower at mailbox dot org>
" License:       This file is licensed under the GPL v2.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" a colorsheme for dark terminal backgrounds with a lot of blue
" works best with 256 color mode or GUI

" First remove all existing highlighting.
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "bp"

hi Normal                                                                                                   guifg=#52c2f5    guibg=#000000
hi NonText          term=bold           cterm=bold           ctermfg=4                   gui=bold           guifg=#0000ff

" vim look {{{
hi SpecialKey       term=bold                                ctermfg=4                                      guifg=#000080
hi Directory        term=bold                                ctermfg=4                                      guifg=#000080
hi ErrorMsg         term=standout       cterm=bold           ctermfg=7   ctermbg=1       gui=bold           guifg=#ffffff   guibg=#800000
hi IncSearch        term=reverse        cterm=reverse                                    gui=reverse
hi Search           term=reverse                             ctermfg=1   ctermbg=3                          guifg=#800000   guibg=#808000
hi MoreMsg          term=bold                                ctermfg=2                                      guifg=#008000
hi ModeMsg          term=bold           cterm=bold                                       gui=bold
hi LineNr           term=underline                           ctermfg=238                                    guifg=#444444
hi Question         term=standout                            ctermfg=2                                      guifg=#008000
hi StatusLine       term=bold,reverse   cterm=none           ctermfg=0   ctermbg=39      gui=none           guifg=#000000   guibg=#00afff
hi StatusLineNC     term=reverse        cterm=none           ctermfg=0   ctermbg=250     gui=none           guifg=#000000   guibg=#bcbcbc
hi VertSplit        term=reverse        cterm=reverse                                    gui=reverse
hi Title            term=bold                                ctermfg=5                                      guifg=#800080
hi Visual           term=reverse        cterm=reverse                                    gui=reverse
hi VisualNOS        term=bold,underline cterm=bold,underline                             gui=bold,underline
hi WarningMsg       term=standout                            ctermfg=1                                      guifg=#800000
hi WildMenu         term=standout                            ctermfg=0   ctermbg=3                          guifg=Black     guibg=#808000
hi Folded           term=standout                            ctermfg=65  ctermbg=235                        guifg=#5f875f   guibg=#262626
hi FoldColumn       term=standout                            ctermfg=65  ctermbg=236                        guifg=#5f875f   guibg=#303030
hi DiffAdd          term=bold                                ctermfg=9   ctermbg=233                        guifg=#ff0000   guibg=#121212
hi DiffChange       term=bold                                            ctermbg=234                                        guibg=#1c1c1c
hi DiffDelete       term=bold           cterm=bold           ctermfg=2   ctermbg=233     gui=bold           guifg=#00ff00   guibg=#121212
hi DiffText         term=reverse        cterm=bold           ctermfg=0   ctermbg=1       gui=bold           guifg=#808080   guibg=#800000
hi Cursor                                                                                                   guifg=bg        guibg=fg
hi lCursor                                                                                                  guifg=bg        guibg=fg
hi MatchParen       term=bold           cterm=bold           ctermfg=1   ctermbg=0       gui=bold           guifg=#ff0000   guibg=#000000
hi Pmenu            term=standout                            ctermfg=81  ctermbg=236                        guifg=#52c2f5   guibg=#303030
hi PmenuSel         term=reverse                             ctermfg=236 ctermbg=81                         guifg=#303030   guibg=#52c2f5
hi SpellBad         term=reverse        cterm=bold           ctermfg=7   ctermbg=1       gui=bold           guifg=#ffffff   guibg=#800000
hi SpellCap         term=standout       cterm=none           ctermfg=1   ctermbg=none    gui=none           guifg=#800000
hi IndentGuidesOdd                                                       ctermbg=235                                        guibg=#262626
hi IndentGuidesEven                                                      ctermbg=233                                        guibg=#121212
"}}}

" Colors for syntax highlighting {{{
hi Comment          term=bold                                ctermfg=240                                    guifg=#585858


hi Constant         term=underline                           ctermfg=22                                     guifg=#005f00
"special constants:
hi String           term=underline                           ctermfg=28                                     guifg=#008700
hi Character        term=underline                           ctermfg=22                                     guifg=#005f00
hi Number           term=underline                           ctermfg=34                                     guifg=#00af00
hi Boolean          term=underline                           ctermfg=58                                     guifg=#5f5f00
hi Float            term=underline                           ctermfg=70                                     guifg=#5faf00


hi Identifier       term=underline                           ctermfg=31                  gui=none           guifg=#0087af
"special identifiers
hi Function         term=underline                           ctermfg=202                 gui=none           guifg=#ff5f00


hi Statement        term=bold           cterm=bold           ctermfg=184                 gui=bold           guifg=#dfdf00
"special statements
" hi link Conditional Statement
" hi link Repeat Statement
" hi link Label       Statement
hi Operator         term=bold                                ctermfg=220                                    guifg=#ffdf00
" hi link Keyword Statement
" hi link Exception   Statement


hi PreProc          term=underline                           ctermfg=3                                      guifg=#aa5500
"special preproc
" hi link Include PreProc
" hi link Define  PreProc
" hi link Macro       PreProc
" hi link PreCondit   PreProc


hi Type             term=underline      cterm=bold           ctermfg=27                  gui=bold           guifg=#005fff
"special types
hi StorageClass     term=underline                           ctermfg=21                                     guifg=#0000ff
hi Structure        term=underline                           ctermfg=27                                     guifg=#005fff
" hi link Typedef Type


hi Special          term=bold                                ctermfg=11                                     guifg=#ffff00
"special Special:
" hi link SpecialChar Special
" hi link Tag     Special
" hi link Delimiter   Special
" hi link SpecialComment Special
" hi link Debug       Special


"hi Underlined ...

hi Ignore                               cterm=bold          ctermfg=7                    gui=bold           guifg=#ffffff

hi Error            term=reverse        cterm=bold          ctermfg=7   ctermbg=1        gui=bold           guifg=#ffffff   guibg=#800000

hi Todo             term=standout                           ctermfg=1   ctermbg=none                        guifg=#800000   guibg=bg

"}}}

"addons {{{
" easytags {{{

"hi link awkFunctionTag Identifier
"hi link csClassOrStructTag Identifier
"hi link csMethodTag Identifier
"hi link cTypeTag Identifier
"hi link cEnumTag Identifier
hi link cPreProcTag PreProc
hi link cMemberTag Identifier
"hi link cFunctionTag Identifier
"hi link javaClassTag Identifier
"hi link javaInterfaceTag Identifier
"hi link javaMethodTag Identifier
"hi link luaFuncTag Identifier
"hi link perlFunctionTag Identifier
"hi link phpFunctionsTag Identifier
"hi link phpClassesTag Identifier
"hi link pythonFunctionTag Identifier
"hi link pythonMethodTag Identifier
"hi link pythonClassTag Identifier
"hi link rubyModuleNameTag Identifier
"hi link rubyClassNameTag Identifier
"hi link rubyMethodNameTag Identifier
"hi link shFunctionTag Identifier
"hi link tclCommandTag Identifier
"hi link vimAutoGroupTag Identifier
"hi link vimCommandTag Identifier
"hi link vimFuncNameTag Identifier
"hi link vimScriptFuncNameTag Identifier

" }}}
"}}}
