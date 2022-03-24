" ------------------------------------
" Author:      Ovídio José Francisco
" Description: My vim dotfile
" Created:     July, 2017
" ------------------------------------


filetype indent plugin on              " Detect filetype, indent and load plugins for spefific file types
syntax on                              " Enable syntax highlighting
set nocompatible                       " Necesary for lots of cool vim things
set wildmenu                           " Makes command-line completion operates in an anhanced mode
set hlsearch                           " Highlight the search matches
set ignorecase                         " Ignore case in a pattern
set smartcase                          " Ignore case when the patter contais lowercase letters only
set mouse=a                            " Enable the mouse for all modes
set showcmd                            " Show partial commands in the last line of the screen
set backspace=indent,eol,start         " Allow backspacing over autoindent, line breaks and start of insert action
set nostartofline                      " Stop certain movements from always going to the first character of a line
set autoindent                         " When opening a new line and no filetype-specific indenting is enabled
set smartindent                        " Autoindent new lines
set ruler                              " Display the cursor position on the last line or in the status line
set confirm                            " Raise a dialogue asking if you wish to save changed files or override it
set visualbell                         " Use visual bell instead of beeping when doing something wrong
set t_vb=                              " Reset the terminal code for the visual bell. 
set number                             " Display line numbers on the left
set shiftwidth=4                       " Indentation settings for using hard tabs for indent. 
set tabstop=4                          " Display tabs as four characters wide.
set ttimeout ttimeoutlen=20            " Quickly time out on keycodes
set notimeout                          " Never time out on mappings
set pastetoggle=<F10>                  " Specify F10 to toggle the 'paste' option
set rtp+=~/.vim/bundle/Vundle.vim      " Sets the run time path, where vim will search for runtime files
set showmatch                          " Briefly jumps to the matching bracket when it is inserted
set laststatus=2                       " Determines that the window always have a status line
set wrap                               " Soft wrap
set linebreak                          " Break at word boundary
set display=truncate                   " When last line is too long, put the @ at line numbers and display text as much as possible
set formatoptions=qro                  " The letters which influence how to autoformat texts. Run :verb set formatopitions 
set virtualedit=onemore,block          " Allow virtual editing and allow the cursor to move one more beyond the line end
set spelllang=pt,en                    " Sets the laguages when spell cheking is on
set encoding=utf8                      " Set the encoding used to read the file
set fileencoding=utf8                  " Set the encoding to use when saving the file
set noshowmode                         " Do not show mode in status line
set nojoinspaces                       " Do not insert an extra space after .?! with join command
set clipboard=unnamedplus              " Use the + instead * that means it share the content with the OS
set shortmess+=F                       " Don't give the file info when editing a file
set gcr+=a:blinkon0                    " The cursor should look like in all modes and no blink
set splitbelow                         " Put new windows below the current one

" set cpoptions-=n                     " Removes n from Vi-Compatible options. Number column will not be used for wrapped lines



colorscheme elflord


call vundle#begin() 
	Plugin 'scrooloose/nerdtree'
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'itchyny/lightline.vim'
	Plugin 'junegunn/goyo.vim'
	Plugin 'mattn/emmet-vim'
	Plugin 'tpope/vim-surround'
	Plugin 'majutsushi/tagbar'
	Plugin 'scrooloose/nerdcommenter' 
	Plugin 'lervag/vimtex'
	Plugin 'dkarter/bullets.vim'
	Plugin 'dense-analysis/ale'
	Plugin 'maximbaz/lightline-ale' 
	Plugin 'jszakmeister/vim-togglecursor' 
	Plugin 'jelera/vim-javascript-syntax'
	" Themes
	Plugin 'rakr/vim-one'
	Plugin 'nanotech/jellybeans.vim'
call vundle#end()

  


" ------------------------------------------------------------
" ----------------------- AUTO COMMANDS ----------------------
" ------------------------------------------------------------


" Execute automatically when the user doesn't press a key for the time specified with updatetime	

autocmd CursorHold * checktime                             " Check if the file was chaged outside vim
autocmd CursorHold * echo ''							   


" Execute automatically on {event} for a file matching
autocmd BufRead,BufNewFile *.tex  call SetTexConfig()
autocmd BufRead,BufNewFile *.html call SetHTMLConfig()
autocmd BufRead,BufNewFile *.js   call SetJavaScriptConfig()
autocmd BufRead,BufNewFile *.md   call SetMarkdownConfig()
autocmd BufRead,BufNewFile *.py   call SetPythonConfig()
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimResized * call ChangeStatusLine()




