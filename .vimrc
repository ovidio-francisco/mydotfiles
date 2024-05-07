"------------------------------------             __   _ _ _ __ ___  _ __ ___  
" Author:      Ovídio José Francisco              \ \ / / | '_ ` _ \| '__/ __| 
" Description: My vim dotfile                     _\ V /| | | | | | | | | (__  
" Created:     July, 2017                        (_)\_/ |_|_| |_| |_|_|  \___| 
" -----------------------------------                                          


filetype indent plugin on           " Detect filetype, indent and load plugins for specific file types
syntax on                           " Enable syntax highlighting
set hlsearch                        " Highlight the search matches
set incsearch                       " Show search matches while typing
set ignorecase                      " Ignore case in a pattern
set smartcase                       " Ignore case when the patter contais lowercase letters only
set backspace=indent,eol,start      " Allow backspacing over auto indent, line breaks and start of insert action
set nostartofline                   " Stop certain movements from always going to the first character of a line
set autoindent                      " When opening a new line and no filetype-specific indenting is enabled
set smartindent                     " Autoindent new lines
set confirm                         " Raise a dialogue asking if you wish to save changed files or override it
set number                          " Display line numbers on the left
set tabstop=4                       " Display tabs as four characters wide.
set ttimeout ttimeoutlen=20         " Quickly time out on key codes
set notimeout                       " Never time out on mappings
set showmatch                       " Briefly jumps to the matching bracket when it is inserted
set matchtime=2                     " How briefly is the matching jump
set mouse=a                         " Enable the mouse for all modes
set linebreak                       " Break at word boundary
set display=truncate                " If last line can't fit, put an @ at line number and show as much as possible
set formatoptions=qro               " How to autoformat texts. Run :verb set formatopitions 
set virtualedit=block               " Allow virtual editing and ...
set spelllang=pt,en                 " Set the languages when spell chequing is on
set spellsuggest=fast,20            " Don't show too much suggestions. 'fast' for check simple changes
set encoding=utf8                   " Set the encoding used to read the file
set fileencoding=utf8               " Set the encoding to use when saving the file
set nojoinspaces                    " Do not insert an extra space after .?! with join command
set clipboard=unnamedplus           " Use the + instead * that means it share the content with the OS
set splitbelow                      " Put new windows below the current one
set showcmd                         " Show partial commands in the last line
set wildmenu                        " Makes command-line completion operates in an enhanced mode
set breakindent                     " Indent wrapped lines in order to preserve horizontal blocks
set breakindentopt=sbr              " Settings for 'breakindent'
set shiftwidth=4                    " Indentation settings for using hard tabs for indent.
set shiftround                      " Round indent to a multiple of 'shiftwidth'. Applied to > and <
set showmode                        " Show mode in status line
set laststatus=0                    " Determines how to display a status line
set guicursor=i:block,r:hor20       " Cursor shapes
set rtp+=~/.vim/bundle/Vundle.vim   " Sets the run time path, where vim will search for runtime files
set rtp+=~/.vim/myhelps

set rulerformat=%30(%R%M%=%-13.(%l,%v%)\ %P%)


let isVim       = !has('nvim')                                " [~] v
let isNeoVim    =  has('nvim')                                " [~] vim
let isNeoVimLua =  has('nvim') && !exists("$XDG_CONFIG_HOME") " [~] nvim


if !isNeoVimLua

call vundle#begin() 
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'itchyny/lightline.vim'
	Plugin 'junegunn/goyo.vim'
	Plugin 'tpope/vim-surround'
	Plugin 'preservim/tagbar'
	Plugin 'scrooloose/nerdcommenter' 
	Plugin 'scrooloose/nerdtree'
	Plugin 'lervag/vimtex'
	Plugin 'dkarter/bullets.vim'
	Plugin 'mattn/emmet-vim'

	" Themes
	Plugin 'gruvbox-community/gruvbox'
	Plugin 'rakr/vim-one'
	Plugin 'nanotech/jellybeans.vim'
call vundle#end()

endif


" ------------------------------------------------------------
" ----------------------- AUTO COMMANDS ----------------------
" ------------------------------------------------------------


" Execute automatically when the user doesn't press a key for the time

autocmd CursorHold * checktime                             " Check if the file was loaded outside vim
autocmd CursorHold * echo ''

" F1 to exit on Netrw
autocmd filetype netrw nmap <buffer> <f1> :q<CR>


" Execute automatically on {event} for a file matching
autocmd BufRead,BufNewFile     *.tex        call SetTexConfig()
autocmd BufRead,BufNewFile     *.md         call SetMarkdownConfig()
autocmd BufRead,BufNewFile     *.kn,*.notes call SetNotesConfig()
autocmd BufReadPre,BufNewFile  .vimrc       set  relativenumber 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif



" ------------------------------------------------------------
" ------------------ CONFIGURE SOME PLUGINS ------------------
" ------------------------------------------------------------

" LaTeX
let g:vimtex_compiler_latexmk = {'callback' : 0}
let g:vimtex_complete_close_braces = 1
let g:tex_flavor = 'latex'


" NERDTree

let g:NERDTreeHijackNetrw=0                   " Avoid starts when open a directory fom command line (vim .)

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
	\ 'notes',
    \ 'text'
    \]



