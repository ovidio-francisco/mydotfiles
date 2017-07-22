" ------------------------------------
" Authors:     Ovídio José Francisco
" Description: My Vim dotfile
" Last Change: July, 2017
" ------------------------------------

filetype indent plugin on
syntax on
set nocompatible
set wildmenu
set hlsearch
set ignorecase
set smartcase
set mouse=a
set showcmd                                  " Show partial commands in the last line of the screen
set backspace=indent,eol,start               " Allow backspacing over autoindent, line breaks and start of insert action
set nostartofline                            " Stop certain movements from always going to the first character of a line.
set autoindent                               " When opening a new line and no filetype-specific indenting is enabled.
set ruler                                    " Display the cursor position on the last line of the screen or in the status line of a window
set confirm                                  " Instead raise a " dialogue asking if you wish to save changed files.
set visualbell                               " Use visual bell instead of beeping when doing something wrong
set t_vb=                                    " Reset the terminal code for the visual bell. 
set number                                   " Display line numbers on the left
set notimeout ttimeout ttimeoutlen=200       " Quickly time out on keycodes, but never time out on mappings
set shiftwidth=4                             " Indentation settings for using hard tabs for indent. 
set tabstop=4                                " Display tabs as four characters wide.
set pastetoggle=<F10>
set showcmd
set rtp+=~/.vim/bundle/Vundle.vim
set showmatch
set laststatus=2
set wrap                                     " Soft Wrap
set linebreak                                " Break at word boundary
set nolist
set formatoptions+=t
set virtualedit=onemore,block
set spell spelllang=pt,en
set nospell
set noautoread                               " Avoid to autoreload any file. I prefer to be asked for it.
colorscheme elflord


autocmd CursorHold * checktime

autocmd BufEnter,BufNewFile *.tex call SetTexConfig()
autocmd BufEnter,BufNewFile *.csv call SetCSVConfig()
autocmd FileType text colorscheme darkblue
autocmd FileType help colorscheme elflord


call vundle#begin()
  Plugin 'scrooloose/nerdtree'
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'itchyny/lightline.vim'
  Plugin 'nanotech/jellybeans.vim' 
  Plugin 'jszakmeister/vim-togglecursor'
  Plugin 'junegunn/goyo.vim'
  Plugin 'mattn/emmet-vim'
  Plugin 'tpope/vim-surround'
  Plugin 'chrisbra/csv.vim'
  Plugin 'majutsushi/tagbar'
  Plugin 'scrooloose/nerdcommenter' 
call vundle#end()


let g:markdown_fenced_languages = ['html', 'python', 'bash=sh'] " https://github.com/tpope/vim-markdown
let donothing='do nothing :) ' 


let NERDTreeQuitOnOpen = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeHighlightCursorline=1
let NERDTreeMinimalUI = 1
"let NERDTreeDirArrows = 0

"let g:NERDTreeDirArrowExpandable  = '·'
"let g:NERDTreeDirArrowCollapsible = '*'

let g:tagbar_autoclose = 1
let g:tagbar_compact = 1
"let g:tagbar_iconchars = ['▷', '◢']
let g:tagbar_iconchars = ['▸', '▾']


let g:NERDSpaceDelims = 1


let g:jellybeans_background_color_256='NONE'

highlight Directory ctermfg=gray
highlight NERDTreeFile ctermfg=gray
highlight NERDTreeDir  ctermfg=white
highlight NERDTreeDirSlash ctermfg=darkred


" Set Line numbers foreground color
highlight LineNr ctermfg=darkgrey
highlight HtmlH1 cterm=bold
highlight markdownListMarker cterm=bold ctermfg=yellow


highlight MatchParen cterm=bold ctermbg=none
highlight VertSplit cterm=none ctermbg=none ctermfg=darkgray
highlight ErrorMsg cterm=none ctermbg=none ctermfg=red
highlight Search ctermbg=darkmagenta ctermfg=white
highlight SpellBad ctermfg=white

" Move lines
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv


" Duplicate current line
nnoremap <C-L> <ESC>:t.<CR>l
inoremap <C-L> <ESC>:t.<CR>li
vnoremap <C-L> <ESC>:t.<CR> 


" Save & Quit
nnoremap <F2> :w <CR>
nnoremap <F1><F1> :q <CR> 
nnoremap <F1> :echo "SAIR ?"<CR> 
inoremap <F2> <ESC>:w<cr>
inoremap <F1><F1> <ESC>:q<cr> 


" Quit without save
nnoremap <F12><F12>      ZQ
inoremap <F12> <esc>


" Do nothing 
nnoremap <C-z> :echo donothing<cr>
inoremap <C-z> <c-o>:echo 'do nothing :)'<cr>
nnoremap ZZ :echo donothing<cr>


