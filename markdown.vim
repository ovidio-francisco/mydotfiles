" Vim syntax file
" Language:     Markdown
" Maintainer:   Tim Pope <vimNOSPAM@tpope.org>
" Filenames:    *.markdown
" Last Change:  2016 Aug 29

if exists("b:current_syntax")
  finish
endif

if !exists('main_syntax')
  let main_syntax = 'markdown'
endif

runtime! syntax/html.vim
unlet! b:current_syntax

if !exists('g:markdown_fenced_languages')
  let g:markdown_fenced_languages = []
endif
for s:type in map(copy(g:markdown_fenced_languages),'matchstr(v:val,"[^=]*$")')
  if s:type =~ '\.'
    let b:{matchstr(s:type,'[^.]*')}_subtype = matchstr(s:type,'\.\zs.*')
  endif
  exe 'syn include @markdownHighlight'.substitute(s:type,'\.','','g').' syntax/'.matchstr(s:type,'[^.]*').'.vim'
  unlet! b:current_syntax
endfor
unlet! s:type

syn sync minlines=10
syn case ignore

syn match markdownValid '[<>]\c[a-z/$!]\@!'
syn match markdownValid '&\%(#\=\w*;\)\@!'

syn match markdownLineStart "^[<@]\@!" nextgroup=@markdownBlock,htmlSpecialChar

syn cluster markdownBlock contains=markdownH1,markdownH2,markdownH3,markdownH4,markdownH5,markdownH6,markdownBlockquote,markdownListMarker,markdownOrderedListMarker,markdownCodeBlock,markdownRule
syn cluster markdownInline contains=markdownLineBreak,markdownLinkText,markdownItalic,markdownBold,markdownCode,markdownEscape,@htmlTop,markdownError


syn match markdownBlockquote ">\%(\s\|$\)" contained nextgroup=@markdownBlock


syn match markdownLineBreak " \{2,\}$"

syn region markdownIdDeclaration matchgroup=markdownLinkDelimiter start="^ \{0,3\}!\=\[" end="\]:" oneline keepend nextgroup=markdownUrl skipwhite
syn match markdownUrl "\S\+" nextgroup=markdownUrlTitle skipwhite contained
syn region markdownUrl matchgroup=markdownUrlDelimiter start="<" end=">" oneline keepend nextgroup=markdownUrlTitle skipwhite contained
syn region markdownUrlTitle matchgroup=markdownUrlTitleDelimiter start=+"+ end=+"+ keepend contained
syn region markdownUrlTitle matchgroup=markdownUrlTitleDelimiter start=+'+ end=+'+ keepend contained
syn region markdownUrlTitle matchgroup=markdownUrlTitleDelimiter start=+(+ end=+)+ keepend contained

syn region markdownLinkText matchgroup=markdownLinkTextDelimiter start="!\=\[\%(\_[^]]*]\%( \=[[(]\)\)\@=" end="\]\%( \=[[(]\)\@=" nextgroup=markdownLink,markdownId skipwhite contains=@markdownInline,markdownLineStart
syn region markdownLink matchgroup=markdownLinkDelimiter start="(" end=")" contains=markdownUrl keepend contained
syn region markdownId matchgroup=markdownIdDelimiter start="\[" end="\]" keepend contained
syn region markdownAutomaticLink matchgroup=markdownUrlDelimiter start="<\%(\w\+:\|[[:alnum:]_+-]\+@\)\@=" end=">" keepend oneline