" Emmet
let g:user_emmet_leader_key='<c-c>'


" Netrw
let g:netrw_list_hide='^\.[^\.\/].*$' " Makes netrw start hidding the dotfiles





" ------------------------------------------------------------
" ------------------------ My remaps -------------------------
" ------------------------------------------------------------

if (isNeoVim)

	map <F13> <S-F1>  | map <F25> <c-F1>  | map <F37> <c-s-f1>
	map <F14> <S-F2>  | map <F26> <c-F2>  | map <F38> <c-s-f2>
	map <F15> <S-F3>  | map <F27> <c-F3>  | map <F39> <c-s-f3>
	map <F16> <S-F4>  | map <F28> <c-F4>  | map <F40> <c-s-f4>
	map <F17> <S-F5>  | map <F29> <c-F5>  | map <F41> <c-s-f5>
	map <F18> <S-F6>  | map <F30> <c-F6>  | map <F42> <c-s-f6>
	map <F19> <S-F7>  | map <F31> <c-F7>  | map <F43> <c-s-f7>
	map <F20> <S-F8>  | map <F32> <c-F8>  | map <F44> <c-s-f8>
	map <F21> <S-F9>  | map <F33> <c-F9>  | map <F45> <c-s-f9>
	map <F22> <S-F10> | map <F34> <c-F10> | map <F46> <c-s-f10>
	map <F23> <S-F11> | map <F35> <c-F11> | map <F47> <c-s-f11>
	map <F24> <S-F12> | map <F36> <c-F12> | map <F48> <c-s-f12>

