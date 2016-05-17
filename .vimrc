""------------------------------
"         vim settings
"------------------------------

" ---------- Theme ----------

set background=dark
colorscheme solarized

" ---------- Options ----------

set encoding=utf-8
set fileencoding=utf-8

" 左下のインサートモードなどの文字を非表示にする
set noshowmode

" ビープ音を消す
set vb t_vb=

" 構文ハイライト有効化
syntax enable "構文ハイライト有効化

" 行番号表示
set number

" 対応括弧強調表示
set showmatch

" backspaceを有効化
set backspace=indent,eol,start

" マウス操作を有効にする
set mouse=a

" スクロールの余裕を確保する
set scrolloff=3

" インサートモードに入る時に自動でコメントアウトされないようにする
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" 保存時に行末の空白を削除する
autocmd BufWritePre * :%s/\s\+$//ge

"下部のステータスラインを常に表示
set laststatus=2

set cursorline      " 現在の行をハイライト

" ---------- Backup Options ----------
"バックアップファイルのディレクトリを指定する
set backupdir=$HOME/.vim/backup

"スワップファイル用のディレクトリを指定する
set directory=$HOME/.vim/backup

" ----------  -----------
"クリップボードをWindowsと連携する
set clipboard=unnamed

"vi互換をオフする
set nocompatible

" ---------- Tab Options ----------
set expandtab     " タブの代わりに空白を使う
set tabstop=2     " タブの幅
set shiftwidth=2  " 自動インデントでずれる幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅（デフォルトでは無効: 0）

" ---------- Indent Options ----------
set smarttab      " 新しい行を作った時に高度な自動インデントを行う
set autoindent    " 改行時に前の行のインデントを継続する
set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減するタブの代わりに空白文字を指定する

" ----------  ----------
"インクリメンタルサーチを行う
set incsearch

" grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

" vimgrepやgrep した際に、cwindowしてしまう
autocmd QuickFixCmdPost *grep* cwindow


" ---------- エスケープシーケンスの表示 tab eol ----------
set list
set listchars=tab:▸\ ,eol:¬

" ---------- 全角スペースの表示 ----------
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkGray gui=reverse guifg=DarkGray
endfunction
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        "ZenkakuSpace をカラーファイルで設定するなら、
        "次の行をコメントアウト
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

" ---------- dein.vim ----------
" ディレクトリ設定
if &compatible
    set nocompatible
endif
let g:rc_dir = expand('~/.vim')  "設定ディレクトリ
let s:dein_dir = expand('~/.vim/dein') " deinディレクトリ
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim' " deinリポジトリ
" dein.vim がないときgit clone
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
        execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
    endif
" プラグイン設定
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    " プラグインリストの場所
    let s:toml      = g:rc_dir . '/rc/dein.toml' "通常ロード
    let s:lazy_toml = g:rc_dir . '/rc/dein_lazy.toml' "遅延ロード
    " プラグインリストのロード
    call dein#load_toml(s:toml,      {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})
    call dein#end()
    call dein#save_state()
endif

" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

filetype plugin on
