" crontabのための設定
set backupskip=/tmp/*,/private/tmp/*

" backup ファイルを作成しない
set nobackup

"タグファイルの指定
set tags=~/.tags
"クリップボード共有
set clipboard=unnamed
" スワップファイルは使わない(ときどき面倒な警告が出るだけで役に立ったことがない)
set noswapfile
" " カーソルが何行目の何列目に置かれているかを表示する
set ruler
" " コマンドラインに使われる画面上の行数
set cmdheight=2
" " エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
" "
" ステータス行に表示させる情報の指定(どこからかコピペしたので細かい意味はわかっていない)
set statusline=%<%f\%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" " ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
" " コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu
" " 入力中のコマンドを表示する
set showcmd
" バッファで開いているファイルのディレクトリでエクスクローラを開始する(でもエクスプローラって使ってない)
set browsedir=buffer
" " 小文字のみで検索したときに大文字小文字を無視する
set smartcase
" " 検索結果をハイライト表示する
set hlsearch
" " 暗い背景色に合わせた配色にする
set background=dark
" " タブ入力を複数の空白入力に置き換える
set expandtab
" " 検索ワードの最初の文字を入力した時点で検索を開始する
set incsearch
" " 保存されていないファイルがあるときでも別のファイルを開けるようにする
set hidden
" " 不可視文字を表示する
set list
" " タブと行の続きを可視化する
set listchars=tab:>\ ,extends:<
" " 行番号を表示する
set number
" " 対応する括弧やブレースを表示する
set showmatch
" " 改行時に前の行のインデントを継続する
set autoindent
" " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" " タブ文字の表示幅
set tabstop=4
" " Vimが挿入するインデントの幅
set shiftwidth=4
" " 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
" " カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" " 構文毎に文字色を変化させる
syntax on
" " カラースキーマの指定
" "colorscheme molokai 
" " 行番号の色
highlight LineNr ctermfg=darkyellow

filetype plugin on
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl expandtab tabstop=4 shiftwidth=4 softtabstop=4

"Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite-outline'
"NeoBundle 'kana/vim-smartinput'
NeoBundle 'w0ng/vim-hybrid'

" neobundle for golang
NeoBundle 'fatih/vim-go'

"for Python
"NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'andviro/flake8-vim'
NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'jmcantrell/vim-virtualenv'

" markdown
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

au BufRead,BufNewFile *.md set filetype=markdown

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Setting neocomplete 
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