" Goyo --> Distraction Free Writing
nnoremap <F4><F4>      :Goyo<CR>
inoremap <F4><F4> <c-o>:Goyo<CR>


" Set/unset Transparent Bakcground 
nnoremap <F5>      :call ToggleTransparentBG()<CR>
inoremap <F5> <c-o>:call ToggleTransparentBG()<CR>


" Set/unset Show Blank chars
nnoremap <F6> :call ToggleShowBlanks()<CR>:call ToggleShowBreaks()<cr>
inoremap <F6> <c-o>:call ToggleShowBlanks()<CR><c-o>:call ToggleShowBreaks()<cr>


" Spot the cursor
nnoremap <F7>      :call ToggleHiglightTheCursor()<CR>
inoremap <F7> <c-o>:call ToggleHiglightTheCursor()<CR>


" Change colorscheme
nnoremap <silent><F8> :call Change_colorscheme()<CR>:colo<cr>
inoremap <silent><F8> <c-o>:call Change_colorscheme()<CR>:colo<cr>


" Toggle Spell Check
nnoremap <F9> :set spell!<cr>
inoremap <F9> <c-o>:set spell!<cr>


" Delete the word under the cursor
nnoremap <C-c>      dw
inoremap <C-c> <c-o>dw


" Delete line in Insert Mode
inoremap <C-d> <c-o>dd
inoremap <C-f> <c-o>D


" Insert line in Normal Mode
nnoremap <CR>  i<CR><esc>


" Insert tab in Normal Mode
nnoremap <tab> i<tab><esc>


" make j and k do the right thing 
nnoremap j gj
nnoremap k gk
											

" Scrool screen and move the cursor in the oposite direction
" Scrool screen Down
nnoremap <s-down> <c-e>gj
nnoremap <c-q>    <c-y>gk
inoremap <s-down> <esc><c-e>gji
inoremap <c-s>    <esc><c-e>gji


" Scrool screen Up
nnoremap <s-up>   <c-y>gk
nnoremap <c-s>    <c-e>gj
inoremap <s-up>   <esc><c-y>gki
inoremap <c-q>    <esc><c-y>gki


" Move Up, Down in Insert mode
inoremap <silent><up>   <c-o>gk
inoremap <silent><down> <c-o>gj


nnoremap <Leader>l  :set cursorline!<cr>
nnoremap <Leader>w  :set wrap!<cr>

nnoremap <Leader>\| :vsplit<cr>
nnoremap <Leader>-  :split<cr>
nnoremap <Leader>x  :q<cr>

nnoremap <Leader>t  :tabnew<cr>

nnoremap K :set hls!<CR>


"set splitright
set splitbelow
nnoremap <Leader>_  :new<cr>
nnoremap <Leader><Leader> :vnew<cr>
" <c-w>r


" Create an empty Window at Left
nnoremap <f4><f1> :vnew<cr><c-w>w
nnoremap <f4>b :buffers<cr>


" Show full path file name
nnoremap <f4>g 1<c-g>
nnoremap <f4>B :echo len(getbufinfo({'buflisted':1})).' Listed buffers'<cr>
nnoremap <f4>w :echo winnr('$').' Windows'<cr>

nnoremap <del> "_d
nnoremap <del><del> "_dd

nnoremap <F3> :NERDTreeToggle<cr>
nnoremap <leader><F3> :TagbarToggle<cr>

nnoremap <s-tab> <c-w>w
inoremap <s-tab> <esc><c-w>w
		


