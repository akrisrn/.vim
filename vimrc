" 关闭vi兼容模式
set nocompatible
" 关闭文件类型检测, Vundle需求
filetype off
" 把Vundle加入到运行时路径中
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" git常用命令封装，行号旁修改状态显示
Plugin 'airblade/vim-gitgutter'
" mediawiki语法支持
Plugin 'chikamichi/mediawiki.vim'
" 括号补全
Plugin 'Raimondi/delimitMate'
" 代码补全
Plugin 'Valloric/YouCompleteMe'
" 代码结构垂直线
Plugin 'Yggdroot/indentLine'
" 快速移动
Plugin 'easymotion/vim-easymotion'
" json语法支持
Plugin 'elzr/vim-json'
" 配色方案
Plugin 'flazz/vim-colorschemes'
" 文本过滤与对齐
Plugin 'godlygeek/tabular'
" fugitive插件，git log展示
Plugin 'gregsexton/gitv'
" 多彩括号
Plugin 'luochen1990/rainbow'
" markdown语法支持
Plugin 'plasticboy/vim-markdown'
" vim和tmux剪切板互通
Plugin 'roxma/vim-tmux-clipboard'
" 多行编辑
Plugin 'terryma/vim-multiple-cursors'
" tmux中vim恢复focus events
Plugin 'tmux-plugins/vim-tmux-focus-events'
" 代码注释
Plugin 'tpope/vim-commentary'
" git命令封装
Plugin 'tpope/vim-fugitive'
" 重复命令
Plugin 'tpope/vim-repeat'
" 代码包围
Plugin 'tpope/vim-surround'
" 状态栏
Plugin 'vim-airline/vim-airline'
" 状态栏样式
Plugin 'vim-airline/vim-airline-themes'
" 自动保存
Plugin 'vim-scripts/vim-auto-save'
" 语法检查
Plugin 'vim-syntastic/syntastic'
call vundle#end()
" 检测文件类型，打开基于文件类型的插件和缩进
filetype plugin indent on
" 返回操作系统类型函数
function! MySys()
    if has("win16") || has("win32") || has("win64") || has("win95")
        return "windows"
    elseif has("unix")
        return "linux"
    endif
endfunction
" 用户目录变量$VIMFILES
if MySys() == "windows"
    let $VIMFILES = $HOME.'\vimfiles'
elseif MySys() == "linux"
    let $VIMFILES = $HOME.'/.vim'
endif
let $VIMRCVER=system('git -C '.$VIMFILES.' rev-list --branches --max-count=1')
command! Vimrcver echo $VIMRCVER
" 设置backspace的工作方式
set backspace=indent,eol,start
" 语法高亮
syntax on
" 显示关联行号
set number relativenumber
" 配色方案
colorscheme molokai
" 自动对齐
set autoindent
" 智能选择对齐方式
set smartindent
" tab转换为空格
set expandtab
" 设置tab为4个空格
set tabstop=4
" 设置按<<和>>时的缩进量为4个空格
set shiftwidth=4
" 设置退格键一次清除4个空格
set softtabstop=4
" 设置括号匹配
set showmatch
" 设置魔术匹配
set magic
" 打开状态栏标尺
set ruler
" 高亮显示游标所在行
set cursorline
" 高亮显示游标所在列
set cursorcolumn
" 实时匹配并高亮搜索结果
set incsearch
" 设置GUI显示字体和大小
set guifont=Source\ Code\ Pro:h11
" 设置字符编码
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
set termencoding=utf-8
set encoding=utf-8
" 设置vim语言为英文
language en_US.utf8
" 解决GVIM菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" 高亮显示搜索结果
set hlsearch
" 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set ignorecase smartcase
" <leader>映射为逗号
let mapleader = ","
" 键盘映射
nnoremap <Leader>w :w<CR>

" TMUX使用中的光标变化
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[2 q"
endif

" vim-easymotion config
map <Leader><leader>. <Plug>(easymotion-repeat)

" rainbow config
let g:rainbow_active = 1
let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}

" vim-auto-save config
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0

" syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" vim-commentary config
autocmd FileType apache set cms=#\ %s