" ------------------------------------------------------------
" ------------------ CONFIGURE SOME PLUGINS ------------------
" ------------------------------------------------------------

" LaTeX
let g:vimtex_compiler_latexmk = {'callback' : 0}
let g:vimtex_complete_close_braces = 1
let g:tex_flavor = 'latex'


" Markdown
let g:vim_markdown_folding_disabled = 1
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh'] " https://github.com/tpope/vim-markdown


" NERDTree
let NERDTreeQuitOnOpen = 1
let NERDTreeHighlightCursorline=1
let NERDTreeMinimalUI = 1
let g:NERDSpaceDelims = 1

let g:tagbar_autoclose = 1
let g:tagbar_compact = 1
let g:tagbar_iconchars = ['▸', '▾']


" BULLETS
let g:bullets_enabled_file_types = [ 
	\ 'markdown',
    \ 'text'
    \]


" LIGHTLINE-ALE
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = " "
let g:lightline#ale#indicator_errors = " "
let g:lightline#ale#indicator_ok = ""

let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_change_sign_column_color = 1
let g:ale_enabled = 0
" let g:ale_sign_column_always = 1
" let g:ale_sign_highlight_linenrs = 1
" set omnifunc=ale#completion#OmniFunc


let g:user_emmet_leader_key='<C-K>'




" ------------------------------------------------------------
" ------------------------ My remaps -------------------------
" ------------------------------------------------------------

" Free key maps
" <C-\> 
" <C-p> 
" <C-b> 



" =========================
" Make some shortcuts
" =========================


nnoremap <cr> zz

nnoremap <backspace> g;

" Back to Normal Mode
inoremap <C-L> <ESC>


" Save & Quit
nnoremap <F1>        :q<CR> 
vnoremap <F1> <ESC>  :q<CR> 
inoremap <F1> <ESC>
nnoremap <F2>        :w<CR>
vnoremap <F2> <ESC>  :w<cr>
inoremap <F2> <ESC>  :w<cr>

nnoremap ; :call NERDComment(0,"toggle")<cr>
vnoremap ; :call NERDComment(0,"toggle")<cr>

nnoremap <F3> :NERDTreeToggle<cr>
nnoremap <leader><F3> :TagbarToggle<cr>



" =========================
" Changing some defaults
" =========================


" make j and k go to the next/previous visual line
nnoremap j gj
nnoremap k gk

nnoremap gg gg^

nnoremap p gp
nnoremap P gP

nnoremap Y y$


" Go to next char search
" Go to previous char search
nnoremap , ;   
nnoremap <tab> ,


" Do nothing 
nnoremap ZZ        :echo "do nothing :)"<cr>
noremap <c-w><c-q> :echo "do nothing :)"<cr>

nnoremap B ge


" Goyo --> Distraction Free Writing
nnoremap <F4><F4>      :Goyo<CR>




" =========================
" Make some functionalities
" =========================



nnoremap <space> viw
vnoremap <space> v

" Move lines
nnoremap <C-j>      :m .+1 <CR>==
nnoremap <C-k>      :m .-2 <CR>==
vnoremap <C-j>      :m '>+1<CR>gv=gv
vnoremap <C-k>      :m '<-2<CR>gv=gv

" Duplicate current line
nnoremap <C-L> <ESC>:t.<CR>l

" Replicate the current char
nnoremap g. ylP

" Clear current line
nnoremap cl ^D

" Set/unset Transparent Bakcground 
nnoremap <F5>      :call ToggleTransparentBG()<CR>    

" Set/unset Show Blank chars
nnoremap <F6>      :call ToggleShowBlanks()<CR>:call ToggleShowBreaks()<cr>


" Spot the cursor
nnoremap <F7><F7>      :call ToggleHiglightTheCursor()<CR>


" Relative line numbers
nnoremap <F7><F8> : set rnu<cr>:set cursorline<cr>:highlight CursorLineNr ctermfg=white<cr>: highlight LineNr  ctermfg=darkgray<cr>


" Toggle Spell Check
nnoremap <s-F9>      :set spell!<cr>
inoremap <s-F9> <c-o>:set spell!<cr>


" Code check
noremap <F9> :ALEToggle<cr>