noremap <silent>) :set nohls<cr>/[\.\!\%\n]\ *\zs[A-Z]<cr>:let @/ = ""<cr>:set hlsearch<cr>
noremap <silent>( :set nohls<cr>?[\.\!\%\n]\ *\zs[A-Z]<cr>:let @/ = ""<cr>:set hlsearch<cr>


noremap <silent>} :set nohls<cr>/[\n\%]\zs[A-Z]<cr>:let @/ = ""<cr>:set hlsearch<cr>
noremap <silent>{ :set nohls<cr>?[\n\%]\zs[A-Z]<cr>:let @/ = ""<cr>:set hlsearch<cr>

noremap <silent>= :set nohls<cr>/[\.\!\%\n\,\.\;\:]\ *\zs[a-zà-ú]<cr>:let @/ = ""<cr>:set hlsearch<cr>
noremap <silent>- :set nohls<cr>?[\.\!\%\n\,\.\;\:]\ *\zs[a-zà-ú]<cr>:let @/ = ""<cr>:set hlsearch<cr>

noremap <c-w><c-q> :echo "do nothing :)"<cr>


" break undo sequence, start new change        i_CTRL-G_u
inoremap <space> <space><c-g>u
inoremap <tab> <tab><c-g>u
inoremap <cr> <cr><c-g>u
inoremap <bs> <bs><c-g>u
inoremap . .<c-g>u
inoremap , ,<c-g>u
inoremap ; ;<c-g>u

vnoremap <leader>y "+y
vnoremap <leader>Y "+Y
nnoremap <leader>p "+gp
nnoremap <leader>P "+gP

nnoremap ~ ~h

nnoremap ; :call NERDComment(0,"toggle")<cr>

" -----------------------------------------------------------

let s:cs = 0 " ColorScheme
function Change_colorscheme() 

    if s:cs == 0
        colorscheme slate
        let s:cs = 1
    elseif s:cs == 1
        colorscheme elflord
        let s:cs = 2
        highlight LineNr ctermfg=darkgrey
    elseif s:cs == 2 
        colorscheme jellybeans
        let s:cs = 3
    elseif s:cs == 3 
        colorscheme evening
        let s:cs = 4
    elseif s:cs == 4 
        colorscheme shine
        let s:cs = 5
    elseif s:cs == 5 
        colorscheme darkblue
        let s:cs = 0
    endif

	":color	" Output the name of the currently active color scheme. :h colorscheme

endfunction

let s:tb = 0 "transparent background
function ToggleTransparentBG()
    
	if s:tb 
		highlight Normal ctermbg=NONE
	else
		highlight Normal ctermbg=black
	endif

	let s:tb =! s:tb

endfunction

set showbreak=
set cpoptions-=n
let w:myshowbreak=' →  ' 
let s:slb=0 "show line breaks
function ToggleShowBreaks()

	if s:slb
		set showbreak=""
		set cpoptions-=n

	else
		let &showbreak=w:myshowbreak
		set cpoptions+=n

	endif

	let s:slb =! s:slb

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


let s:hc = 0  " Highlight the Cursor
function ToggleHiglightTheCursor() 
	
	if s:hc
		set cursorline
		set cursorcolumn
	
		let l:color = '234'	

		exe 'highlight CursorLine   cterm=NONE ctermbg=' . l:color
	"	exe 'highlight CursorColumn cterm=NONE ctermbg=' . l:color
	else
		set nocursorline
		set nocursorcolumn

		highlight CursorLine   cterm=NONE ctermbg=none
		highlight CursorColumn cterm=NONE ctermbg=none
		highlight CursorLineNr cterm=NONE ctermfg=lightgray
	endif

	let s:hc =! s:hc

endfunction


function MakeTexAbrevs()

	let l:cl = '<esc>0i <esc>0"kd$'       " cut line
	let l:pl = '<esc>"kp'                 " past line
	let l:nl = '<esc>A<cr><esc>0D' " new line	


	" Make Subsection Header
	let l:hlen = '78'
	let l:cc = '<esc>k$78a <esc>077la==<esc>lDj' " close chars
	let l:hl = '<esc>i% <esc>'.l:hlen.'a=<esc>a'
	let makeSubsecHeader = l:cl.l:hl.l:nl.'i% == '.l:pl.l:nl.l:hl.l:cc


	" Make Paragraf Header
	let l:hlen = '15'                     " header length
	let l:hl = '<esc>'.l:hlen.'i%<esc>a'  " header line

	let makeParHead   = l:cl.l:hl.l:nl.'i%'.l:pl.'A<cr>'.l:hl
	let insertParHead = l:hl.l:nl.'i%<cr>'.l:hl.'<esc>a<cr><esc>kkA'

	exec 'iab iph '.insertParHead
	exec 'iab mph '.makeParHead


	" Make Sentence Header
	let l:hlen = '3'                      " header length
	let l:hl = '<esc>'.l:hlen.'i%<esc>a'  " header line

	let makeSenHead = l:cl.'<esc>0i%'.l:nl.'i%'.l:pl.'<esc>A<cr>'.l:hl
	let insertSenHead = '<esc>i%'.l:nl.'i%<cr>'.l:hl.'<esc>a<cr><esc>kkA'

	exec 'iab ish '.insertSenHead
	exec 'iab mssh '.makeSubsecHeader
	exec 'iab msh '.makeSenHead

	iab mobs  <esc>I% obs: <esc>$l
	iab mtodo <esc>I% TODO: <esc>$l


	inoremap <c-t> <esc>I% 
	nnoremap <c-t> I% <esc>

	let g:tex_comment_nospell=1

endfunction



function SetTexConfig() 

	let w:myshowbreak='      '
	set cpoptions+=n
	call MakeTexAbrevs()

	let w:slb = 0
	call ToggleShowBreaks()

	" Set/unset Show Blank chars
	nnoremap <F6>      :call ToggleShowBlanks()<CR>
	inoremap <F6> <c-o>:call ToggleShowBlanks()<CR>

	set spell

endfunction

function SetCSVConfig()
    
	colorscheme darkblue
	
	hi link CSVColumnOdd MoreMsg
	hi link CSVColumnEven Question

	hi link CSVColumnEven CSVColumnOdd
	
	hi Conceal ctermbg=none ctermfg=darkgray
	hi LineNr ctermfg=darkgray

	set nonumber

endfunction

let s:hc = 0
call ToggleHiglightTheCursor()



function FillString( str, n )
	return a:str.repeat(' ', a:n-strlen(a:str))
endfunction

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


let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
	  \			
	  \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ],
      \
	  \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'buff', 'spell', 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
	  \ 
      \ 'inactive': {
	  \			
	  \   'left': [ [ ],
      \             [ 'readonly', 'filename', 'modified' ] ],
      \
	  \   'right': [ [ ],
      \              [ ],
      \              [ 'filetype' ] ]
      \ },
	  \ 
	  \ 
	  \ 'component': {
	  \   'buff': '%{GetBuffCount()}',
	  \   'char': '%-2.2B',
      \ },
	  \ }




