call plug#begin('~/.config/vim_plug/plugged')
    Plug 'Yggdroot/indentLine'   "提供代码对齐
    Plug 'vim-airline/vim-airline' "状态栏与标签栏      
    Plug 'vim-airline/vim-airline-themes' "airline 的主题
    Plug 'luochen1990/rainbow' "提供嵌套括号高亮
    Plug 'preservim/nerdtree'	"目录树
    Plug 'Xuyuanp/nerdtree-git-plugin' "目录树
    Plug 'neoclide/coc.nvim', {'branch': 'release'}    
    Plug 'morhetz/gruvbox'  "主题
    Plug 'kaicataldo/material.vim', { 'branch': 'main' }	"主题
	  Plug 'theniceboy/nvim-deus' "主题
		Plug 'jiangmiao/auto-pairs'  "括号自动补齐
		Plug 'tpope/vim-surround' "括号自动匹配
		Plug 'gcmt/wildfire.vim'  "搭配上方插件使用，可做到群体修改
		Plug 'voldikss/vim-translator'  " 界面翻译插件
call plug#end()
				


"
" coc.nvim
"
let g:coc_global_extensions=[
						\'coc-json',
						\'coc-vimlsp',
                        \'coc-marketplace']

" here is coc github deafult

set encoding=utf-8

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>




"colo monokai
"colorscheme gruvbox
"set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:material_terminal_italics = 1
let g:material_theme_style = 'default-community'
colorscheme material



" 有关于插件的设置

" 设置嵌套括号颜色
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\   'ctermfgs': ['lightyellow', 'lightcyan','lightblue', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
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



" autocmd vimenter * NERDTree  "自动开启Nerdtree
let g:NERDTreeWinSize = 25 "设定 NERDTree 视窗大小
let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks

"打开vim时如果没有文件自动打开NERDTree
" autocmd vimenter * if !argc()|NERDTree|endif
"当NERDTree为剩下的唯一窗口时自动关闭
"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 设置树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeIgnore = ['\.pyc$']  " 过滤所有.pyc文件不显示
let g:NERDTreeShowLineNumbers=0 " 是否显示行号
let g:NERDTreeHidden=0     "不显示隐藏文件

""Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
nnoremap <F3> :NERDTreeToggle<CR> " 开启/关闭nerdtree快捷键





" My nvim

set number
set showmode
set relativenumber
set cursorline
set wrap
" set showmatch
let loaded_matchparen=1
set hlsearch
set tabstop=2 "设置TAB宽度

"一键运行代码
map <F5> :call CompileRunGcc()<CR>
    func! CompileRunGcc()
        exec "w"
if &filetype == 'c'
            exec "!g++ % -o %<"
            exec "!time ./%<"
elseif &filetype == 'cpp'
            exec "!g++ % -o %<"
            exec "!time ./%<"
elseif &filetype == 'java'
            exec "!javac %"
            exec "!time java %<"
elseif &filetype == 'sh'
            :!time bash %
elseif &filetype == 'python'
            exec "!time python %"
elseif &filetype == 'html'
            exec "!google % &"
elseif &filetype == 'go'
    "        exec "!go build %<"
            exec "!time go run %"
elseif &filetype == 'mkd'
            exec "!~/.vim/markdown.pl % > %.html &"
            exec "!firefox %.html &"
endif
    endfunc

"  键位设置
let mapleader="<Alt>"
nnoremap  i   k
nnoremap  k   j
nnoremap  j   h
nnoremap  u   a
nnoremap  a   i
nnoremap  '   u
nnoremap  lh  ^
nnoremap tt :TranslateW<CR>
nnoremap  ;   :

inoremap jj <ESC>
inoremap <S-o> <ESC>o 
 
 





" Module
autocmd BufNewFile *.py 0r /home/eclipse/.config/nvim/nvimfiles/template.py