" Insert line in Normal Mode
nnoremap m  i<CR><esc>
nnoremap <leader>m  o<esc>
nnoremap <leader>M  O<esc>
nnoremap zm  o<esc>
nnoremap zM  O<esc>



" Scrool screen and move the cursor in the oposite direction
nnoremap <down> <c-e>gj
nnoremap <up>   <c-y>gk


" Scrool screen Up
nnoremap <s-up>   <c-y>gk
nnoremap <c-s>    <c-e>gj

nnoremap <silent>K kJ

" Highlights the cursor line
nnoremap <Leader>h  :set cursorline!<cr>:highlight CursorLineNr ctermfg=darkred<cr>

nnoremap <Leader>w  :set wrap!<cr>

nnoremap <Leader>\| :vsplit<cr>
nnoremap <Leader>-  :split<cr>


" Disable/Enable highlight in search
let hlstate=1
nnoremap <silent><f8> :if (hlstate == 1) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate =! hlstate<cr>


nnoremap <Leader>_ :new<cr>


" Create an empty Window at the Left
nnoremap <f4><f1>  :vnew<cr>
nnoremap <Leader>n :vnew<cr>

" Create an empty Window at the Bottom
nnoremap <Leader>_ :new<cr>
nnoremap <f4><f1>  :new<cr>
 
" Change to next window
nnoremap <s-tab> <c-w>w
inoremap <s-tab> <esc><c-w>w
		





" =========================
" Make some improviments
" =========================


" Break undo sequence, start new change        
" See i_CTRL-G_u
inoremap <space> <space><c-g>u
inoremap <cr> <cr><c-g>u
inoremap <bs> <bs><c-g>u
inoremap . .<c-g>u
inoremap , ,<c-g>u


" Black hole register
vnoremap <leader>d "_d
nnoremap <leader>x "_x
nnoremap <leader>s "_s
nnoremap <leader>dd "_dd
nnoremap <leader>D "_D
nnoremap <leader>C "_C
nnoremap <leader>S "_S
nnoremap <leader>b "_


nnoremap ~ ~h

" Indent/Unindent and reselect
:vnoremap < <gv
:vnoremap > >gv





" ------------------------------------------------------------
" ------------------------ FUNCITONS -------------------------
" ------------------------------------------------------------



let s:tb = 0 "transparent background
function ToggleTransparentBG()
	if s:tb 
		highlight Normal ctermbg=NONE
	else
		highlight Normal ctermbg=black
	endif

	let s:tb =! s:tb
endfunction



let w:myshowbreak=' →  ' 
let w:slb=0 "show line breaks
function ToggleShowBreaks()

	if w:slb
		set showbreak=""
		set cpoptions-=n " Removes n from Vi-Compatible options. 
		                 " Number column will not be used for wrapped lines
	else
		let &showbreak=w:myshowbreak
		set cpoptions+=n
	endif

	let w:slb =! w:slb

endfunction


let s:sb = 0 " show blank chars
function ToggleShowBlanks()

	if s:sb
		set nolist
	else
		set list
		set listchars=tab:»\ ,eol:¬,space:·
		highlight SpecialKey ctermfg=darkgray
		"highlight NonText ctermfg=darkgray
	endif

	let s:sb =! s:sb

endfunction


let s:hc = 1  " Highlight the Cursor
function ToggleHiglightTheCursor() 
	
	if s:hc
		set cursorline
		set cursorcolumn
	
		let l:color = '234'	

		exe 'highlight CursorLine   cterm=NONE ctermbg=' . l:color
		" exe 'highlight CursorColumn cterm=NONE ctermbg=' . l:color
	else
		set nocursorline
		set nocursorcolumn

		highlight CursorLine   cterm=NONE ctermbg=none
		highlight CursorColumn cterm=NONE ctermbg=none
		highlight CursorLineNr cterm=NONE ctermfg=lightgray
	endif

	let s:hc =! s:hc

endfunction




function SetTexConfig() 
	set filetype=tex  " to avoid the plaintex filetype - note it's plainTEX not plainTEXT

	let w:myshowbreak='       '
	set cpoptions+=n
	call MakeTexAbrevs()

	let w:slb = 0
	call ToggleShowBreaks()

	" Set/unset Show Blank chars
	nnoremap <F6>      :call ToggleShowBlanks()<CR>
	inoremap <F6> <c-o>:call ToggleShowBlanks()<CR>

	" let g:text_comment_nospell=1
	set spell

	let g:NERDTreeIgnore = ['\.aux$']

	hi texAbstract cterm=italic
	
	hi VimtexTocTodo ctermfg=yellow ctermbg=none
	hi VimtexTocHelp ctermfg=darkcyan cterm=none
	hi VimtexTocSec0 ctermfg=white cterm=bold
	hi VimtexTocSec1 ctermfg=gray cterm=none
	hi VimtexTocSec2 ctermfg=darkgray cterm=none

