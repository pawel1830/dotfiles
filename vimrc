set t_Co=256


" load NeoBundle
if has('vim_starting')
	set nocompatible               " Be iMproved
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
NeoBundle 'Shougo/vimproc.vim', {
	\   'build' : {
	\     'windows' : 'tools\\update-dll-mingw',
	\     'cygwin' : 'make -f make_cygwin.mak',
	\     'mac' : 'make -f make_mac.mak',
	\     'linux' : 'make',
	\     'unix' : 'gmake',
	\   }
	\ }

" kolory
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/peaksea'
NeoBundle 'wesgibbs/vim-irblack'
NeoBundle 'tomasr/molokai'
NeoBundle 'therubymug/vim-pyte'
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-colorscheme-switcher'

NeoBundle 'bling/vim-airline'
" git utility
NeoBundle 'tpope/vim-fugitive'

" python jedi
"NeoBundle 'davidhalter/jedi-vim'
"NeoBundle 'davidhalter/jedi-vim', {'autoload':{'filetypes':['python']}} "{{{
"	let g:jedi#popup_on_dot=0
"	let g:jedi#completions_enabled = 0
""}}}
NeoBundle 'hdima/python-syntax'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
"NeoBundle 'scrooloose/syntastic' "{{{
	
	"let g:syntastic_check_on_open=1
	"let g:syntastic_enable_balloons = 1
	"let g:syntastic_python_checkers = ['flake8']
	"let g:syntastic_c_checkers = ['cppcheck', 'make']
	"let g:syntastic_cpp_checkers = ['cppcheck', 'make']
""}}}

	"set statusline+=%#warningmsg#
	"set statusline+=%{SyntasticStatuslineFlag()}
	"set statusline+=%*


filetype on
filetype plugin on
filetype indent on

" golang syntax, compiler etc
NeoBundle 'jnwhiteh/vim-golang'
" syntax for thrift files
NeoBundle 'sprsquish/thrift.vim'

" NeoBundle installation check
NeoBundleCheck

call neobundle#end()

" ============== jnwhiteh/vim-golang setup ==============
" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on


" ============== Restore last position ============
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END


"============== Airline Config ===================
"let g:airline_powerline_fonts = 1
set encoding=utf-8
"if $COLORTERM == 'gnome-terminal'
"  set t_Co=256
"endif
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif
"let g:airline_symbols.space = "\ua0"
set laststatus=2





"Store lots of :cmdline history
set history=1000

set nowrap

set tabstop=4

"ciemne tło komentarze ciemno niebieskie
"set background=dark
"highlight Comment guifg=DarkGreen ctermfg=Grey
" Pracuje na jasnym tle. Komentarze chce miec zielone.
"set background=light
"highlight Comment guifg=Grey ctermfg=Grey

"   dwa ponizsze do oznaczania tabulacji oraz konczacych spacji
"highlight SpecialKey guifg=DarkBlue ctermfg=DarkBlue
"set list listchars=trail:·,tab:»·
set list listchars=trail:.,tab:>.

set cindent
set ruler
syntax on

" Pokazywanie pasujacych nawiasow
" (przy wstawianiu, lub najezdzamy na klamerke i wciskamy Shift+5)
set showmatch

" Podswietlanie znalezionych
set hlsearch

" Pokazywanie numerkow lini
"set number

" Auto-zapis plikow
set autowrite

" Przy uzupelnianiem tabem czegokolwiek w lini polecen - wyswietla od razu wszystkie mozliwosci
set wildmenu

" Zeby backspace mozna bylo kasowac wszystko (a nie tylko
" na przyklad to co w ostatnim insercie zostalo dodane)
set bs=2

" More context for vimdiff
set diffopt=filler,context:20

" Domyslne kodowanie znakow:
set encoding=utf8
"set encoding=iso8859-2
"set fileencoding=iso8859-2

let mapleader = ","
map <Leader>k <c-w>j
map <Leader>l <c-w>k
map <Leader>j <c-w>l
map <Leader>h <c-w>h

"numerowanie linii
map <F2> :let &number=1-&number<CR>

"włączenie drzewka z plikami
map <Leader>t :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"Wyszukiwanie i zamiana zaznaczonego tekstu
map <C-r> "hy:%s/<C-r>h//c<left><left>

"łatwiejsze przeskakiwanie pomiędzy kartami
map <C-n> <esc>:tabprevious<CR>
map <C-m> <esc>:tabnext<CR>

"wyłączenie podświetlenia 
map <C-h> :noh<CR>
"dodanie tabulacji dla zaznaczonego tekstu 
vmap <Tab> ><CR>
vmap <S-Tab> <<CR>
" Nacisne F5 to przejdzie mi na ciemne tlo i ciemnosielone komentarze
" Nacisne F6 to przejdzie mi na jasne tlo i zielone komentarze
"map <F5> :set background=light<CR>:hi Comment guifg=DarkGrey ctermfg=DarkGrey<CR>:hi Pmenu ctermbg=Grey ctermfg=Black<CR>:hi PmenuSel ctermbg=Red ctermfg=White<CR>
"map <F6> :set background=light<CR>:hi Comment guifg=Grey ctermfg=Grey<CR>:hi SpecialKey guifg=DarkBlue ctermfg=DarkBlue<CR>
"map <F7> :set background=dark<CR>:hi Comment guifg=LightGrey ctermfg=LightGrey<CR>:hi SpecialKey guifg=LightBlue ctermfg=LightBlue<CR>
map <F7> :let &background = ( &background == "dark"? "light" : "dark" )<CR>
"podstawowe kolory
colorscheme peachpuff
set background=light
"let g:molokai_original = 1

" Nacisniecie F5 odpali edytowany pythonowy skrypt
map <F5> :w !python<CR>
map <C-L> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
" podstawowe kolory, niezaleznie od powyzszych, odpowiednik F6:
"hi Comment guifg=Grey ctermfg=Grey
"hi SpecialKey guifg=DarkBlue ctermfg=DarkBlue
"hi Comment guifg=LightBlue ctermfg=LightBlue
"hi Constant guifg=DarkGrey ctermfg=DarkGrey
hi jediFat term=bold,underline cterm=bold,underline ctermbg=0 ctermfg=Grey gui=bold,underline guifg=White guibg=#555555

" omni-complete, czyli Ctrl+X
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType as set omnifunc=actionscriptcomplete#CompleteCSS
autocmd FileType c set omnifunc=ccomplete#Complete

" python pep8 compat
" "autocmd BufNewFile,BufRead *.py
autocmd FileType python setlocal
	\ tabstop=4
	\ softtabstop=4
	\ shiftwidth=4 
	\ textwidth=120
	\ smarttab
	\ expandtab
