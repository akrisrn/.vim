"返回操作系统类型函数
function! MySys()
    if has("win16") || has("win32") || has("win64") || has("win95")
        return "windows"
    elseif has("unix")
        return "linux"
    endif
endfunction
"用户目录变量$VIMFILES
if MySys() == "windows"
    let $VIMFILES = $VIM.'/vimfiles'
elseif MySys() == "linux"
    let $VIMFILES = $HOME.'/.vim'
endif
let $VIMRCVER=system('git --git-dir='.$VIMFILES.'/.git rev-list --branches | head -n 1 | cut -b 1-5')
command Vimrcver echo $VIMRCVER
"关闭vi兼容模式
set nocompatible
"设置backspace的工作方式
set backspace=indent,eol,start
"启用pathogen管理插件
execute pathogen#infect()
"语法高亮
syntax on
"检测文件类型，打开基于文件类型的插件和缩进
filetype plugin indent on
"显示行号
set number
"配色方案
colorscheme molokai
"自动对齐
set autoindent
"智能选择对齐方式
set smartindent
"tab转换为空格
set expandtab
"设置tab为4个空格
set tabstop=4
"设置按<<和>>时的缩进量为4个空格
set shiftwidth=4
"设置退格键一次清除4个空格
set softtabstop=4
"设置括号匹配
set showmatch
"设置魔术匹配
set magic
"关闭错误时的响声
set vb t_vb=
"打开状态栏标尺
set ruler
"高亮显示游标所在行
set cursorline
"实时匹配并高亮搜索结果
set incsearch
"设置GUI显示字体和大小
set guifont=Source\ Code\ Pro:h11
"设置字符编码
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
set termencoding=utf-8
set encoding=utf-8
"解决GVIM菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"高亮显示搜索结果
set hlsearch
"搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set ignorecase smartcase
"开启折叠
set foldenable              
"设置语法折叠
set foldmethod=syntax
"设置折叠区域的宽度 
set foldcolumn=0
"设置折叠层数
setlocal foldlevel=1
