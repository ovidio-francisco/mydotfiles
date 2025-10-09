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
set rtp+=~/.vim/myhelps             " Add my helps to the run time path
set rtp+=~/.vim/devhelps            " Add dev helps to the run time path
set title                           " Enables setting the terminal title
set rulerformat=%30(%R%M%=%-13.(%l,%v%)\ %P%)


let isVim       = !has('nvim')                                " Just vim
let isNeoVim    =  has('nvim')                                " Neovim with .vimrc
let isNeoVimLua =  has('nvim') && !exists("$XDG_CONFIG_HOME") " Neovim with Lua


" Sets the title
if isVim 
	set titlestring=%t\ \-\ VIM
else
	set titlestring=%t\ \-\ NVIM
endif


if !isNeoVimLua

call vundle#begin() 
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'itchyny/lightline.vim'
	Plugin 'junegunn/goyo.vim'
	Plugin 'tpope/vim-surround'
	Plugin 'preservim/tagbar'
	" Plugin 'scrooloose/nerdcommenter' 
	Plugin 'preservim/nerdcommenter' 
	Plugin 'scrooloose/nerdtree'
	Plugin 'lervag/vimtex'
	Plugin 'dkarter/bullets.vim'
	Plugin 'mattn/emmet-vim'

	" Themes
	Plugin 'gruvbox-community/gruvbox'
	Plugin 'rakr/vim-one'
	Plugin 'nanotech/jellybeans.vim'
	Plugin 'crusoexia/vim-monokai'
	Plugin 'caglartoklu/borlandp.vim'
call vundle#end()

endif


" ------------------------------------------------------------
" ----------------------- AUTO COMMANDS ----------------------
" ------------------------------------------------------------


" Execute automatically when the user doesn't press a key for the time
autocmd CursorHold * checktime                " Check if the file was loaded outside vim
autocmd CursorHold * echo ''

" F1 to exit on Netrw
autocmd filetype netrw nmap <buffer> <f1> :q<CR>


" Execute automatically on {event} for a file matching
autocmd BufRead,BufNewFile     *.tex        call SetTexConfig()
autocmd BufRead,BufNewFile     *.md         call SetMarkdownConfig()
autocmd BufRead,BufNewFile     *.kn,*.notes call SetNotesConfig()
autocmd BufReadPre,BufNewFile  *            set  background=dark
" autocmd BufReadPre,BufNewFile  .vimrc,js,c,java       set  relativenumber 
" autocmd BufReadPre,BufNewFile  .vimrc       colorscheme default

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" TODO comentar o que isso faz ...
let g:my_filetypes = ['vimrc', 'js', 'jsx', 'c', 'java', 'py', 'html', 'css']

for ft in g:my_filetypes
    execute 'autocmd BufReadPre,BufNewFile *.' . ft . ' set relativenumber'
endfor


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

	map <F13> <S-F1>|   map <F14> <S-F2>|   map <F15> <S-F3>|   map <F16> <S-F4> |   map <F17> <S-F5>|    map <F18> <S-F6>|
	map <F19> <S-F7>|   map <F20> <S-F8>|   map <F21> <S-F9>|   map <F22> <S-F10>|   map <F23> <S-F11>|   map <F24> <S-F12>|
	map <F25> <c-F1>|   map <F26> <c-F2>|   map <F27> <c-F3>|   map <F28> <c-F4>|    map <F29> <c-F5>|    map <F30> <c-F6>|
	map <F31> <c-F7>|   map <F32> <c-F8>|   map <F33> <c-F9>|   map <F34> <c-F10>|   map <F35> <c-F11>|   map <F36> <c-F12>|
	map <F37> <c-s-f1>| map <F38> <c-s-f2>| map <F39> <c-s-f3>| map <F40> <c-s-f4>|  map <F41> <c-s-f5>|  map <F42> <c-s-f6>|
	map <F43> <c-s-f7>| map <F44> <c-s-f8>| map <F45> <c-s-f9>| map <F46> <c-s-f10>| map <F47> <c-s-f11>| map <F48> <c-s-f12>|

