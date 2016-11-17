" 不兼容vi be iMproved
set nocompatible

" Set to auto read when a file is changed from the outside
set autoread

" 自动设当前编辑的文件所在目录为当前工作路径
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
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
" gvim windows 编码设置
set fileencodings=utf-8,chinese,latin-1

if has("win32")
    set fileencoding=chinese
    set guifont=Consolas:h12
else
    set fileencoding=utf-8
endif

if has('gui_running')
    " 窗口启动最大化
    autocmd GUIEnter * simalt~x 
    " 隐藏菜单栏
    set guioptions-=m
    " 隐藏工具栏
    set guioptions-=T
    " 隐藏左侧滚动条
    set guioptions-=L
    " 隐藏右侧滚动条
    set guioptions-=r
    " 隐藏底部滚动条
    set guioptions-=b
endif 

"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"解决console输出乱码
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
" 语法检查
Plugin 'scrooloose/syntastic'
" 注释助手
Plugin 'scrooloose/nerdcommenter'
" javascript 语法高亮
Plugin 'pangloss/vim-javascript'
" 目录树
Plugin 'scrooloose/nerdtree'
" stylus 语法高亮
Plugin 'wavded/vim-stylus'
" code format
Plugin 'Chiel92/vim-autoformat'
" youcompleteme
Plugin 'Valloric/YouCompleteMe'
" autocomplete
Plugin 'ternjs/tern_for_vim' 
" enhance status line
Plugin 'vim-airline/vim-airline'
" vue component hl
Plugin 'posva/vim-vue'
" jade hl and indent
Plugin 'digitaltoad/vim-pug'
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
" always show status line
set laststatus=2
" show buffer tabs
let g:airline#extensions#tabline#enabled = 1

colorscheme smyck

let mapleader = ","
" Run current file
noremap <F9> :!node --harmony %<CR>
noremap <F10> :!babel-node %<CR>

" code formatter
noremap <C-F> :Autoformat<CR>
" NERDTree toggle
noremap <F2> :NERDTreeToggle<CR>

" enable tern keyboard shortcuts
let g:tern_map_keys=1
" display argument type hints when the cursor is left over a function
let g:tern_show_argument_hints='on_hold'
" <Leader> td   :TernDoc	Documentation under cursor
" <Leader> tb	:TernDocBrowse	Browse documentation
" <Leader> tt	:TernType	Type hints
" <Leader> td	:TernDef	Jump to definition (yes, 'td' is duplicated)
" <Leader> tpd	:TernDefPreview	Jump to definition inside preview
" <Leader> tsd	:TernDefSplit	Definition in new split
" <Leader> ttd	:TernDefTab	Definition in new tab
" <Leader> tr	:TernRefs	All references under cursor
" <Leader> tR	:TernRename	Rename variable

 "next buffer, prev buffer
noremap <leader>bp :bp<CR> 
noremap <leader>bn :bn<CR>
noremap <C-PageUp>   :bp<CR>
noremap <C-PageDown> :bn<CR>