endfunction



function SetHTMLConfig()

	inoremap <buffer> >> ></<C-x><C-o><esc>F<i
	inoremap <buffer> >. ></<C-x><C-o><esc>F<i<cr><esc>O

	" see also: https://vi.stackexchange.com/questions/9672/how-to-generate-closing-tags-for-html
endfunction


function SetJavaScriptConfig()
	set background=dark   
	colorscheme one
endfunction

function SetPythonConfig()
	colorscheme one
	highlight Normal ctermfg=white
	set expandtab!
endfunction

function SetMarkdownConfig()

	syn match markdownRightArrow "^\s*-->"
	syn match markdownRightArrow "-->"

	syn region markdownBox start="+-" end="-+"
	syn match  markdownBox "^\s*|"
	syn match  markdownBox "|\s*$"

	syn match markdownTimeSep     "\d\{1,2\}\zs[:hm]\ze\d\{1,2\}" contained
	syn match markdownTime              "\d\{1,2\}[:hm]\d\{1,2\}" contains=markdownTimeSep
	syn match markdownTime    "\d\{1,2\}h\d\{1,2\}[:hm]\d\{1,2\}" contains=markdownTimeSep

	syn match markdownQuote  "\"" contained
	syn match markdownString "\".*\"" contains=markdownQuote

	syn match markdownQuote2  "\'" contained
	syn match markdownString2 "\'.*\'" contains=markdownQuote2

	syn match markdownTagSep   "[;,.]"  contained
	syn match markdownBrackts  "[\[\]]" contained
	syn match markdownTags     "\[.*\]" contains=markdownBrackts,markdownTagSep

	syn match markdownDashedTextDashes "--" contained
	syn match markdownDashedText "--.*--" contains=markdownDashedTextDashes

	syn match markdownTagSep2   "[;,.]"  contained
	syn match markdownBrackts2  "[<>]" contained
	syn match markdownTags2     "<.*>" contains=markdownBrackts2,markdownTagSep2

	syn match markdownOKBoxText "\[\zs\s*\(OK\|SIM\)\s*\ze\]"  
	syn match markdownNOBoxText "\[\zs\s*\(NO\|NAO\)\s*\ze\]"  
	syn match markdownOKBox    "^\s*\[\s*\(OK\|SIM\)\s*\]"        contains=markdownOKBoxText
	syn match markdownNOBox    "^\s*\[\s*\(NO\|NAO\)\s*\]"        contains=markdownNOBoxText
	syn match markdownNOEmpty  "^\s*\[\s*\]"

	syn match markdownCheckBoxX "\[\zsx\ze\]"  
	syn match markdownCheckBox  "^\s*-\s*\[[\ x]\]"        contains=markdownCheckBoxX

	syn match markdownOK "^OK\ze\s."


	" --------------------------------------------------------------------------------	
	" --------------------------------------------------------------------------------	


	hi markdownOK               ctermfg=green 
	hi markdownBox              ctermfg=green
	hi markdownOKBox            ctermfg=red
	hi markdownNOBox            ctermfg=red
	hi markdownNOEmpty          ctermfg=red
	hi markdownOKBoxText        ctermfg=green
	hi markdownNOBoxText        ctermfg=gray
	hi markdownArrow            ctermfg=red
	hi markdownTime             ctermfg=cyan
	hi markdownTimeSep          ctermfg=darkcyan
	hi markdownString           cterm=italic
	hi markdownQuote            ctermfg=darkmagenta
	hi markdownString2          cterm=italic ctermfg=darkgreen
	hi markdownQuote2           ctermfg=green
	hi markdownTags             cterm=italic ctermfg=darkyellow
	hi markdownBrackts          ctermfg=yellow
	hi markdownTagSep           ctermfg=yellow
	hi markdownTags2            cterm=italic ctermfg=darkred
	hi markdownBrackts2         ctermfg=red
	hi markdownTagSep2          ctermfg=red
	hi markdownSectionMarker    ctermfg=blue
	hi markdownDashedText       cterm=italic
	hi markdownDashedTextDashes ctermfg=white

	hi def link markdownRightArrow            markdownArrow
	hi def link markdownBox                   markdownBox
	hi def link markdownCheckBox			  markdownArrow

	hi def link markdownCheckBoxX			  markdownBox


	hi markdownH2                cterm=none ctermfg=cyan 
	hi markdownH3                cterm=none ctermfg=darkcyan 
	hi markdownH4                cterm=none ctermfg=magenta
	hi markdownH5                cterm=none ctermfg=darkmagenta 
	hi markdownH6                cterm=none ctermfg=red 
	hi markdownListMarker        cterm=bold ctermfg=red
	hi markdownOrderedListMarker cterm=none ctermfg=red
	hi markdownRule                         ctermfg=darkcyan


	let g:markDownCheckBoxCheckedChar='x'
	let g:markDownCheckBoxUnCheckedChar=' '
	function! CheckTheBox() 

		let line = getline(".")
		let rege = "^\\s*\\zs-\\s*\\[[\\".g:markDownCheckBoxUnCheckedChar.g:markDownCheckBoxCheckedChar."]\\]"
		let startBox = match(line, rege)  		
		let endBox = match(line, "^\\s*-\\s*\\[[\\ x]\\zs\\]")

		if startBox < 0  
			exec 'normal viw'
			return  
		endif

		let colu = col(".")-1
		let char = line[endBox-1]
		let curp = getcurpos()

		" echo "debug: box".colu."-".char."=".startBox." ".endBox

		if colu >= startBox && colu <= endBox
			if char == g:markDownCheckBoxCheckedChar   | let newchecbox = '['.g:markDownCheckBoxUnCheckedChar.']' | endi	
			if char == g:markDownCheckBoxUnCheckedChar | let newchecbox = '['.g:markDownCheckBoxCheckedChar.  ']' | endi	
				
			let brackets = "\\[[\\".char."]\\]"

			exec 's/'.brackets.'/'.newchecbox.'/'
			call setpos('.', curp)
		endif
	endfunction

	" Check/Uncheck the CheckBox
	nnoremap <buffer><silent> <space> :call CheckTheBox()<cr>