else

	nmap [1;2P  <S-F1>|  nmap [1;5P  <c-F1>|  nmap [1;6P  <c-s-f1>    
	nmap [1;2Q  <S-F2>|  nmap [1;5Q  <c-F2>|  nmap [1;6Q  <c-s-f2>    
	nmap [1;2R  <S-F3>|  nmap [1;5R  <c-F3>|  nmap [1;6R  <c-s-f3>    
	nmap [1;2S  <S-F4>|  nmap [1;5S  <c-F4>|  nmap [1;6S  <c-s-f4>    
	nmap [15;2~ <S-F5>|  nmap [15;5~ <c-F5>|  nmap [15;6~ <c-s-f5>    
	nmap [17;2~ <S-F6>|  nmap [17;5~ <c-F6>|  nmap [17;6~ <c-s-f6>    
	nmap [18;2~ <S-F7>|  nmap [18;5~ <c-F7>|  nmap [18;6~ <c-s-f7>    
	nmap [19;2~ <S-F8>|  nmap [19;5~ <c-F8>|  nmap [19;6~ <c-s-f8>    
	nmap [20;2~ <S-F9>|  nmap [20;5~ <c-F9>|  nmap [20;6~ <c-s-f9>    
	nmap [21;2~ <S-F10>| nmap [21;5~ <c-F10>| nmap [21;6~ <c-s-f10>   
	nmap [23;2~ <S-F11>| nmap [23;5~ <c-F11>| nmap [20;6~ <c-s-f11>   
	nmap [24;2~ <S-F12>| nmap [24;5~ <c-F12>| nmap [24;6~ <c-s-f12>   

endif


inoremap <F1> <esc>|  inoremap <F2> <esc>|  inoremap <F3> <esc>|  inoremap <F4> <esc>|
inoremap <F5> <esc>|  inoremap <F6> <esc>|  inoremap <F7> <esc>|  inoremap <F8> <esc>|
inoremap <F9> <esc>|  inoremap <F10> <esc>| inoremap <F11> <esc>| inoremap <F12> <esc>|
inoremap <F13> <esc>| inoremap <F14> <esc>| inoremap <F15> <esc>| inoremap <F16> <esc>|
inoremap <F17> <esc>| inoremap <F18> <esc>| inoremap <F19> <esc>| inoremap <F20> <esc>|
inoremap <F21> <esc>| inoremap <F22> <esc>| inoremap <F23> <esc>| inoremap <F24> <esc>|

vnoremap <F1> <esc>|  vnoremap <F2> <esc>|  vnoremap <F3> <esc>|  vnoremap <F4> <esc>|
vnoremap <F5> <esc>|  vnoremap <F6> <esc>|  vnoremap <F7> <esc>|  vnoremap <F8> <esc>|
vnoremap <F9> <esc>|  vnoremap <F10> <esc>| vnoremap <F11> <esc>| vnoremap <F12> <esc>|
vnoremap <F13> <esc>| vnoremap <F14> <esc>| vnoremap <F15> <esc>| vnoremap <F16> <esc>|
vnoremap <F17> <esc>| vnoremap <F18> <esc>| vnoremap <F19> <esc>| vnoremap <F20> <esc>|
vnoremap <F21> <esc>| vnoremap <F22> <esc>| vnoremap <F23> <esc>| vnoremap <F24> <esc>|





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
nnoremap g9       :echo 'wasted map'<cr>
nnoremap 1g1      :echo 'wasted map'<cr>
nnoremap <S-Up>   :echo 'wasted map'<cr>
nnoremap <C-Up>   :echo 'wasted map'<cr>



" =========================
" Make some shortcuts
" =========================

" Selects the previous changed or yanked
" nnoremap gp `[v`]
nnoremap gl `[v`]

" Yank all
nnoremap yA :%y+<cr>
nnoremap gy :%y+<cr>

" Delete all to blackhole
nnoremap g!! gg"_dG

" Go to older position in change list
nnoremap <backspace> g;

" Back to Normal Mode
inoremap <c-l> <ESC>



" Save & Quit
nnoremap <F1> :q<CR>
nnoremap <F2> :w<CR>:echo ''<cr>
vnoremap <F1> <ESC>:q<CR>
vnoremap <F2> <ESC>:w<cr>
inoremap <F2> <ESC>:w<cr>


" Autosave
nnoremap <silent>g!3 :call AutoSaveToggle()<cr>
nnoremap <silent>g!# :call ShowAutoSave()<cr>

command Autosave :call AutoSaveToggle()


" Comments
nnoremap <silent><leader>; :call nerdcommenter#Comment(0,"toggle")<cr>
vnoremap <silent><leader>; :call nerdcommenter#Comment(0,"toggle")<cr>
nnoremap <silent><leader>s :call nerdcommenter#Comment(0,"sexy")<cr>
nnoremap <silent><leader>A :call nerdcommenter#Comment(0,"append")<cr>
nnoremap <silent><leader>I :call nerdcommenter#Comment(0,"insert")<cr>i

" Window resizing
nnoremap <s-F11> 5<c-w><
nnoremap <s-F12> 5<c-w>>
nnoremap <c-F11> 1<c-w>-
nnoremap <c-F12> 1<c-w>+


" Explore directories
nnoremap <F3> :NERDTreeToggle<cr>

" Explore Tags
nnoremap <S-F3> :TagbarToggle<cr>

" Open Netrw Directory Listing
nnoremap <leader>e :Explore<cr>


" Goyo -- Distraction Free Writing
nnoremap <silent><F4>      :Goyo<CR>


" =========================
" Make some abbreviations
" =========================

" iabbrev linkcss <link rel="stylesheet" href="styles.css"><esc>bbbb
" iabbrev link.. <link rel="stylesheet" href="styles.css"><esc>bbbb
" iabbrev html5 <!DOCTYPE html><CR><html lang="en"><CR><head><CR><meta charset="UTF-8"><CR><title></title><CR></head><CR><body><CR><CR></body><CR></html><esc>kki<tab><tab><esc>



" =========================
" Make some functionalities
" =========================

" Delete all text
nnoremap dat ggdG

command! RemoveCtrlMs %s/\r//g







" ======= [ Decore current line ] ========

" Count goes BEFORE the mapping: 40g-, 80g=, etc.
nnoremap <silent> g- :<C-u>call DecoreSmart('-', v:count1)<CR>
nnoremap <silent> g= :<C-u>call DecoreSmart('=', v:count1)<CR>

" ====== Usage =======

" 40g-[
" 70g=(
" g-<Enter, Esc>
" 2g-<Enter, Esc>
" 3g=(

" nnoremap g-1 :call Decore(20)<CR>
" nnoremap g-[1 :call Decore(20, '-', '[]')<CR>



" Toilet
nnoremap gb :.!toilet -f term -F<cr>
vnoremap gb :.!toilet -f term -F<cr>
" vnoremap gb :join<CR>:<C-U>'<,'>!toilet -f term -F border<CR>



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
nnoremap <silent><C-F1>  :colorscheme default		\| hi LineNr ctermfg=darkgrey \| colorscheme <cr>
nnoremap <silent><C-F2>  :colorscheme one			\| hi normal ctermbg=none     \| colorscheme <cr>
nnoremap <silent><C-F3>  :colorscheme komau			\| hi normal ctermbg=none     \| colorscheme <cr>
" nnoremap <silent><C-F3>  :colorscheme gruvbox		\| hi normal ctermbg=none     \| colorscheme <cr>
" lunaperche habamax   gruvbox   jellybeans ron       slate     


" My helps
nnoremap <S-F1> :help myhelp.txt<cr>
command Myvim :sview ~/.vimrc



" Spot the cursor
nnoremap <F7>        :set cursorline!<CR>
nnoremap <S-F7><F7>  :set cursorcolumn!<CR>
nnoremap <S-F7><F19> :set cursorcolumn!<CR>

" Toggle relative line numbers
nnoremap <S-F7><F8>  :call ToggleRelativeNumber()<cr>
nnoremap <S-F7><F20> :call ToggleRelativeNumber()<cr>

" Set/unset Show Blank chars
nnoremap <F6> :call ToggleShowBlanks()<CR>:call ToggleShowBreaks()<cr>

" Change vertical movement behave
nnoremap <leader>j :call ToggleVerticalMovement()<cr>


" Toggle Spell Check
noremap <S-F9>      :set spell!<cr>


" Code check
nnoremap <F9> :ALEToggle<cr>

" Copy full path to the clipboard
nnoremap <silent>g1 :call CopyFullPath() \| echo "Full path has copied"<cr>

" Show File name and filetype
nnoremap g2 :echo expand('%:r'). ' - ' . &filetype<cr>

" Show/Hide Statusbar
nnoremap <silent><F12> :call ToggleShowStatusBar()<cr>

" Show/Hide Tabsbar
nnoremap <silent><F11> :call ToggleShowTabBar()<cr>

" Show/Hide Winbar
if (isNeoVim)
	nnoremap <silent><F10> :call ToggleShowWinBar()<cr>
else 
	nnoremap <silent><F10> :file<cr>
endif



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


" Disable/Enable highlight in search
nnoremap <silent><f8> : set hlsearch!<cr>

" Join with the line above
nnoremap <silent>K kJ==

" Toggle line wrap
nnoremap <Leader>w  :set wrap!<cr>


" Split current window Vertical/Horizontal
nnoremap <Leader><bar> :vsplit<cr>
nnoremap <Leader>-     :split<cr>

" Create a new window at the Left/Botton
nnoremap <Leader>n :vnew<cr>
nnoremap <Leader>N :new<cr>

" Create an empty Window at the Bottom
 
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
nnoremap <leader>b "_
vnoremap <leader>d "_d
nnoremap <leader>x "_x
nnoremap <leader>s "_s
nnoremap <leader>dd "_dd
nnoremap <leader>D "_D
nnoremap <leader>C "_C
nnoremap <leader>S "_S


" Replace selected without yank
vnoremap <leader>p "_dP


" Indent/Unindent and reselect
vnoremap < <gv
vnoremap > >gv


" Change a misspelling word to the first vim suggestion 
nnoremap <leader>= 1z=

" Add a header underline
nnoremap <Leader>g= yypVr=k
nnoremap <Leader>g~ yypVr~k
nnoremap <Leader>g- yypVr-k
nnoremap <Leader>g. yypVr.k



" ------------------------------------------------------------
" ------------------------ FUNCTIONS -------------------------
" ------------------------------------------------------------



function! BoxSelection(first, last, ...) range
  " Args: style key, min width, inner align, outer align, screen width
  let l:style_key = (a:0 >= 1 ? a:1 : '-')
  let l:min_width = (a:0 >= 2 ? str2nr(a:2) : 20)
  let l:align     = (a:0 >= 3 ? a:3 : 'left')     " inner text alignment
  let l:outer     = (a:0 >= 4 ? a:4 : 'none')     " box alignment: none|left|center|right
  let l:screenw   = (a:0 >= 5 ? str2nr(a:5) : (&textwidth > 0 ? &textwidth : 0))

  " Get lines and rtrim trailing spaces (keep leading indent)
  let l:raw   = getline(a:first, a:last)
  let l:lines = map(copy(l:raw), "substitute(v:val, '\\s\\+$', '', '')")

  " Measure content width (tabs/multibyte aware)
  let l:maxw  = max(map(copy(l:lines), 'strdisplaywidth(v:val)'))
  let l:width = max([l:maxw, l:min_width])

  " Styles (compact strings → split to chars)
  let l:styles = {
        \ '-': {'top': '┌─┐', 'vert': '││', 'bottom': '└─┘'},
        \ '=': {'top': '╔═╗', 'vert': '║║', 'bottom': '╚═╝'},
        \ '+': {'top': '+-+', 'vert': '||', 'bottom': '+-+'},
        \ }
  let l:style = has_key(l:styles, l:style_key) ? l:styles[l:style_key] : l:styles['-']
  let [l:tl, l:hz, l:tr]  = split(l:style.top, '\zs')
  let [l:bl, l:hz2, l:br] = split(l:style.bottom, '\zs')
  let [l:vl, l:vr]        = split(l:style.vert, '\zs')

  let l:top    = l:tl . repeat(l:hz, l:width + 2) . l:tr
  let l:bottom = l:bl . repeat(l:hz, l:width + 2) . l:br

  " Inner alignment helpers
  let l:block_left = float2nr((l:width - l:maxw) / 2)
  function! s:Align(line, width, align, block_left)
    let l:w = strdisplaywidth(a:line)
    let l:pad = a:width - l:w
    if l:pad < 0 | let l:pad = 0 | endif
    if a:align ==# 'center' || a:align ==# 'c1'
      let l:left  = float2nr(l:pad / 2)
      let l:right = l:pad - l:left
      return repeat(' ', l:left) . a:line . repeat(' ', l:right)
    elseif a:align ==# 'centerblock' || a:align ==# 'cblock' || a:align ==# 'c2'
      let l:left  = a:block_left
      let l:right = a:width - l:left - l:w
      if l:right < 0 | let l:right = 0 | endif
      return repeat(' ', l:left) . a:line . repeat(' ', l:right)
    elseif a:align ==# 'right'
      return repeat(' ', l:pad) . a:line
    else
      return a:line . repeat(' ', l:pad)
    endif
  endfunction

  " Build boxed lines (no outer margin yet)
  let l:boxed = [l:top]
  for l in l:lines
    let l:aligned = s:Align(l, l:width, l:align, l:block_left)
    call add(l:boxed, l:vl . ' ' . l:aligned . ' ' . l:vr)
  endfor
  call add(l:boxed, l:bottom)

  " ---- Outer (box) alignment against screen width ----
  if l:outer !=# 'none' && l:screenw > 0
    " visible width of the box line (same for top/bottom/body)
    let l:boxw = strdisplaywidth(l:boxed[0])
    let l:ml = 0
    if l:outer ==# 'center'
      let l:ml = float2nr((l:screenw - l:boxw) / 2)
    elseif l:outer ==# 'right'
      let l:ml = l:screenw - l:boxw
    else
      let l:ml = 0
    endif
    if l:ml < 0 | let l:ml = 0 | endif
    let l:margin = repeat(' ', l:ml)
    let l:boxed  = map(l:boxed, 'l:margin . v:val')
  endif
  " ---------------------------------------------------

  " Safe replace (no eating following lines)
  let l:sel_len = a:last - a:first + 1
  let l:box_len = len(l:boxed)
  if l:box_len <= l:sel_len
    call setline(a:first, l:boxed)
    if l:sel_len > l:box_len
      call deletebufline('', a:first + l:box_len, a:last)
    endif
  else
    call setline(a:first, l:boxed[0 : l:sel_len - 1])
    call append(a:first + l:sel_len - 1, l:boxed[l:sel_len :])
  endif
endfunction

" Wrapper parses args in any order:
"   style: '-', '=', '+'
"   width:  number or width=NN / w=NN / min=NN
"   inner alignment: left|right|center|centerblock|cblock|c1|c2
"   outer alignment: outer=left|center|right or oleft|ocenter|oright
"   screen width:    screen=NN / s=NN / page=NN
function! s:BoxCmd(line1, line2, qargs) range
  let l:style = '-'
  let l:minw  = 20
  let l:align = 'left'
  let l:outer = 'none'
  let l:screenw = (&textwidth > 0 ? &textwidth : 0)

  if !empty(a:qargs)
    for tok in split(a:qargs)
      if tok =~# '^\d\+$' | let l:minw = str2nr(tok)
      elseif tok =~# '^\%(w\|width\|min\)=\d\+$'   | let l:minw = str2nr(matchstr(tok, '\d\+'))
      elseif tok =~# '^\%(s\|screen\|page\)=\d\+$' | let l:screenw = str2nr(matchstr(tok, '\d\+'))
      elseif index(['-','+','='], tok) >= 0        | let l:style = tok
      elseif tok =~? '^\(left\|right\|center\|centerblock\|cblock\|c1\|c2\)$'
        let l:align = tolower(tok)
      elseif tok =~? '^outer=\(left\|center\|right\)$'
        let l:outer = tolower(matchstr(tok, '=\zs.*'))
      elseif tok =~? '^o\(left\|center\|right\)$'
        let l:outer = tolower(matchstr(tok, '^o\zs.*'))
      endif
    endfor
  endif

  call BoxSelection(a:line1, a:line2, l:style, l:minw, l:align, l:outer, l:screenw)
endfunction

" :Box [style] [minwidth or width=NN] [inner align] [outer align] [screen=NN]
command! -range -nargs=? Box <line1>,<line2>call <SID>BoxCmd(<line1>, <line2>, <q-args>)







function! Decore(...)
  let l:text  = getline('.')
  let l:total = (a:0 >= 1 ? a:1 : 40)

  let l:filler = (a:0 >= 2 ? a:2 : '-') " default '-'

  " Optional enclosers
  let l:l_enclose = ''
  let l:r_enclose = ''
  if a:0 >= 3 && type(a:3) == v:t_string && a:3 !=# ''
    let l:enc    = a:3
    let l:nchars = strchars(l:enc)
    if l:nchars >= 2
      let l:l_enclose = strcharpart(l:enc, 0, 1)
      let l:r_enclose = strcharpart(l:enc, l:nchars - 1, 1)
    else
      let l:l_enclose = l:enc
      let l:r_enclose = l:enc
    endif
  endif

  " Case: empty line → just filler
  if empty(l:text)
    call setline('.', repeat(l:filler, l:total))
    return
  endif

  " Build decorated text
  let l:has_enclose = (l:l_enclose !=# '' || l:r_enclose !=# '')
  if l:has_enclose
    let l:decorated = ' ' . l:l_enclose . ' ' . l:text . ' ' . l:r_enclose . ' '
  else
    let l:decorated = ' ' . l:text . ' '
  endif

  let l:remaining = l:total - len(l:decorated)

  if l:remaining < 2
    echo "Line too long for " . l:total . " chars"
    return
  endif

  " Distribute filler evenly
  let l:left  = repeat(l:filler, float2nr(l:remaining / 2))
  let l:right = repeat(l:filler, l:remaining - len(l:left))

  call setline('.', l:left . l:decorated . l:right)
endfunction



function! DecoreSmart(filler, countlen) abort
  let L = a:countlen >= 10 ? a:countlen
        \ : a:countlen == 1 ? 20
        \ : a:countlen == 2 ? 40
        \ : a:countlen == 3 ? 80
        \ : 40

  let c = getchar()                " Get exactly one key

  if c == 13 || c == 10 || c == 27 " CR  NL or Esc => no encloser
	  let E = ''
  else
	  let ch = nr2char(c)
	  let pairs = { '[':'[]', '{':'{}', '(':'()', '<':'<>', }
	  let E = has_key(pairs, ch) ? pairs[ch] : (ch . ch)
  endif

  call Decore(L, a:filler, E)
endfunction







function! AutoSaveToggle()
	if(!exists('b:autosave'))
		let b:autosave = 0
	endif

	let b:autosave = !b:autosave

	if(b:autosave) 
		autocmd! InsertLeave,TextChanged * if &ft !~ 'NvimTree' | write | endif
		echo 'autosave on'
	else
		autocmd! InsertLeave,TextChanged * 
		echo 'autosave off'
	endif
endfunction

function! ShowAutoSave()
	if(!exists('b:autosave') || b:autosave == 0)
		echo 'autosave is off'
	else 
		echo 'autosave is on'
	endif
endfunction



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
		" set winbar=File\ \-\ %f\ %R%M
		set winbar=[%f]\ %R%M
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