else

	map [1;2P  <S-F1>  | map [1;5P  <c-F1>  | map [1;6P  <c-s-f1>   
	map [1;2Q  <S-F2>  | map [1;5Q  <c-F2>  | map [1;6Q  <c-s-f2>   
	map [1;2R  <S-F3>  | map [1;5R  <c-F3>  | map [1;6R  <c-s-f3>   
	map [1;2S  <S-F4>  | map [1;5S  <c-F4>  | map [1;6S  <c-s-f4>   
	map [15;2~ <S-F5>  | map [15;5~ <c-F5>  | map [15;6~ <c-s-f5>   
	map [17;2~ <S-F6>  | map [17;5~ <c-F6>  | map [17;6~ <c-s-f6>   
	map [18;2~ <S-F7>  | map [18;5~ <c-F7>  | map [18;6~ <c-s-f7>   
	map [19;2~ <S-F8>  | map [19;5~ <c-F8>  | map [19;6~ <c-s-f8>   
	map [20;2~ <S-F9>  | map [20;5~ <c-F9>  | map [20;6~ <c-s-f9>   
	map [21;2~ <S-F10> | map [21;5~ <c-F10> | map [21;6~ <c-s-f10>  
	map [23;2~ <S-F11> | map [23;5~ <c-F11> | map [20;6~ <c-s-f11>  
	map [24;2~ <S-F12> | map [24;5~ <c-F12> | map [24;6~ <c-s-f12>  

endif


" =========================
" Changing some defaults
" =========================

" My leader
let mapleader = ' '
nnoremap <space> <nop>


" make j and k go to the next/previous visual line
nnoremap j gj
nnoremap k gk

nnoremap Y y$


" ----- WASTED MAPS -----

" Do nothing 
nnoremap <c-z>    :echo 'do nothing :)'<cr>
nnoremap g!       :echo 'wasted map'<cr>
nnoremap g2       :echo 'wasted map'<cr>




" =========================
" Make some shortcuts
" =========================

" Selects the previous changed or yanked
nnoremap gp `[v`]

" Yank all
nnoremap yA :%y+<cr>

" Go to older position in change list
nnoremap <backspace> g;

" Back to Normal Mode
inoremap <C-L> <ESC>



" Save & Quit
nnoremap <F1> :q<CR>
nnoremap <F2> :w<CR>:echo ''<cr>
vnoremap <F1> <ESC>:q<CR>
vnoremap <F2> <ESC>:w<cr>
inoremap <F1> <ESC>
inoremap <F2> <ESC>:w<cr>


" Comments
nnoremap <leader>; :call nerdcommenter#Comment(0,"toggle")<cr>
vnoremap <leader>; :call nerdcommenter#Comment(0,"toggle")<cr>
nnoremap <leader>s :call nerdcommenter#Comment(0,"sexy")<cr>
nnoremap <leader>A :call nerdcommenter#Comment(0,"append")<cr>
nnoremap <leader>I :call nerdcommenter#Comment(0,"insert")<cr>i

" Window resizing
nnoremap <s-F11> 5<c-w><
nnoremap <s-F12> 5<c-w>>
nnoremap <c-F11> 1<c-w>-
nnoremap <c-F12> 1<c-w>+


" Explore directories
nnoremap <F3> :NERDTreeToggle<cr>

" Explore Tags
nnoremap g<F3> :TagbarToggle<cr>

nnoremap <leader>dl :Explore<cr>


" Goyo -- Distraction Free Writing
nnoremap <silent><F4>      :Goyo<CR>


" =========================
" Make some functionalities
" =========================


" Move tabs
nnoremap <c-F5> :tabmove-<cr>
nnoremap <c-F6> :tabmove+<cr>

" Circle tabs
nnoremap <c-F7> gT
nnoremap <c-F8> gt


" Place each buffer in its own tab
nnoremap <c-s-f11> :tab      sball \| tabfirst<cr>
nnoremap <c-s-f10> :vertical sball <cr>


" Source selected lines
vnoremap <s-F10> :<C-u>for line in getline("'<", "'>") \| execute line \| endfor \| echo "Selected lines has sourced"<cr>

" Source the line under the cursor
nnoremap <c-F10> :execute getline(".") \| echo "Line has sourced"<cr>

" Source the file
nnoremap <s-F10> :%so \| echo "File has sourced"<cr>



" highlight lines
nnoremap <leader>l :call matchadd('LineHighlight',  '\%'.line('.').'l')<cr>
nnoremap <leader>1 :call matchadd('LineHighlight1', '\%'.line('.').'l')<cr>
nnoremap <leader>2 :call matchadd('LineHighlight2', '\%'.line('.').'l')<cr>
nnoremap <leader>3 :call matchadd('LineHighlight3', '\%'.line('.').'l')<cr>
nnoremap <leader>4 :call matchadd('LineHighlight4', '\%'.line('.').'l')<cr>
nnoremap <leader>5 :call matchadd('LineHighlight5', '\%'.line('.').'l')<cr>
vnoremap <leader>l :call matchadd('LineHighlight',  '\%'.line('.').'l')<cr>
vnoremap <leader>1 :call matchadd('LineHighlight1', '\%'.line('.').'l')<cr>
vnoremap <leader>2 :call matchadd('LineHighlight2', '\%'.line('.').'l')<cr>
vnoremap <leader>3 :call matchadd('LineHighlight3', '\%'.line('.').'l')<cr>
vnoremap <leader>4 :call matchadd('LineHighlight4', '\%'.line('.').'l')<cr>
vnoremap <leader>5 :call matchadd('LineHighlight5', '\%'.line('.').'l')<cr>

" clear all the highlighted lines
nnoremap <leader>h :call clearmatches()<cr>


" Select a function
vnoremap af Va{V


" Move lines
nnoremap <C-j>      :m .+1 <CR>==
nnoremap <C-k>      :m .-2 <CR>==
vnoremap <C-j>      :m '>+1<CR>gv=gv
vnoremap <C-k>      :m '<-2<CR>gv=gv

" Duplicate current line
nnoremap <c-l> :t.<CR>

" Replicate the current char
nnoremap g. ylP

" Clear current line
nnoremap <c-c><c-c> ^D

" Toggle Transparent Background 
nnoremap <F5> :call ToggleTransparentBG()<CR>

" Set colorscheme 
nnoremap <silent><S-F1>  :colorscheme default    \| hi LineNr ctermfg=darkgrey \| colorscheme <cr>
nnoremap <silent><S-F2>  :colorscheme lunaperche \| hi normal ctermbg=none     \| colorscheme <cr>
nnoremap <silent><S-F3>  :colorscheme habamax    \| hi normal ctermbg=none     \| colorscheme <cr>
nnoremap <silent><S-F4>  :colorscheme one        \| hi normal ctermbg=none     \| colorscheme <cr>
nnoremap <silent><S-F5>  :colorscheme gruvbox    \| hi normal ctermbg=none     \| colorscheme <cr>
nnoremap <silent><S-F6>  :colorscheme jellybeans \| hi normal ctermbg=none     \| hi LineNr ctermbg=none \| colorscheme <cr>
" nnoremap <silent><S-F7>  :colorscheme ron        \| hi normal ctermbg=none     \| hi LineNr ctermbg=none \| colorscheme <cr>
nnoremap <silent><S-F8>  :colorscheme slate      \| hi normal ctermbg=none     \| hi LineNr ctermbg=none \| colorscheme <cr>


" Spot the cursor
nnoremap <F7>      :set cursorline!<CR>
nnoremap <F19><F7> :set cursorcolumn!<CR>

" Relative line numbers
nnoremap <F19><F8> :call ToggleRelativeNumber()<cr>

" Set/unset Show Blank chars
nnoremap <F6> :call ToggleShowBlanks()<CR>:call ToggleShowBreaks()<cr>

" Change vertical movement behave
nnoremap <leader>j :call ToggleVerticalMovement()<cr>


" Toggle Spell Check
noremap <S-F9>      :set spell!<cr>


" Code check
nnoremap <F9> :ALEToggle<cr>

" Show File name and filetype
nnoremap g1 :echo expand('%:r'). ' - ' . &filetype<cr>

" Copy full path to the clipboard
nnoremap <silent>g2 :call CopyFullPath() \| echo "Full path has copied"<cr>

" Show/Hide Statusbar
nnoremap <silent><F12> :call ToggleShowStatusBar()<cr>

" Show/Hide Tabsbar
nnoremap <silent><F11> :call ToggleShowTabBar()<cr>

" Show/Hide Winbar
nnoremap <silent><F10> :call ToggleShowWinBar()<cr>


" Insert line in Normal Mode
nnoremap m  i<CR><esc>
nnoremap <leader>m  o<esc>
nnoremap <leader>M  O<esc>

nnoremap <leader>o  mzo<esc>`z
nnoremap <leader>O  mzO<esc>`z


" Scroll screen and move the cursor in the opposite direction
nnoremap <up>    <c-y>gk
nnoremap <down>  <c-e>gj

nnoremap <c-q>   <c-y>gk
nnoremap <c-s>   <c-e>gj


" Join with the line above
nnoremap <silent>K kJ==

nnoremap <Leader>w  :set wrap!<cr>

nnoremap <Leader><bar> :vsplit<cr>
nnoremap <Leader>-     :split<cr>


" Disable/Enable highlight in search
nnoremap <silent><f8> : set hlsearch!<cr>


" Create an empty Window at the Left
nnoremap <Leader>n :vnew<cr>

" Create an empty Window at the Bottom
nnoremap <Leader>_ :new<cr>
 
" Change to next window
nnoremap <s-tab> <c-w>w
inoremap <s-tab> <esc><c-w>w
		

" Change to next/previous buffer
nnoremap <leader><tab>   :bn<cr>
nnoremap <leader><s-tab> :bp<cr>




" =========================
" Make some improvements
" =========================


" Break undo sequence
inoremap <space> <space><c-g>u
inoremap <cr> <cr><c-g>u
inoremap <bs> <bs><c-g>u
inoremap . .<c-g>u
inoremap , ,<c-g>u


" Black hole register
nnoremap <del> "_
vnoremap <leader>d "_d
nnoremap <leader>x "_x
nnoremap <leader>s "_s
nnoremap <leader>dd "_dd
nnoremap <leader>D "_D
nnoremap <leader>C "_C
nnoremap <leader>S "_S
nnoremap <leader>b "_


" Replace selected without yank
vnoremap <leader>p "_dP


" Indent/Unindent and reselect
vnoremap < <gv
vnoremap > >gv


" Change a misspelling word to the first vim suggestion 
nnoremap <leader>= 1z=

" Add a header underline
nnoremap <Leader><Leader>= yypVr=k
nnoremap <Leader><Leader>~ yypVr~k
nnoremap <Leader><Leader>- yypVr-k
nnoremap <Leader><Leader>. yypVr.k



" ------------------------------------------------------------
" ------------------------ FUNCTIONS -------------------------
" ------------------------------------------------------------

" function AdjustVerticalMovementToRelativeNumbers()
"

function! CopyFullPath()
	let @+ = expand('%:p')
endfunction 



function! ToggleVerticalMovement()
	
	if mapcheck("j", "n") != ""
		nunmap j
		nunmap k
	else
		nnoremap j gj
		nnoremap k gk
	endif

endfunction




function! ToggleRelativeNumber()
	set relativenumber!

	if &relativenumber
		nunmap j
		nunmap k
	else
		nnoremap j gj
		nnoremap k gk
	endif
endfunction


let s:tb = 0 "transparent background
function! ToggleTransparentBG()

	if s:tb 
		highlight Normal ctermbg=NONE
	else
		highlight Normal ctermbg=black
	endif


	let s:tb =! s:tb
endfunction



let s:myshowbreak=' →  '
let s:slb=0 "show line breaks
function! ToggleShowBreaks()

	if s:slb
		set showbreak=""
		set cpoptions-=n " Removes n from Vi-Compatible options.
		                 " Number column will not be used for wrapped lines
	else
		let &showbreak=s:myshowbreak
		set cpoptions+=n
	endif

	let s:slb =! s:slb

endfunction


let s:sb = 0 " show blank chars
function! ToggleShowBlanks()

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



function! ToggleShowStatusBar()

	if &laststatus == 0
		set laststatus=1
		set showmode
		echo "laststatus=1 → if splitted"
	else
		if &laststatus == 1
			set laststatus=2
			set noshowmode
			echo "laststatus=2 → always"
		else 
			if &laststatus == 2
				set laststatus=0
				set showmode
				echo "laststatus=0 → never"
			endif
		endif
	endif

endfunction


function! ToggleShowTabBar()

	if &showtabline == 0
		set showtabline=1
		echo "tabline=1 → if more than 1 tab pages"
	else
		if &showtabline == 1
			set showtabline=2
			echo "tabline=2 → always"
		else
			if &showtabline == 2
				set showtabline=0
				echo "tabline=0 → never"
			endif
		endif
	endif

endfunction


function! ToggleShowWinBar()
	if empty(&winbar)
		set winbar=File\ \-\ %f\ %R%M
	else
		set winbar=
	endif
endfunction


function! SetTexConfig() 
	set filetype=tex  

	let w:myshowbreak='       '
	let &showbreak=w:myshowbreak
	set cpoptions+=n

	let w:slb = 0
	" call ToggleShowBreaks()

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



function! CheckTheBox()

	let line = getline(".")
	" let rege = "^\\s*\\zs-\\s*\\[[\\".g:markDownCheckBoxUnCheckedChar.g:markDownCheckBoxCheckedChar."]\\]"
	let rege = "^\\s*\\zs-\\s*\\[[\\".g:markDownCheckBoxUnCheckedChar.g:markDownCheckBoxUnDefinedChar.g:markDownCheckBoxCheckedChar."]\\]"
	let startBox = match(line, rege)  		
	let endBox = match(line, "^\\s*-\\s*\\[[\\ x".g:markDownCheckBoxUnDefinedChar."]\\zs\\]")

	if startBox < 0
		exec 'normal viw'
		return
	endif

	let colu = col(".")-1
	let char = line[endBox-1]
	let curp = getcurpos()

	if colu >= startBox && colu <= endBox
		if char == g:markDownCheckBoxCheckedChar   | let newchecbox = '['.g:markDownCheckBoxUnCheckedChar.']' | endi	
		if char == g:markDownCheckBoxUnCheckedChar | let newchecbox = '['.g:markDownCheckBoxCheckedChar.  ']' | endi	
		if char == g:markDownCheckBoxUnDefinedChar | let newchecbox = '['.g:markDownCheckBoxCheckedChar.  ']' | endi	
			
		let brackets = "\\[[\\".char."]\\]"

		exec 's/'.brackets.'/'.newchecbox.'/'
		call setpos('.', curp)
	endif
endfunction




function! SetMarkdownConfig()

	syn match markdownTimeSep     "\d\{1,2\}\zs[:hm]\ze\d\{1,2\}" contained
	syn match markdownTime              "\d\{1,2\}[:hm]\d\{1,2\}" contains=markdownTimeSep
	syn match markdownTime    "\d\{1,2\}h\d\{1,2\}[:hm]\d\{1,2\}" contains=markdownTimeSep

	syn match markdownTagSep   "[;,.]"  contained
	syn match markdownBrackts  "[\[\]]" contained
	syn match markdownTags     "\[.*\]" contains=markdownBrackts,markdownTagSep

	syn match markdownDashedTextDashes "--" contained
	syn match markdownDashedText "--.*--" contains=markdownDashedTextDashes

	syn match markdownTagSep2   "[;,.]"  contained
	syn match markdownBrackts2  "[<>]" contained
	syn match markdownTags2     "<.*>" contains=markdownBrackts2,markdownTagSep2


	syn match markdownCheckBoxX "\[\zsx\ze\]"  
	syn match markdownCheckBox  "^\s*-\s*\[[\ x]\]"        contains=markdownCheckBoxX



	" --------------------------------------------------------------------------------	
	" --------------------------------------------------------------------------------	


	hi markdownBox              ctermfg=green

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
	" hi markdownSectionMarker    ctermfg=blue
	hi markdownDashedText       cterm=italic
	hi markdownDashedTextDashes ctermfg=white

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

	hi Error ctermfg=red ctermbg=none

	let g:markDownCheckBoxCheckedChar='x'
	let g:markDownCheckBoxUnCheckedChar=' '
	let g:markDownCheckBoxUnDefinedChar='-'
	" Check/Uncheck the CheckBox
	nnoremap <buffer><silent> <leader><space> :call CheckTheBox()<cr>
endfunction





"      - ̗̀ AGORA SIM!  ̖́-

function! SetNotesConfig()
	set filetype=notes  
	nnoremap <buffer><silent> <leader><space> :call CheckTheBox()<cr>
	let g:markDownCheckBoxCheckedChar='x'
	let g:markDownCheckBoxUnCheckedChar=' '
	let g:markDownCheckBoxUnDefinedChar='-'

	hi markdownTagSep           ctermfg=yellow
	hi markdownBrackts          ctermfg=yellow
	hi markdownTags             cterm=italic ctermfg=darkyellow

	syn match notesHighlighterDelimiterBegin "\]-\|-\[" 	contained
	syn match notesHighlighter               "-\[.*\]-"		contains=notesHighlighterDelimiterBegin

	syn match markdownTagSep   "[;,.]"  contained
	syn match markdownBrackts  "[\[\]]" contained
	syn match markdownTags     "\[.*\]" contains=markdownBrackts,markdownTagSep

	syn match notesHeaderMarker "^#\{,6}" contained

	syn match notesH1 "^\zs#\s.*\ze" contains=notesHeaderMarker
	syn match notesH2 "^\zs##\s.*\ze" contains=notesHeaderMarker
	syn match notesH3 "^\zs###\s.*\ze" contains=notesHeaderMarker
	syn match notesH4 "^\zs####\s.*\ze" contains=notesHeaderMarker
	syn match notesH5 "^\zs#####\s.*\ze" contains=notesHeaderMarker
	syn match notesH6 "^\zs######\s.*\ze" contains=notesHeaderMarker


	syn match notesHeaderRule1 "^\s*\zs.*\ze\n\s*=\{3,}$"
	syn match notesHeaderRule2 "^\s*\zs.*\ze\n\s*\-\{3,}$"
	syn match notesHeaderRule3 "^\s*\zs.*\ze\n\s*\~\{3,}$"
	syn match notesRule1       "^\s*\zs=\{3,}$" 
	syn match notesRule2       "^\s*\zs\-\{3,}$" 
	syn match notesRule3       "^\s*\zs\~\{3,}$" 

	syn match notesComment "{.*}"
	
	syn match notesQuote  /"/ contained
	syn region notesQuoted start=/"/ end=/"/ keepend contains=notesQuote



	syn match matchURL /\v(https?:\/\/\S+)|(www\d*\.\S+\.\S+)/	

	syn match notesNumber "\<\d\+\([.,]\d\+\)\=\>%\?"

	syn match notesListMarker        "\(\(^\s*\)\|\(\t\| \{4,}\)\)\zs[-*+]\ze\s.*" 
	syn match notesOrderedListMarker "\(\(^\s*\)\|\(\t\| \{4,}\)\)\zs\d\+\.\ze\s.*" 

	" syn match notesEmphasisBetweenDashes "--\s.*\s--"
	syn match notesEmphasisBetweenDashes "--\s\([^|-].*\)\s--" " excludes the | between dashes 
	syn match notesEmphasisBetweenEquals "==\s.*\s=="



	syn match boldDelimiter        "\*"   contained
	syn match italicDelimiter      "\^"   contained
	syn match underlineDelimiter   "[_]"  contained
	syn match bolditalicDelimiter  "\*\/" contained
	syn match bolditalicDelimiter  "\/\*" contained
	syn match strikDelimiter       "\~"   contained


	syn region notesBoldContent        start="\*\w" end="\w\*" 			keepend contains=boldDelimiter
	syn region notesItalicContent      start="\^\w" end="\w\^" 			keepend contains=italicDelimiter 
	syn region underlineItalicContent  start="__\w"  end="\w__" 		keepend contains=underlineDelimiter 
	syn region notesItalicBoldContent  start="\*\/\w" end="\w\/\*" 		keepend contains=bolditalicDelimiter 
	syn region notesStrikeContent      start="\~\w" end="\w\~" 			keepend contains=strikDelimiter


	syn match markdownRightArrow "-\{2,}>\|=\{2,}>"
	syn match markdownLeftArrow "<-\{2,}\|<=\{2,}"
	


	syn match notesDescriptionSep     ":\s*[→>:]"               contained 
	syn match notesDescriptionItem    "\zs.*\ze:\s*[→>:]"       contained contains=notesDescriptionSep
	syn region notesDescription start=/\v.*\:\s*[→>:]/  end=/$/ contains=notesDescriptionSep, notesDescriptionItem



	syn match markdownOKBoxText "\[\zs\s*\(OK\|SIM\)\s*\ze\]"
	syn match markdownNOBoxText "\[\zs\s*\(NO\|NAO\)\s*\ze\]"
	syn match markdownOKBox     "^\s*\[\s*\(OK\|SIM\)\s*\]"        contains=markdownOKBoxText
	syn match markdownNOBox     "^\s*\[\s*\(NO\|NAO\)\s*\]"        contains=markdownNOBoxText
	syn match markdownNOEmpty   "^\s*\[\s*\]"

	syn match markdownOK "^OK\ze\s."

	syn match markdownCheckBoxX         "\[\zsx\ze\]"  
	syn match markdownCheckBoxUndefined "\[\zs-\ze\]"  
	syn match markdownCheckBox          "^\s*-\s*\[[\ x-]\]"        contains=markdownCheckBoxX,markdownCheckBoxUndefined













	syn match dotMark       "^\zs\s*\.\ze\s*\s.*"
	syn match dotMarkedLine "^\zs\s*\.\s.*\ze" contains=dotMark,notesQuoted

	hi dotMark cterm=bold ctermfg=red
	hi dotMarkedLine cterm=none 
	
	syn match barMark       "^\s*|" contained
	syn match barMarkedLine "^\s*|\s\+\([^|]\+\)$" contains=barMark

	hi barMark ctermfg=darkcyan
	hi barMarkedLine cterm=italic ctermfg=gray

	

	" Table
	syn region tableline start="+-" end="-+"

	syntax match tablerow '\v\|.*\|' contains=tablebound

	syntax match tablebound '\v\|' contained

	" syn region tableline start="\v\|\s+-" end="\v-\s+\|" 




" --------------------------------------------------------------------------------

	hi notesHighlighter					cterm=none ctermfg=black  ctermbg=yellow
	hi notesHighlighterDelimiterBegin	cterm=none ctermfg=black  ctermbg=yellow

	hi notesEmphasisBetweenDashes	cterm=italic
	hi notesEmphasisBetweenEquals	cterm=bold ctermfg=white

	hi notesListMarker				cterm=none ctermfg=red 
	hi notesOrderedListMarker 		cterm=none ctermfg=red 

	hi notesHeaderMarker	  cterm=none ctermfg=darkgray


	" hi notesH1                cterm=bold ctermfg=white
	" hi notesH2                cterm=bold ctermfg=033
	" hi notesH3                cterm=bold ctermfg=081
	" hi notesH4                cterm=bold ctermfg=121
	" hi notesH5                cterm=bold ctermfg=023
	" hi notesH6                cterm=bold ctermfg=029

	" https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
	" 033 024 037 023 029


	hi notesH1    cterm=bold ctermfg=white                
	hi notesH2    cterm=bold ctermfg=cyan                   
	hi notesH3    cterm=none ctermfg=darkcyan               
	hi notesH4    cterm=bold ctermfg=magenta                
	hi notesH5    cterm=none ctermfg=darkmagenta            
	hi notesH6    cterm=bold ctermfg=red                    


	hi def link notesHeaderRule1  	  notesH1
	hi def link notesHeaderRule2  	  notesH2
	hi def link notesHeaderRule3  	  notesH3
	hi          notesRule1   	      cterm=none ctermfg=darkcyan
	hi          notesRule2   	      cterm=none ctermfg=darkgray
	hi          notesRule3   	      cterm=none ctermfg=red

	hi notesComment cterm=italic ctermfg=darkgray

	hi notesQuote   cterm=italic ctermfg=darkmagenta
	hi notesQuoted  cterm=italic 


	hi markdownArrow            ctermfg=red


	hi notesDescription     cterm=italic
	hi notesDescriptionItem cterm=bold
	hi notesDescriptionSep  ctermfg=cyan
	hi notesDescriptionSep  ctermfg=161
	" hi notesDescriptionSep  guifg=#f92672
	" hi notesDescriptionSep  ctermfg=033


	hi markdownOK               ctermfg=green 
	hi markdownBox              ctermfg=green
	hi markdownOKBox            ctermfg=red
	hi markdownNOBox            ctermfg=red
	hi markdownNOEmpty          ctermfg=red
	hi markdownOKBoxText        ctermfg=green
	hi markdownNOBoxText        ctermfg=gray

	hi matchURL cterm=italic ctermfg=cyan
	
	hi def link noetsNumber Normal

	hi def link markdownCheckBox			markdownArrow
	hi def link markdownCheckBoxX			markdownBox

	hi markdownCheckBoxUndefined	cterm=bold ctermfg=darkgray


	hi def link boldDelimiter			Normal
	hi def link italicDelimiter			Normal
	hi def link bolditalicDelimiter		Normal
	hi def link strikDelimiter			Normal


	hi notesBoldContent       cterm=bold
	hi notesItalicContent     cterm=italic
	hi underlineItalicContent cterm=underline
	hi notesStrikeContent     cterm=strikethrough
	hi notesItalicBoldContent cterm=italic,bold

	hi markdownRightArrow            ctermfg=red
	hi markdownLeftArrow             ctermfg=red 

	hi tableline  ctermfg=green
	hi tableBound ctermfg=green

	" echo "Notes"
endfunction




" ------------------------------------------------------------
" ------------------------ HIGHLIGHTS ------------------------
" ------------------------------------------------------------


highlight Pmenu    ctermbg=none			ctermfg=none 
highlight PmenuSel ctermbg=darkmagenta 	ctermfg=white


highlight LineHighlight  ctermbg=233 ctermfg=white
highlight LineHighlight1 ctermbg=228 ctermfg=black
highlight LineHighlight2 ctermbg=17  ctermfg=white
highlight LineHighlight3 ctermbg=52  ctermfg=white
highlight LineHighlight4 ctermbg=10  ctermfg=white
highlight LineHighlight5 ctermbg=217 ctermfg=white


highlight CursorLine   cterm=none ctermbg=234
highlight CursorColumn cterm=none ctermbg=234
highlight CursorLineNr cterm=none ctermfg=lightgray


" Status Line
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

if !(isNeoVimLua)

	" ----------------------------
	" Functions for the status bar
	" ----------------------------


	function! GetBuffCount()
		return len(getbufinfo({'buflisted':1}))
		" return len(getbufinfo({'bufloaded':1}))
	endfunction


	function! GetLang()
		if &spell
			return &spelllang
		else
			return 'no spell'
		endif
	endfunction

	function! GetMode()
		let mode = lightline#mode()

		if mode == 'NORMAL'
			return '      '
		else
			return mode
		endif

	endfunction


	function! MyLineInfo()                               " replacing the original component 'lineinfo'
		return printf('%d:%d', line('.'), col('.'))
	endfunction



	" ----------------------------
	" Colors for the status bar
	" ----------------------------

	" Color scheme based on jellybeans


	let s:none    = [ '#000000', 'none' ]
	let s:gray    = [ '#666656', 239  ]
	let s:white   = [ '#ffffff', 'white']
	let s:yellow  = [ '#ffb964', 215 ]
	let s:red     = [ '#cf6a4c', 196 ]
	let s:magenta = [ '#f0a0c0', 125 ]
	let s:cyan    = [ '#8fbfdc', 110 ]
	let s:green   = [ '#000000', 71 ]
	let s:blue    = [ '#000000', '31' ]
	let s:pink    = [ '#000000', '205' ]


	" ----------------------------
	" Components for the status bar
	" ----------------------------


	let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

	let s:p.normal.left    = [ [ s:blue, s:none, ], [ s:gray, s:none ] ]
	let s:p.normal.right   = [ [ s:none, s:none ], [ s:none, s:none ] ]
	let s:p.normal.middle  = [ [ s:gray, s:none ] ]
	let s:p.normal.error   = [ [ s:red, s:none ] ]
	let s:p.normal.warning = [ [ s:yellow, s:none ] ]

	let s:p.insert.left    = [ [ s:green, s:none ],   [ s:gray, s:none ] ]
	let s:p.replace.left   = [ [ s:red, s:none ],     [ s:gray, s:none ] ]
	let s:p.visual.left    = [ [ s:pink, s:none ],    [ s:gray, s:none ] ]

	let s:p.inactive.right  = [ [ s:gray, s:none ], [ s:gray, s:none ] ]
	let s:p.inactive.left   = [ [ s:gray, s:none ], [ s:gray, s:none ] ]
	let s:p.inactive.middle = [ [ s:gray, s:none ] ]

	let s:p.tabline.left    = [ [ s:gray, s:none ] ]
	let s:p.tabline.tabsel  = [ [ s:white, s:none ] ]
	let s:p.tabline.middle  = [ [ s:gray, s:none ] ]
	let s:p.tabline.right   = copy(s:p.normal.right)

	let g:lightline#colorscheme#myojf#palette = lightline#colorscheme#flatten(s:p)



	let lineComponent1 = { 
				\   'buff': '%{GetBuffCount()}',
				\   'mylineinfo': '%3.6l:%-3.6v',
				\   'char': '%-2.2B',
				\ }


	let lineComponent2 = { 
				\   'mymode': '%{GetMode()}',
				\   'mylineinfo': '%3.6l:%-3.6v',
				\   'char': '%-2.2B',
				\ }

	let lineActive1 = {
				\   'left' : [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ],
				\   'right': [ 
				\              [ 'percent' ],
				\              [ 'mylineinfo' ],
				\              [ 'buff', 'spell', 'fileformat', 'fileencoding', 'filetype' ],
				\              [ 'linter_errors', 'linter_warnings'] 
				\            ]
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


	let g:lightline.subseparator = { 'left': '', 'right': '|' }
	" let g:lightline.subseparator = { 'left': '', 'right': ' ⃓' }



endif        " End of Status Bar for Vim









" ------------------------------------------------------------
" ----------------------- TO REMEMBER ------------------------
" ------------------------------------------------------------


"--> ========== VIMTEX =========

"--> \ll	start/stop compiler in continuous mode
"--> \lc	clear auxiliary files
"--> \le	show erros


"--> ========== VIM ==========

"--> gi		Insert text in the previous position
"--> gd		Go to defition of word in the current function
"--> gD		Go to defition of word in the current file
"--> gn		Go to next last used search pattern and select it
"--> = 		Format selected text
"--> ==		Format current Line
"--> z=		Give spelling suggestions
"--> ]s		Go to next misspeled word
"--> [s		Go to previous misspeled word
"--> zg		Mark work as correctly spelled
"--> zw		Mark work as incorrectly spelled
"--> @@		Repeat last macro
"--> gf		Open the file whose name is under the cursor
"--> gx		Open the URL whose is under the cursor
"--> gm		Go to the middle of the screen line
"--> gM		Go to the middle of the text line
"--> gu		Make lowercase after move
"--> gv		Reselect visual area
"--> zz		Redraw and put current line at center of window
"--> zt		Redraw and put current line at top of window
"--> zb		Redraw and put current line at bottom of window
"--> zy		yank without trailing spaces
"--> +		Go to the line above in the first no-blank character
"--> -		Go to the line below in the first no-blank character
"--> (		Go to previous sentence
"--> )		Go to next sentence
"--> {		Go to previous paragraph
"--> }		Go to next paragraph

"    Make a search with / and press Enter, then
"--> dgn	delete the next search pattern
"--> cgn	change the next search pattern
"    The press . to do it in next occurrences


"--> ''		Go to older position in jump list

"--> \cs	Sexy comment
"--> \c$	Comment from the cursor to the line end
"--> \cm	Comment with a minimal style
"--> \cy    Yank and comment 
"--> \cA	Append a comment to the end of line and goes into insert mode between them
"--> \cI	Adds comment at the cursor and insert between
"--> \ci	Toggles selected lines


"--> ysaw '  Surround a word
"--> yss '   Surround sentence
"--> ysas '  Surround arround sentence
"--> ysap '  Surround arround paragraph





" --> ========== Various Motions ==========

" --> [(			go to priveous unmatched ( 		samor for { 
" --> ](			go to next     unmatched ( 		samor for { 

" --> [m			go to next start of a method
" --> [M			go to next end   of a method

" --> ]m			go to next start of a method
" --> ]M			go to next end   of a method

" --> ]*			go to next start of a comment
" --> [*			go to next end   of a comment



" --> ========== Object Motions ========== 

" --> a(
" --> ab		a block
" --> i(
" --> ib		inner block

" --> a<		a <> block      same for {} and () blocks
" --> i<		inner <> block

" --> at		a tag block
" --> it		inner tag block

" --> a"		a quoted string same for ' and `
" --> i"		inner quoted string

" Netrw
" --> a"		Cycle through the modes (normal/hiding/show)
" --> gh"		Show hide the dotfiles/dotdirs


" ------------------------------------------------------------
" ------------------ SHELL COMMANDS -------------------
" ------------------------------------------------------------

"--> grep -e '^"-->' ~/.vimrc  	Print my hints




" ------------------------------------------------------------
" ---------------------- NICE WEBPAGES -----------------------
" ------------------------------------------------------------

" https://www.cs.swarthmore.edu/oldhelp/vim/home.html
" https://alpha2phi.medium.com/learn-neovim-the-practical-way-8818fcf4830f#545a
" https://www.ditig.com/publications/256-colors-cheat-sheet
" https://askubuntu.com/questions/821157/print-a-256-color-test-pattern-in-the-terminal



" -------------------------------------------------------------------------------
" ------------------------------- [ MASTERS OF COMBAT ] -------------------------
" ---------------------------------[by Ice Queen Zero]---------------------------
" --------------------------------- [ Master System ]----------------------------
" -------------------------------------------------------------------------------

" o---------------------o
"       INTRODUCTION
" o---------------------o
                           

" | It is often used as the last activation function of a neural network to normalize the 
" | output of a network to a probability distribution over predicted output classes. — 
" | Wikipedia [link]


" Get the file path


