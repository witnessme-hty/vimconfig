"***基础设置***
let mapleader=" " "将leader键设置为空格，原来是反斜杠，leader类似于windows键
set nocompatible "与vi不兼容模式

"文件类型
filetype on
filetype plugin on
filetype indent on
filetype plugin indent on

"各种乱七八糟的设置
set encoding=utf-8 "编码格式
let &t_ut='' "一些终端使用vim时可能配色不对，该命令修正这个问题
set nobackup "使用vim编辑不备份文件
set noswapfile "防止异常关闭时生成交换文件
set mouse = "关闭鼠标,=a启用鼠标
set vb t_vb = "关闭报警声
set wildmenu "输入“：内容”，按下tab键可列出包含内容的命令列表，按tab键可遍历,可用于查看可补全内容
"set nowrap "禁止自动换行
set backspace=indent,eol,start
set autochdir "vim在当前文件目录下执行命令
set number "显示行号
set ruler
set showcmd "显示输入的命令
set cul "cursorline,显示光标所在行
"set cuc "显示光标所在列
syntax on "语法高亮,使用系统高亮方案
"syntax enable "开启自定义高亮方案，系统方案会覆盖自定义方案？
set showmatch "短暂显示匹配的括号
set sm! "高亮显示括号匹配
set splitright "水平分割的窗口在右侧显示
set splitbelow "垂直分割的窗口在下方显示
"highlight LineNr ctermfg = red "彩色终端中，行号的前景色
"highlight LineNr ctermbg = black "彩色终端中，行号的背景色
"下次打开文件后光标处于上次的位置
au BufReadPost * if line("''\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
set scrolloff=5 "光标的上方和下方至少始终有5行

"缩进
set expandtab "将制表符设置为空格
set tabstop=4 "设置tab制表符为4个空格
set softtabstop=4 
set shiftwidth=4 "自动缩进使用的长度
set autoindent "自动缩进
set smartindent "智能缩进,遇}不缩进，行首遇#不缩进
autocmd FileType c :set cindent "c文件按c格式缩进

set list "显示行尾在何处      
set listchars=tab:<->,trail:□,eol:$ "行尾空格的显示样式

"让光标在不同模式下显示不同样式，这个终端没起作用
"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"搜索设置
set incsearch "实时更新搜索内容
set ignorecase "搜索忽略大小写
set smartcase "输入大写只搜索大写，输入小写大小写都会搜索
set hlsearch "高亮搜索
"输入冒号后会执行的动作,输入冒号,会自动再输入nohlsearch,这里的用法是：在搜索过程中，没有按下回车前输入冒号，高亮就会消失
exec "nohlsearch"
"set nowrapscan "禁止环形搜索
set wrapscan "开启环形搜索,最后一个搜索项的下一个是第一个

"状态栏
"已加载airline插件，下边两行就不用了
set ls=2 "laststatus,总是显示状态栏
"set statusline=[%F%m%r%h%w]\ [%{&ff}]\ %y\ [ascii:\%b]\ [row:%l,col:%v(%p%%)]\ [rows:%L] "状态栏显示的内容


"***插件***
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline' "一个状态栏插件
Plug 'connorholyday/vim-snazzy' "一个背景色插件
Plug 'luochen1990/rainbow' "彩虹括号
Plug 'preservim/nerdcommenter' "注释插件
Plug 'preservim/nerdtree' "目录树插件
Plug 'preservim/tagbar' "函数列表预览插件
Plug 'skywind3000/vim-auto-popmenu' "自动补全插件
Plug 'skywind3000/vim-dict' "补全字典
call plug#end()

"插件配置
"---snazzy---
colorscheme snazzy "修改主题配色
"默认配色方案有：blue,darkblue,default,delek,desert,elflord,evening,industry,koehler,morning,murphy,pablo,peachpuff,ron,shine,slate,torte,zellner
let g:SnazzyTransparent=1 "snazzy背景透明度
"---rainbow---
let g:rainbow_active = 1 "启用rainbow插件,这个插件是下载好直接放进plugin文件夹里的，没有通过vim-plug下载
"---vim-auto-popmenu,vim-dict---
let g:apc_enable_ft={'c':1} "设定需要生效的文件类型，如果是 "*" 的话，代表所有类型
set cpt=.,k,w,b "设定从字典文件以及当前打开的文件里收集补全单词，详情看 ':help cpt'
set completeopt=menu,menuone,noselect "不要自动选中第一个选项。
set shortmess+=c "禁止在下方显示一些啰嗦的提示


"***键盘映射***
"map默认是递归映射，a映射为b，b映射为c，那么a就是c；noremap是非递归映射；加前缀是适用于何种模式下的映射
"leader+回车 视为 取消高亮命令+回车:
nnoremap <LEADER><CR> :nohlsearch<CR>
"执行更新vimrc命令
map <LEADER><LEADER> :source $MYVIMRC<CR>
"双击j,代替esc:
inoremap jj <ESC>
"保存
nnoremap W :w<CR>
"退出
nnoremap Q :q<CR>
"来回切换vim和shell
"noremap <c-d> :sh<cr>

"插入模式下光标移动
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

"匹配括号
"c文件中花括号自动格式化:
autocmd FileType c inoremap { {<CR>}<ESC>kA<CR>
"自动补全右括号：
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
inoremap { {}<ESC>i
inoremap < <><ESC>i

"窗口分割
"设置窗体的分割方式并分割出窗体:
map <LEADER>sl :set splitright<CR>:vsplit<CR>
map <LEADER>sh :set nosplitright<CR>:vsplit<CR>
map <LEADER>sk :set nosplitbelow<CR>:split<CR>
map <LEADER>sj :set splitbelow<CR>:split<CR>
"在分割的窗体键切换光标,原始指令 ctrl+w+h/j/k/l
map <LEADER>h <C-w>h
map <LEADER>l <C-w>l
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j
"通过上下左右键调整分割的窗口的大小,原始指令 resize +-数字/ vertical resize+-数字
map <up> :res +1<CR>
map <down> :res -1<CR>
map <left> :vertical resize -1<CR>
map <right> :vertical resize +1<CR>

"启用插件
"打开目录树
map <F2> :NERDTreeToggle<CR>
"打开函数预览
nmap <F3> :TagbarToggle<CR>