endfunction





" ----------------------------
" Functions for the status bar
" ----------------------------


function GetBuffCount()
	return len(getbufinfo({'buflisted':1}))
endfunction


function GetLang() 
	if &spell
		return &spelllang
	else
		return 'no spell'
	endif
endfunction

function GetMode() 
	let mode = lightline#mode()

	if mode == 'NORMAL'
		return '      '
	else
		return mode

endfunction


function MyLineInfo()                               " replacing the original component 'lineinfo'
	return printf('%d:%d', line('.'), col('.'))
endfunction 



function ChangeStatusLine()
	
	let w = winwidth(0)

	if w < 60
		set laststatus=0
		set noshowmode
	else
		set laststatus=2
		set showmode  
	endif
endfunction




" ------------------------------------------------------------
" ------------------------ HIGHLIGHTS ------------------------
" ------------------------------------------------------------


highlight CursorLine   cterm=NONE ctermbg=none
highlight CursorColumn cterm=NONE ctermbg=none
highlight CursorLineNr cterm=NONE ctermfg=lightgray


highlight ALESignColumnWithErrors              ctermbg=none
highlight ALESignColumnWithoutErrors           ctermbg=none
highlight ALEErrorSign            ctermfg=red  ctermbg=none


" Status Line
" darkgray and black block
highlight statuslinenc ctermbg=0 ctermfg=239
highlight statusline   ctermbg=0 ctermfg=239


highlight Directory        ctermfg=gray
highlight NERDTreeFile     ctermfg=gray
highlight NERDTreeDir      ctermfg=white
highlight NERDTreeDirSlash ctermfg=darkred

" Set Line numbers foreground color
highlight LineNr             ctermfg=darkgrey
highlight HtmlH1             cterm=bold
highlight markdownListMarker cterm=bold ctermfg=yellow

highlight MatchParen cterm=bold ctermbg=none
highlight VertSplit  cterm=none ctermbg=none ctermfg=darkgray
highlight ErrorMsg   cterm=none ctermbg=none ctermfg=red
highlight Search     ctermbg=darkmagenta ctermfg=white
highlight SpellBad   ctermbg=none ctermfg=red cterm=underline

highlight FoldColumn ctermbg=none


