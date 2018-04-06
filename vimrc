" 关闭vi兼容模式
set nocompatible
" 返回操作系统类型函数
function! MySys()
    if has("win16") || has("win32") || has("win64") || has("win95")
        return "windows"
    elseif has("unix")
        return "linux"
    endif
endfunction
let $SYS = MySys()
if $SYS == "windows"
    " windows配置目录
    let $VIMFILES = $HOME.'\vimfiles'
elseif $SYS == "linux"
    " linux配置目录
    let $VIMFILES = $HOME.'/.vim'
    " 设置默认shell为bash
    set shell=bash
    " 如果plug.vim不存在则自动下载
    if empty(glob($VIMFILES.'/autoload/plug.vim'))
        silent !curl -fLo $VIMFILES/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endif
" 启动plug.vim插件管理
call plug#begin()
" git常用命令封装，行号旁修改状态显示
Plug 'airblade/vim-gitgutter'
" mediawiki语法支持
Plug 'chikamichi/mediawiki.vim'
" fish脚本编辑支持
Plug 'dag/vim-fish'
" 括号补全
Plug 'Raimondi/delimitMate'
" 代码结构垂直线
Plug 'Yggdroot/indentLine'
" 快速移动
Plug 'easymotion/vim-easymotion'
" json语法支持
Plug 'elzr/vim-json'
" 配色方案
Plug 'flazz/vim-colorschemes'
" 文本过滤与对齐
Plug 'godlygeek/tabular'
" fugitive插件，git log展示
Plug 'gregsexton/gitv'
" 多彩括号
Plug 'luochen1990/rainbow'
" markdown语法支持
Plug 'plasticboy/vim-markdown'
" vim和tmux剪切板互通
Plug 'roxma/vim-tmux-clipboard'
" 多行编辑
Plug 'terryma/vim-multiple-cursors'
" tmux中vim恢复focus events
Plug 'tmux-plugins/vim-tmux-focus-events'
" 代码注释
Plug 'tpope/vim-commentary'
" git命令封装
Plug 'tpope/vim-fugitive'
" 重复命令
Plug 'tpope/vim-repeat'
" 代码包围
Plug 'tpope/vim-surround'
" 状态栏
Plug 'vim-airline/vim-airline'
" 状态栏样式
Plug 'vim-airline/vim-airline-themes'
" 自动保存
Plug 'vim-scripts/vim-auto-save'
" 语法检查
Plug 'vim-syntastic/syntastic'
" 侧边栏目录浏览
Plug 'scrooloose/nerdtree'
" 侧边栏目录支持git标记
Plug 'Xuyuanp/nerdtree-git-plugin'
" 文本对齐
Plug 'junegunn/vim-easy-align'
" 代码片段
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" 沉浸模式
Plug 'junegunn/goyo.vim'
" 高度沉浸
Plug 'junegunn/limelight.vim'
" 配色方案
Plug 'junegunn/seoul256.vim'
if $SYS == "linux"
    " 模糊查找器
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    " 代码补全
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
endif
call plug#end()
" 查看当前vim配置的git提交
let $VIMRCVER=system('git -C '.$VIMFILES.' rev-list --branches --max-count=1')
command! Vimrcver echo $VIMRCVER
" 设置backspace的工作方式
set backspace=indent,eol,start
" 显示关联行号
set number relativenumber
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
set guifontwide=新宋体:h11:cGB2312:qDRAFT
" 设置字符编码
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
set termencoding=utf-8
set encoding=utf-8
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
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><leader>l <Plug>(easymotion-lineforward)
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

" nerdtree config
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <Leader>q :NERDTreeToggle<CR>
nnoremap <Leader>a :NERDTreeFocus<CR>

" vim-easy-align config
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" ultisnips conifg
let g:UltiSnipsExpandTrigger="<c-x>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" goyo config
let g:goyo_width="70%"
let g:goyo_height="100%"
function! s:goyo_enter()
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
    set noshowmode
    set noshowcmd
    set scrolloff=999
    Limelight
endfunction
function! s:goyo_leave()
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
    set showmode
    set showcmd
    set scrolloff=5
    Limelight!
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" limelight config
nmap <Leader>l <Plug>(Limelight)
xmap <Leader>l <Plug>(Limelight)

" seoul256 config
let g:seoul256_background = 233
let g:seoul256_light_background = 256
let g:seoul256_srgb = 1
colo seoul256
