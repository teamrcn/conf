"# vim:foldmethod=marker

"# {{{ Vundle Settings
	" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	" vim +PluginInstall +qall
	set nocompatible              " required
	filetype off                  " required

	" set the runtime path to include Vundle and initialize
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()

	" alternatively, pass a path where Vundle should install plugins
	"call vundle#begin('~/some/path/here')

	" let Vundle manage Vundle, required
	Plugin 'gmarik/Vundle.vim'

	" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
	Plugin 'mechatroner/rainbow_csv'
	Plugin 'tmhedberg/SimpylFold'
	Plugin 'tpope/vim-sleuth'       "automagic spaces/tabs
	Plugin 'davidhalter/jedi-vim'   "vim auto complete
	Plugin 'ap/vim-css-color'
	let g:SimpylFold_docstring_preview=1
	Plugin 'vim-scripts/indentpython.vim'
	"Bundle 'Valloric/YouCompleteMe'
	"let g:ycm_autoclose_preview_window_after_completion=1
	"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
	Plugin 'scrooloose/syntastic' "VIM check your syntax on each save with the syntastic extension:
	Plugin 'nvie/vim-flake8' "Python PEP8 checking
	Plugin 'scrooloose/nerdtree' " file tree
	Plugin 'jistr/vim-nerdtree-tabs'
	let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
	" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

	" All of your Plugins must be added before the following line
	call vundle#end()            " required
	filetype plugin indent on    " required
"# }}}

"# {{{ Vim Settings
	map <C-n> :NERDTreeToggle<CR>
	"imap <C-n> :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "How can I close vim if the only window left open is a NERDTree?
"# }}}

"# {{{ Vim Settings
	set vb t_vb=    " No bell! (no beep)

	set nocompatible
	:set backspace=2 "indent,eol,start
	"fixes the delete button to del
	":fixdel 
	:set dictionary=/usr/dict/words
	":set dictionary+=~/.config/vim/dictionary/words-english

	" select case-insenitive search
	set ignorecase 
	" highlight all matches...
	set hls
	set incsearch

	"The h and l keystrokes can be made to wrap over lines (so that trying to move left past the beginning of a line puts the cursor at the end of the line above). This command does that, and also allows ~ (convert case) to wrap over lines, and the cursor keys to wrap when in insert mode: 
	set whichwrap=h,l,~,[,]
	"backup: this makes the '~' files, which I hate.  Keep it off.
	set nobackup
	" writebackup: we're not doing backups, so ignore this.
	set nowritebackup

	" statusline: filename, filetype, row/maxrow, col, % of file, flags
	set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
	
	" suffixes: these get lower priority with trying to match filenames
	set   suffixes=.aux,.bak,.dvi,.gz,.idx,.log,.ps,.swp,.tar,CVS
"# }}}

"# {{{ Vim Visual Settings
	colorscheme evening 
	:set term=linux
	"set textwidth=80
	"set columns=80
	if has("syntax")
		syntax on
	endif

	:set ruler  "shows ruler on bottom right
	"Make use of the "status line" to show possible completions of command line commands, file names, and more
	:set wildmenu
	set wildmode=list:longest,full " list all options and complet
	:set number
	:set background=dark
	:set showmatch
	" The % keystroke is useful for bouncing around pairs of various sorts of brackets. It can be made to work for angled brackets as well: 
	set matchpairs+=<:>

	":highlight Comment ctermfg=blue
	":highlight Constant ctermfg=darkblue
	":highlight Boolean ctermfg=brown 
	"was magenta
	":highlight Character ctermfg=brown
	":highlight Conditional ctermfg=red
	":highlight Identifier ctermfg=darkgreen
	":highlight Statement ctermfg=magenta
	"was brown
	":highlight Type cterm=bold ctermfg=darkgreen
	"
	"hi Comment    term=bold ctermfg=Red guifg=#80a0ff
	"hi Comment    ctermfg=Cyan guifg=#80a0ff
	"hi Constant   term=underline ctermfg=Magenta guifg=#ffa0a0
	"hi Special    term=bold ctermfg=LightRed guifg=Orange
	"hi Identifier term=underline cterm=bold ctermfg=Cyan guifg=#40ffff
	"hi Statement  term=bold ctermfg=Yellow guifg=#ffff60 gui=bold
	"hi PreProc    term=underline ctermfg=LightBlue guifg=#ff80ff
	"hi Type       term=underline ctermfg=LightGreen guifg=#60ff60 gui=bold
	"hi Ignore     ctermfg=black guifg=bg