highlight htmlTitle ctermfg=white
hi def link htmlTag	htmlEndTag


" ------------------------------------------------------------
" ------------------------ STATUS BAR ------------------------
" ------------------------------------------------------------


" Color scheme based on jellybeans
" Delete de colorschemes folder, it is not necessary


let s:none    = [ '#000000', 'none' ]
let s:gray1   = [ '#666656', 239  ]
" let s:gray1   = [ '#666656', 241  ]
let s:yellow  = [ '#ffb964', 215 ]
let s:red     = [ '#cf6a4c', 196 ]
let s:magenta = [ '#f0a0c0', 125 ]
let s:cyan    = [ '#8fbfdc', 110 ]
let s:green   = [ '#000000', 71 ]
let s:blue    = [ '#000000', '31' ]
let s:pink    = [ '#000000', '205' ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left    = [ [ s:blue, s:none, ], [ s:gray1, s:none ] ]
let s:p.normal.right   = [ [ s:none, s:none ], [ s:none, s:none ] ]
let s:p.normal.middle  = [ [ s:gray1, s:none ] ]
let s:p.normal.error   = [ [ s:red, s:none ] ]
let s:p.normal.warning = [ [ s:yellow, s:none ] ]

let s:p.insert.left    = [ [ s:green, s:none ],   [ s:gray1, s:none ] ]
let s:p.replace.left   = [ [ s:red, s:none ],     [ s:gray1, s:none ] ]
let s:p.visual.left    = [ [ s:pink, s:none ],    [ s:gray1, s:none ] ]

let s:p.inactive.right  = [ [ s:gray1, s:none ], [ s:gray1, s:none ] ]
let s:p.inactive.left   = [ [ s:gray1, s:none ], [ s:gray1, s:none ] ]
let s:p.inactive.middle = [ [ s:gray1, s:none ] ]

let s:p.tabline.left    = [ [ s:none, s:gray1 ] ]
let s:p.tabline.tabsel  = [ [ s:none, s:none ] ]
let s:p.tabline.middle  = [ [ s:none, s:none ] ]
let s:p.tabline.right   = copy(s:p.normal.right)

let g:lightline#colorscheme#myojf#palette = lightline#colorscheme#flatten(s:p)



let lineComponent1 = { 
	\   'buff': '%{GetBuffCount()}',
	\   'mylineinfo': '%3.6l:%-3.6c',
	\   'char': '%-2.2B',
	\ }


let lineComponent2 = { 
	\   'mymode': '%{GetMode()}',
	\   'mylineinfo': '%3.6l:%-3.6c',
	\   'char': '%-2.2B',
	\ }

let lineActive1 = {
	\   'left' : [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ],
	\   'right': [ [ 'mylineinfo' ],
	\              [ 'percent' ],
	\              [ 'buff', 'spell', 'fileformat', 'fileencoding', 'filetype' ],
	\              [ 'linter_errors', 'linter_warnings'] ]
	\ }

let lineActive2 = {
	\   'left' : [ [ 'mymode'] ],
	\   'right': [ [ 'mylineinfo' ],
	\              [ 'percent' ],
	\              [ 'spell', 'paste', 'readonly', 'modified', 'filename', 'filetype' ],
	\              [ 'linter_errors', 'linter_warnings'] ]
	\ }

let lineInactive1 = {
	\   'left' : [ [ ], [ 'readonly', 'filename', 'modified' ] ],
	\   'right': [ [ ], [ ], [ 'filetype' ] ]
	\ }

let line1 = {
	\ 'colorscheme': 'myojf',
	\ 'active'     : lineActive1, 
	\ 'inactive'   : lineInactive1,
	\ 'component'  : lineComponent1,
	\ }

let line2 = {
	\ 'colorscheme': 'myojf',
	\ 'active'     : lineActive2, 
	\ 'inactive'   : lineInactive1,
	\ 'component'  : lineComponent2,
	\ }


let g:lightline = line1


let g:lightline.component_expand = {
	  \  'linter_checking': 'lightline#ale#checking',
	  \  'linter_warnings': 'lightline#ale#warnings',
	  \  'linter_errors': 'lightline#ale#errors',
	  \  'linter_ok': 'lightline#ale#ok',
	  \ }

let g:lightline.component_type = {
	  \     'linter_warnings': 'warning',
	  \     'linter_errors': 'error',
	  \ } 


let g:lightline.subseparator = { 'left': '', 'right': ' ⃓' }







