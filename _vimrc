" An customized vimrc file.  "
" Maintainer:	Jackie CAI
" Last change:	2019 Feb 20
"
" To use it, copy it to
"  for Linux:  ~/.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc

" Startup {{{

" Enable file type detection, filetype plugin loading and filetype ident loading 
filetype plugin indent on 

" open all folds when open a file
autocmd BufRead * normal zR
autocmd FileType text setlocal textwidth=78 

" foldmethod for vim file is marker
autocmd FileType vim setlocal foldmethod=marker

" Locate cursor to last edited location when open file
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

" }}} End of Startup

" General {{{
" search case insensitive
set ignorecase
" When 'ignorecase' and 'smartcase' are both on, if a pattern contains an uppercase letter, it is case sensitive, otherwise, it is not. For example, /The would find only "The", while /the would find "the" or "The" etc.
set smartcase
" enable incremental search
set incsearch
" do not wrap around for search
set nowrapscan    
" show matching bracket
set showmatch
set nocompatible
set nobackup
set noswapfile
set history=1024

" change current working directory whenever open a file, switch buffers
set autochdir 
set whichwrap=b,s,<,>,[,]

" No Byte Order Mark, this is the default value
set nobomb

" enable Backspace key to work the same as other editors in INSERT mode
set backspace=indent,eol,start 

" share the default registers with system clipboard
set clipboard+=unnamed

" alt key not mapped to menu bar 
set winaltkeys=no
" set colorcolumn=80  " show column line

" set third party programs path into 
let thirdpartypath=$VIM.'\'.'ThirdParties'
let $PATH=$PATH.';'.thirdpartypath
let ctagspath=thirdpartypath.'\'.'ctags'
let $PATH=$PATH.';'.ctagspath
let cscopepath=thirdpartypath.'\'.'cscope'
let $PATH=$PATH.';'.cscopepath
let unixutilpath=thirdpartypath.'\'.'UnxUtils'
let $PATH=$PATH.';'.unixutilpath

" }}}

" Lang & Encoding {{{
set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936
set encoding=utf-8
"set langmenu=zh_CN
let $LANG = 'en_US.UTF-8'
"language messages zh_CN.UTF-8
" }}}

" GUI {{{
colorscheme Tomorrow-Night

"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
set cursorline
set hlsearch
set number

" set window size
"set lines=35 columns=140

" new splitted window locates below and right
set splitbelow
set splitright
" don't display Toolbar and Menubar in GUI
set guioptions-=T
set guioptions-=m
set guioptions-=L
set guioptions-=r
set guioptions-=b
" 使用内置 tab 样式而不是 gui
set guioptions-=e
" set nolist
set listchars=trail:·,extends:>,precedes:<
if has("gui_running")
  if has("gui_win32")
    set guifont=Consolas:h12:cANSI
  else
  
  endif
endif

set statusline=%f  "f  show file path of the current file in the buffer
set statusline+=%m " show modified flag, [+] means changes not saved; [-] means can't be modified 
"set statusline+=\ %{fugitive#head()}
set statusline+=%=
set statusline+=%{''.(&fenc!=''?&fenc:&enc).''}
set statusline+=/
set statusline+=%{&ff}            "file format
set statusline+=\ -\      " Separator
set statusline+=Line:%l/%L 
set statusline+=\ \Col:%c
set statusline+=[%p%%]
set statusline+=\ -\      " Separator
set statusline+=%1*\ %y\ %*  " show file type

" }}}

" Format {{{
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set foldmethod=indent
syntax on
" }}}

" Plugins {{{

" ----- NERDTree ----- {{{
"let NERDTreeIgnore=['.idea', '.vscode', 'node_modules', '*.pyc']
"let NERDTreeBookmarksFile = $VIM . '/NERDTreeBookmarks'
let NERDTreeMinimalUI = 1
"let NERDTreeBookmarksSort = 1
let NERDTreeShowLineNumbers = 0
"let NERDTreeShowBookmarks = 1
let g:NERDTreeWinPos = 'right'
"let g:NERDTreeDirArrowExpandable = '?'
"let g:NERDTreeDirArrowCollapsible = '?'
nmap <C-F6> :NERDTreeToggle <cr>
nmap <F6> :NERDTreeFocus<cr>

if exists('g:NERDTreeWinPos')
    autocmd vimenter * NERDTree
endif

" }}}

" ------ TagList ------- {{{
let Tlist_Auto_Open=1
nmap <F8> :TlistOpen <cr>
"nmap <Alt-F8> :TlistHighlightTag <cr>
nmap <C-F8> :TlistToggle <cr>
autocmd vimenter * TlistOpen

" Move focus to the right of Taglist window accessed, must be after the
" taglist plugin configuration.
" Assume only NERDTree(RIGHT) and Taglist(LEFT) window are shown when VIM starts
autocmd VimEnter * wincmd l 
" }}}

" }}}  end of Plugins

" Keymap {{{
"let mapleader=","

"nmap <leader>s :source $MYVIMRC<cr>
"nmap <leader>e :e $MYVIMRC<cr>

"nmap <leader>tn :tabnew<cr>
"nmap <leader>tc :tabclose<cr>
"nmap <leader>th :tabp<cr>
"nmap <leader>tl :tabn<cr>

" 移动分割窗口
"nmap <C-j> <C-W>j
"nmap <C-k> <C-W>k
"nmap <C-h> <C-W>h
"nmap <C-l> <C-W>l

" 正常模式下 alt+j,k,h,l 调整分割窗口大小
"nnoremap <M-j> :resize +5<cr>
"nnoremap <M-k> :resize -5<cr>
"nnoremap <M-h> :vertical resize -5<cr>
"nnoremap <M-l> :vertical resize +5<cr>

" 插入模式移动光标 alt + 方向键
"inoremap <M-j> <Down>
"inoremap <M-k> <Up>
"inoremap <M-h> <left>
"inoremap <M-l> <Right>

" IDE like delete
"inoremap <C-BS> <Esc>bdei

"nnoremap vv ^vg_
" 转换当前行为大写
"inoremap <C-u> <esc>mzgUiw`za
" 命令模式下的行首尾
"cnoremap <C-a> <home>
"cnoremap <C-e> <end>

"nnoremap <F2> :setlocal number!<cr>
"nnoremap <leader>w :set wrap!<cr>

"imap <C-v> "+gP
"vmap <C-c> "+y
"vnoremap <BS> d
"vnoremap <C-C> "+y
"vnoremap <C-Insert> "+y
"imap <C-V> "+gP
"map <S-Insert> "+gP
"cmap <C-V> <C-R>+
"cmap <S-Insert> <C-R>+

"exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
"exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

" 打开当前目录 windows
"nmap <silent> <leader>ex :!start explorer %:p:h<CR>

" 打开当前目录CMD
"nmap <silent> <leader>cmd :!start cmd /k cd %:p:h<cr>
" 打印当前时间
"nmap <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>

" 复制当前文件/路径到剪贴板
"nmap ,fn :let @*=substitute(expand("%"), "/", "\\", "g")<CR>
"nmap ,fp :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>

"设置切换Buffer快捷键"
"nnoremap <C-left> :bn<CR>
"nnoremap <C-right> :bp<CR>

" }}}