" ================================================================
"  
"1<c-g>

"highlight VertSplit cterm=none ctermbg=236 ctermfg=236

" ================================================================

"¹²³£¢¬{[]}\§/?€®ŧ←↓→øþ´ªæßðđŋħĸł~º«»©“”nµ·̣°̣ 
" https://hea-www.harvard.edu/~fine/Tech/vi.html#defs
"
" http://vimdoc.sourceforge.net/htmldoc/insert.html
" http://vimdoc.sourceforge.net/htmldoc/motion.html
"
" :autocmd FileType python     :iabbrev <buffer> iff if:<left>
" :autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
" http://
" vim.wikia.com/wiki/Search_patterns
" [\.\!\%]\ [A-Z]
" [\.\!\%\n]\ *[A-Z]
" (?<=[\.\!\%\n]\ *)[A-Z]



" http://www.utf8-chartable.de/unicode-utf8-table.pl?start=9472&unicodeinhtml=dec
" https://www.vivaolinux.com.br/artigo/Corretor-Ortografico-no-Vim-Guia-definitivo
" https://github.com/itchyny/lightline.vim/issues/223
" https://www.narga.net/top-best-programing-fonts/
" https://www.ibm.com/developerworks/library/l-vim-script-1/index.html
" https://stackoverflow.com/questions/19994922/find-and-replace-strings-in-vim-on-multiple-lines




" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.


" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline
 
 
" Set the command window height to 2 lines, to avoid many cases of having to
"
" "press <Enter> to continue"
" set cmdheight=2
 
"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.
 
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
" set shiftwidth=4
" set softtabstop=4
" set expandtab
 
 
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
" map Y y$
 
"  Plugin 'godlygeek/tabular'
"  Plugin 'plasticboy/vim-markdown'

"Bundle 'gabrielelana/vim-markdown'
" https://github.com/gabrielelana/vim-markdown
" And then execute the following command in your shell:
" $ vim +'PluginInstall! vim-markdown' +qall
"let g:markdown_enable_spell_checking = 0


" set textwidth=80
" set wrapmargin=80                                                          

"let g:lightline = {
    "\ 'colorscheme': 'jellybeans',
    "\}
" Allow transparent background in jellybeans


" Duplicate current line
" nnoremap <C-Down>       :t.<CR><left> 
" nnoremap <C-Up>         :t.<CR><up>
" inoremap <C-Down>  <ESC>:t.<CR>a
" inoremap <C-Up>    <ESC>:t.<CR>a<up>
" vnoremap <C-Down>  <ESC>:t.<CR> 
" vnoremap <C-Up>    <ESC>:t.<CR> 

" Go to the Midle of the page in Insert Mode
" inoremap <c-B> <c-o>M



".'\u2026'
" set hidden
" set confirm
" set autowriteall
" set laststatus=2             " Always display the status line, even if only one window is displayed

" set noswapfile
" set nobackup

" filetype on 
"------------------------------------------------------------
" By Ovídio José Francisco
"------------------------------------------------------------

" filetype detect
" if (&ft == 'plaintex')
" 
" 	call SetTexConfig()
" 
" endif

" if (&ft == 'csv')

    " colorscheme darkblue
	
	" hi link CSVColumnOdd MoreMsg
	" hi link CSVColumnEven Question

	" hi link CSVColumnEven CSVColumnOdd
	" 
	" hi Conceal ctermbg=none ctermfg=darkgray
	" hi LineNr ctermfg=darkgray

	" set nonumber

" endif

" if (&ft == 'text')

	" colorscheme darkblue
" endif


"------------------------------------------------------------