"# }}}

"# {{{ Formatting options
	:set noet

	"This allows to add text to a comment and still be within the comment
	"after you start a new line
	:set formatoptions=cqrt
"# }}}

"# {{{ KeyBoard Mapping
	"if &term =~ "xterm"
	"    set t_kb=
	"	set t_kD=?[3~
	"	"fixdel
		"set t_kI=?[2~
		"set t_kP=?[5~
		""set t_kN=?[6~
		"if has("terminfo")
			"set t_Co=8
			"set t_Sf=?[3%p1%dm
			"set t_Sb=?[4%p1%dm
		"else
			"set t_Co=8
			"set t_Sf=?[3%dm
			"set t_Sb=?[4%dm
		"endif
	"endif

	"If you have your cursor over projects/foo and hit gf in command mode, the foo file in the projects directory will open in a new buffer. To navigate the jump history, use Tab or Ctrl-I to go forward and Ctrl-O to move backwards. Your todo file can now link to related files without any actual link markup! Maximum laziness.
	:map gf :e <cfile><CR>


	"maps pageup to be pageup
	map <C-PageUp> :ptp<cr>
	map <C-PageDown> :ptn<cr>
	noremap <Space> <PageDown>
	noremap <C-Space> <PageUp>
	map <C-A> <Home>
	imap <C-A> <Home>
	map <C-E> <End>
	imap <C-E> <End>
	map <C-Home> ^
	map <Home> ^
	set pastetoggle=<C-P>
    imap <D-V> ^O"+p
	imap <C-t> <ESC>:w<cr>i
	map <C-t> <ESC>:w<cr>


	" Folkes auto-reindenter
	" great auto indenter :)
	function! SavePos()
		let g:restore_position_excmd = line('.').'normal! '.virtcol('.').'|'
	endfun
	function! RestorePos()
		exe g:restore_position_excmd
		unlet g:restore_position_excmd
	endfun
	"sets f12 to fold code
	"to use, goto the opening parentisis
	"of a method and press f12
	"to unfold code, press za
	:map <F12> <ESC>v%zf<up><up>

	:set lcs=tab:>-,trail:%,eol:$ 
	":map <C-t> :set list! "shows the space,tabs and other special characters
"# }}}

"# {{{ Vim FileType
	":set autoindent
	":set smartindent
    :filetype plugin indent on
    :syntax enable
    :set tabstop=4
    ":set expandtab
	":set softtabstop=4
	":set shiftwidth=4
	":set cindent
	":set cino=>4
	:set comments=sr:/*,mb:*,el:*/,://,b:#,:%,:XCOMM,n:>,:--,sr:{-,mb:-,el:-}
	:set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
	:set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
	highlight BadWhitespace ctermbg=red guibg=darkred
	augroup filetypedetect
		au BufNewFile,BufRead,BufEnter *.html set filetype=htmlm4
		au BufNewFile,BufRead,BufEnter *.java :iab sss System.out.println();<esc>hha
		au BufNewFile,BufRead,BufEnter *.java :iab psvm public static void main(String args[])
		au BufNewFile,BufRead,BufEnter *.java :set makeprg=javac\ %
		au BufNewFile,BufRead,BufEnter *.java :imap <F9> <ESC><ESC>:w<cr>:make<cr>
		au BufNewFile,BufRead,BufEnter *.java :map <F9> <ESC><ESC>:w<cr>:make<cr>
		au BufNewFile,BufRead,BufEnter *.java :map <F10> :!java -cp %:p:h %:t:r 
		au BufNewFile,BufRead,BufEnter *.java :imap <F10> :!java -cp %:p:h %:t:r 
		au BufNewFile,BufRead,BufEnter *.sc source /home/mercury1/crs/vim/share/vim/syntax/c.vim
		au BufNewFile,BufRead,BufEnter *.c  :imap ppp printf("\n");<esc>hhhhi 
        "au BufNewFile,BufRead,BufEnter *.c  :set makeprg=cc\ %
		au BufNewFile,BufRead,BufEnter *.c  :map <F9> <ESC><ESC>:w<cr>:make<cr>
		au BufNewFile,BufRead,BufEnter *.c  :imap <F9> <ESC><ESC>:w<cr>:make<cr>
		au BufNewFile,BufRead,BufEnter *.c  :map <F10> <ESC><ESC>:w<cr>:!make<cr>
		au BufNewFile,BufRead,BufEnter *.c  :imap <F10> <ESC><ESC>:w<cr>:!make<cr>
		au BufNewFile,BufRead,BufEnter *.c  :ab { <cr><up>{<cr>}<up>
		"au BufNewFile,BufRead,BufEnter *.c  :map <f9> <ESC>:w<ESC>:!cc % -o %:t:r<CR> 
		"au BufNewFile,BufRead,BufEnter *.c  :map <F10> <ESC>:!%:t:r<cr> 
		"au BufNewFile,BufRead,BufEnter *.c  :imap <f9> <ESC>:w<ESC>:!cc % -o %:t:r<CR> 
		"au BufNewFile,BufRead,BufEnter *.c  :imap <F10> <ESC>:!%:t:r<cr>
		au FileType make set noexpandtab
		au BufNewFile,BufRead,BufEnter *.py set expandtab
		au BufNewFile,BufRead,BufEnter *.py set tabstop=4
		au BufNewFile,BufRead,BufEnter *.py set softtabstop=4
		au BufNewFile,BufRead,BufEnter *.py set shiftwidth=4
		au BufNewFile,BufRead,BufEnter *.py set cindent
		au BufNewFile,BufRead,BufEnter *.py set cino=>4
		au BufNewFile,BufRead,BufEnter *.py setl nosmartindent
		au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
		au BufNewFile,BufRead *.js, *.html, *.css set tabstop=2
		au BufNewFile,BufRead *.js, *.html, *.css set softtabstop=2
		au BufNewFile,BufRead *.js, *.html, *.css set shiftwidth=2
		autocmd FileType perl set makeprg=perl\ -w\ -c\ %\ $*
		autocmd FileType perl set errorformat=%f:%l:%m
		autocmd FileType perl set autowrite
		autocmd FileType perl let perl_extended_vars = 1
		au BufNewFile,BufRead,BufEnter *.pl :map <F9> <ESC><ESC>:w<cr>:make <cr>
		au BufNewFile,BufRead,BufEnter *.pl :imap <F9> <ESC><ESC>:w<cr>:make <cr>
	augroup END
	let python_highlight_all=1
"# }}}

"# {{{ Vim Tips
	"Ctags for python
	"For Python there is a similar program in the standard distribution, usually
	"under /usr/lib/python2.3/Tools/scripts/ptags.py if your Python version is
	"2.3. This little script will generate a 'tags' file for any number of Python
	"source files and allow you to locate class and function definitions easily
	"while editing a whole set of files.
"# }}}

"# {{{ vimdiff
    if &diff
        " diff mode
        set diffopt+=iwhite
    endif
    set noro
"# }}}

"# {{{ Vim Folding
    :set foldmethod=syntax
    :set foldlevel=0
    :set foldnestmax=1

    "There are a lot of options for folding but the simplest way to use it is to have it cue off of your indentation. Here are some typical settings for indentation, I won't explain them because there really aren't reasons to have to modify them on a regular basiS.
    set foldmethod=indent 
    set foldlevel=0 
    set foldnestmax=2 
    set fillchars=stl:_,stlnc:-,vert:\|,fold:\ ,diff:-
    "Admittedly the folding feature can, on occasion, seem to get in the way of working with a file. Because of that I have added a mapping to my .vimrc to toggle folding. 
    map F :let &fen = !&fen<cr>
    function! ToggleFolding()
        let var1=0
        echo var1
        execute foldlevel(var1)
        if var1 > 0
            set foldlevel=0
        else
            set foldlevel=20
        return var1
    endfunction
"# }}}
