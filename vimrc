" ������vi be iMproved
set nocompatible

" Set to auto read when a file is changed from the outside
set autoread

" �Զ��赱ǰ�༭���ļ�����Ŀ¼Ϊ��ǰ����·��
set autochdir

" Show current line and column
set ruler

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Ignore case when searching
set ignorecase

" When searching try to be smart abount cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch

" Enable syntax highlighting
syntax enable
" ������ָ���﷨������ɫ�����滻Ĭ�Ϸ���
syntax on

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
" gvim windows ��������
set fileencodings=utf-8,chinese,latin-1

if has("win32")
    set fileencoding=chinese
else
    set fileencoding=utf-8
endif

"����˵�����
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"���console�������
language message zh_CN.utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" show line num
set nu

" Turn backup off, since most stuff is in SVN, git etc anyway...
set nobackup
"set noswapfile
set noundofile
set nowritebackup

"set no belling and flash
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle settings begin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include Vundel and initialize
if has("win32")
    set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
    call vundle#begin('$VIM/vimfiles/bundle/')
else 
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin(')
endif
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/hear')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" �﷨���
Plugin 'scrooloose/syntastic'
" ע������
Plugin 'scrooloose/nerdcommenter'
" javascript �﷨����
Plugin 'pangloss/vim-javascript'
" Ŀ¼��
Plugin 'scrooloose/nerdtree'
" stylus �﷨����
Plugin 'wavded/vim-stylus'
" code format
Plugin 'Chiel92/vim-autoformat'
call vundle#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle settings end
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable filetype detect, plugin, indent
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic settings begin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=1

let g:syntastic_javascript_checkers = ['eslint']
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic settings end
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme smyck
" Run current file
noremap <F9> :!node --harmony %<CR>
" code formatter
noremap <C-F> :Autoformat<CR>
" NERDTree toggle
noremap <F2> :NERDTreeToggle<CR>