let s:concealends = has('conceal') ? ' concealends' : ''
exe 'syn region markdownItalic matchgroup=markdownItalicDelimiter start="\S\@<=\*\|\*\S\@=" end="\S\@<=\*\|\*\S\@=" keepend contains=markdownLineStart' . s:concealends
exe 'syn region markdownItalic matchgroup=markdownItalicDelimiter start="\S\@<=_\|_\S\@=" end="\S\@<=_\|_\S\@=" keepend contains=markdownLineStart' . s:concealends
exe 'syn region markdownBold matchgroup=markdownBoldDelimiter start="\S\@<=\*\*\|\*\*\S\@=" end="\S\@<=\*\*\|\*\*\S\@=" keepend contains=markdownLineStart,markdownItalic' . s:concealends
exe 'syn region markdownBold matchgroup=markdownBoldDelimiter start="\S\@<=__\|__\S\@=" end="\S\@<=__\|__\S\@=" keepend contains=markdownLineStart,markdownItalic' . s:concealends
exe 'syn region markdownBoldItalic matchgroup=markdownBoldItalicDelimiter start="\S\@<=\*\*\*\|\*\*\*\S\@=" end="\S\@<=\*\*\*\|\*\*\*\S\@=" keepend contains=markdownLineStart' . s:concealends
exe 'syn region markdownBoldItalic matchgroup=markdownBoldItalicDelimiter start="\S\@<=___\|___\S\@=" end="\S\@<=___\|___\S\@=" keepend contains=markdownLineStart' . s:concealends

syn region markdownCode matchgroup=markdownCodeDelimiter start="`" end="`" keepend contains=markdownLineStart
syn region markdownCode matchgroup=markdownCodeDelimiter start="`` \=" end=" \=``" keepend contains=markdownLineStart
syn region markdownCode matchgroup=markdownCodeDelimiter start="^\s*```.*$" end="^\s*```\ze\s*$" keepend

syn match markdownFootnote "\[^[^\]]\+\]"
syn match markdownFootnoteDefinition "^\[^[^\]]\+\]:"











" by ojf 16/07/2017

" xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

syn region markdownH1 matchgroup=markdownHeadingDelimiter start="^\s*#"      end="$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained
syn region markdownH2 matchgroup=markdownHeadingDelimiter start="^\s*##"     end="$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained
syn region markdownH3 matchgroup=markdownHeadingDelimiter start="^\s*###"    end="$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained
syn region markdownH4 matchgroup=markdownHeadingDelimiter start="^\s*####"   end="$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained
syn region markdownH5 matchgroup=markdownHeadingDelimiter start="^\s*#####"  end="$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained
syn region markdownH6 matchgroup=markdownHeadingDelimiter start="^\s*######" end="$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained


syn match markdownH1 "^.\+\n=\+$" contained contains=@markdownInline,markdownHeadingRule,markdownAutomaticLink
syn match markdownH2 "^.\+\n-\+$" contained contains=@markdownInline,markdownHeadingRule,markdownAutomaticLink
syn match markdownH3 "^.\+\n\~\+$" contained contains=@markdownInline,markdownHeadingRule,markdownAutomaticLink
syn match markdownH4 "^.\+\n[+]\+$" contained contains=@markdownInline,markdownHeadingRule,markdownAutomaticLink
syn match markdownH5 "^.\+\n[:]\+$" contained contains=@markdownInline,markdownHeadingRule,markdownAutomaticLink
syn match markdownH6 "^.\+\n[\^]\+$" contained contains=@markdownInline,markdownHeadingRule,markdownAutomaticLink

syn match markdownHeadingRule "^[\:\+\~=-]\+$" contained




syn match markdownOrderedListMarker "^\s*\([0-9]\+[\ \.\-\)]\+\)\+" contained 
syn match markdownListMarker "^\s*[-*+]\ " contained

syn match markdownRule "^\s*[=-]\{3,\}.*$" contained

syn match markdownRightArrow "^\s*-->"
syn match markdownRightArrow "-->"

syn region markdownBox start="+-" end="-+"

syn match markdownBox "^\s*|"
syn match markdownBox "|\s*$"



syn match markdownCheckBoxX "\[\zsx\ze\]"  
syn match markdownCheckBox  "^\s*-\s*\[[\ x]\]"        contains=markdownCheckBoxX


" xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx














if main_syntax ==# 'markdown'
  for s:type in g:markdown_fenced_languages
    exe 'syn region markdownHighlight'.substitute(matchstr(s:type,'[^=]*$'),'\..*','','').' matchgroup=markdownCodeDelimiter start="^\s*```\s*'.matchstr(s:type,'[^=]*').'\>.*$" end="^\s*```\ze\s*$" keepend contains=@markdownHighlight'.substitute(matchstr(s:type,'[^=]*$'),'\.','','g')
  endfor
  unlet! s:type
endif

syn match markdownEscape "\\[][\\`*_{}()<>#+.!-]"
syn match markdownError "\w\@<=_\w\@="

hi def link markdownH1                    htmlH1
hi def link markdownH2                    htmlH2
hi def link markdownH3                    htmlH3
hi def link markdownH4                    htmlH4
hi def link markdownH5                    htmlH5
hi def link markdownH6                    htmlH6
" hi def link markdownHeadingRule           markdownRule
hi def link markdownHeadingRule           Delimiter
hi def link markdownHeadingDelimiter      Delimiter
hi def link markdownOrderedListMarker     markdownListMarker
hi def link markdownListMarker            htmlTagName
hi def link markdownBlockquote            Comment
hi def link markdownRule                  PreProc

hi def link markdownFootnote              Typedef
hi def link markdownFootnoteDefinition    Typedef

hi def link markdownLinkText              htmlLink
hi def link markdownIdDeclaration         Typedef
hi def link markdownId                    Type
hi def link markdownAutomaticLink         markdownUrl
hi def link markdownUrl                   Float
hi def link markdownUrlTitle              String
hi def link markdownIdDelimiter           markdownLinkDelimiter
hi def link markdownUrlDelimiter          htmlTag
hi def link markdownUrlTitleDelimiter     Delimiter

hi def link markdownItalic                htmlItalic
hi def link markdownItalicDelimiter       markdownItalic
hi def link markdownBold                  htmlBold
hi def link markdownBoldDelimiter         markdownBold
hi def link markdownBoldItalic            htmlBoldItalic
hi def link markdownBoldItalicDelimiter   markdownBoldItalic
hi def link markdownCodeDelimiter         Delimiter

hi def link markdownEscape                Special
hi def link markdownError                 Error

hi markdownBox ctermfg=green
hi markdownArrow ctermfg=red

hi def link markdownRightArrow            markdownArrow
hi def link markdownBox                   markdownBox
hi def link markdownCheckBox			  markdownArrow
" hi def link markdownCheckBoxO			  markdownArrow
" hi def link markdownCheckBoxC			  markdownArrow
hi def link markdownCheckBoxX			  markdownBox


let b:current_syntax = "markdown"
if main_syntax ==# 'markdown'
  unlet main_syntax
endif

" vim:set sw=2:







" http://vimdoc.sourceforge.net/htmldoc/syntax.html#syntax


" syn region markdownBox start="^\s*|" end="|\s*$"

" syn match markdownCheckBox  "-\ \[x\]"  

" syn match markdownCheckBox  "-\ \[x\zs\]"    
" syn match markdownCheckBox  "foo\zsbar\ "    
" syn match markdownCheckBoxX "\[\zsx\ze\]"  


" syn region markdownCheckBox start="-\ \[\zex\]" end="\[x\zs\]"




" syn match markdownOrderedListMarker "^\s*\d\+[\ \.\-\)]*" contained
" syn match markdownOrderedListMarker "\%(\t\| \{0,4}\)\<\d\+\.\%(\s\+\S\)\@=" 



" xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

" syn match markdownCheckBoxX "\[\zsx\ze\]"  
" syn match markdownCheckBoxO  "\[x\zs\]"    
" syn match markdownCheckBoxC  "-\ \[\zex\]"  

" xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


" syn match markdownCheckBox "-\ \[x\]" contains=markdownCheckBoxX


" syn region markdownCheckBox start="-\ \[\zex\]" end="\]" contains markdownCheckBoxX


