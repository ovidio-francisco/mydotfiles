" =============================================================================
" Filename: autoload/lightline/colorscheme/jellybeans.vim
" Author: itchyny
" License: MIT License
" Last Change: 2013/09/07 12:21:04.
" =============================================================================
let s:base03 = [ '#151513', 233 ]
let s:base02 = [ '#30302c ', 236 ]
let s:base01 = [ '#4e4e43', 239 ]
let s:base00 = [ '#666656', 242  ]
let s:base0 = [ '#808070', 244 ]
let s:base1 = [ '#949484', 246 ]
let s:base2 = [ '#a8a897', 248 ]
let s:base3 = [ '#e8e8d3', 253 ]
let s:yellow = [ '#ffb964', 215 ]
let s:orange = [ '#fad07a', 222 ]
let s:red = [ '#cf6a4c', 167 ]
let s:magenta = [ '#f0a0c0', 217 ]
let s:blue = [ '#8197bf', 103 ]
let s:cyan = [ '#8fbfdc', 110 ]
let s:green = [ '#99ad6a', 107 ]


let s:ins0 = [ '#99ad6a', 107 ]
let s:ins1 = [ '#99ad6a', 106 ]
let s:ins2 = [ '#99ad6a', 108 ]


let s:green1  = [ '#000000',   2]
" let s:green2 = [ '#000000',  10]
let s:black1  = [ '#000000', 235]
let s:black2  = [ '#000000', 234]
let s:orange1 = [ '#000000', 202]

let s:darkestcyan = [ '#000000', 23]
let s:mediumcyan  = [ '#000000', 117]
let s:white    	  = [ '#000000', 231]
let s:darkblue 	  = [ '#000000', 31]
let s:darkestblue = [ '#000000', 24]



let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left   = [ [ s:base02, s:blue   ], [ s:base3, s:base01 ] ]
let s:p.normal.middle = [ [ s:base0 , s:base02 ]                        ]
let s:p.normal.right  = [ [ s:base02, s:base1  ], [ s:base2, s:base01 ] ]


let s:p.insert.left   = [ [ s:darkestcyan, s:white, 'bold'  ], [ s:white, s:darkblue ] ]
let s:p.insert.middle = [ [ s:mediumcyan, s:darkestblue ]                        ]
let s:p.insert.right  = [ [ s:darkestcyan, s:mediumcyan ], [ s:mediumcyan, s:darkblue ], [ s:mediumcyan, s:darkestblue ] ]

" let s:p.insert.left   = [ [ s:base02, s:green  ], [ s:base3, s:base01 ] ]
" let s:p.insert.middle = [ [ s:green1, s:base02 ]                        ]
" let s:p.insert.right  = [ [ s:orange1, s:black2  ], [ s:green1, s:black1 ] ]

" let s:p.insert.left   = [ [ s:base02, s:green  ], [ s:base3, s:base01 ] ]
" let s:p.insert.middle = [ [ s:base0 , s:base02 ]                        ]
" let s:p.insert.right  = [ [ s:base02, s:base1  ], [ s:base2, s:base01 ] ]



let s:p.replace.left = [ [ s:base02, s:red ], [ s:base3, s:base01 ] ]
let s:p.visual.left = [ [ s:base02, s:magenta ], [ s:base3, s:base01 ] ]
let s:p.tabline.left = [ [ s:base3, s:base00 ] ]
let s:p.tabline.tabsel = [ [ s:base3, s:base02 ] ]
let s:p.tabline.middle = [ [ s:base01, s:base1 ] ]
let s:p.tabline.right = copy(s:p.normal.right)
let s:p.normal.error = [ [ s:red, s:base02 ] ]
let s:p.normal.warning = [ [ s:yellow, s:base01 ] ]

let s:p.inactive.right = [ [ s:base02, s:base00 ], [ s:base0, s:base02 ] ]
let s:p.inactive.left =  [ [ s:base0, s:base02 ], [ s:base00, s:base02 ] ]
let s:p.inactive.middle = [ [ s:base00, s:base02 ] ]

let g:lightline#colorscheme#jellybeans#palette = lightline#colorscheme#flatten(s:p)

" https://github.com/itchyny/lightline.vim/blob/master/doc/lightline.txt
" https://github.com/admc/dotfiles/blob/master/.vim/autoload/Powerline/Colorschemes/default.vim
" let s:p.insert.left   = [ [ s:base02, s:green  ], [ s:base3, s:base01 ] ]
" let s:p.insert.right  = [ [ s:base02, s:base1  ], [ s:base2, s:base01 ] ]
" let s:p.insert.middle = [ [ s:base0 , s:base02 ]                        ]
