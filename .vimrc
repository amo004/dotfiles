" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" 
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
" if has("autocmd")
"   filetype plugin indent on
" endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
" turning line numbers on 
set number  

" setting tab width to 2
set tabstop=2
set shiftwidth=2
set expandtab

" indent lines intelligently
set breakindent 

" don't break on words 
set linebreak

call plug#begin('~/.vim/plugged')
	Plug 'lervag/vimtex'
  Plug 'sirver/ultisnips'
	Plug 'xuhdev/vim-latex-live-preview', {'for': 'tex'}
  Plug 'dylanaraps/wal.vim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'w0rp/ale'
  Plug 'yggdroot/indentLine'
  Plug 'junegunn/goyo.vim'
  Plug 'tpope/vim-commentary'
  Plug 'mhinz/vim-startify'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'vim-airline/vim-airline'
  Plug 'xolox/vim-easytags'
  Plug 'xolox/vim-misc'
  Plug 'majutsushi/tagbar'
  Plug 'scrooloose/nerdtree'
  Plug 'Raimondi/delimitMate'
  Plug 'KeitaNakamura/tex-conceal.vim', {'for':'tex'}

  " Plug 'tpope/vim-surround'
  " Plug 'maxbrunsfeld/vim-yankstack'
  " Plug 'Valloric/YouCompleteMe'
  " Plug 'scrooloose/syntastic'
call plug#end()

colorscheme wal
let g:vimtex_view_method = 'zathura'
let g:livepreview_cursorhold_recompile = 0 
" let g:indentLineconceallevel = 1
" let mapleader = ' '
let g:airline_powerline_fonts = 1
let g:tex_conceal="abdgm"
set conceallevel=2
let g:vimtex_quickfix_enabled=0
let g:vimtex_view_zathura_options = '-c /home/slr/.config/zathura'

let g:ycm_filetype_blacklist = {'tex':1}

" I have disabled this code because it interferes with 
" latex symbol replacement provided by KeitaNakamura/tex-conceal.vim
" augroup remember_folds
"   autocmd!
"   autocmd BufWinLeave *.* mkview
"   autocmd BufWinEnter *.* silent! loadview 
" augroup END

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/ultisnips']
" filetype plugin indent on


map <C-o> :NERDTreeToggle<CR>
map <C-c> :TagbarOpenAutoClose<CR>
