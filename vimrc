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
    let $VIMFILES = $HOME.'\vimfiles'
elseif MySys() == "linux"
    let $VIMFILES = $HOME.'/.vim'
endif
let $VIMRCVER=system('git -C '.$VIMFILES.' rev-list --branches --max-count=1')
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
"打开状态栏标尺
set ruler
"高亮显示游标所在行
set cursorline
"高亮显示游标所在列
set cursorcolumn
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

"<leader>映射为空格
let mapleader = ","

"vim-easymotion config
map <Leader><leader>. <Plug>(easymotion-repeat)

"rainbow config
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

"vim-gitgutter config
set updatetime=250
nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterUndoHunk
nmap <Leader>hp <Plug>GitGutterPreviewHunk

"vim-auto-save config
let g:auto_save = 1

"键盘映射
nnoremap <Leader>w :w<CR>
