filetype plugin indent on

set expandtab
set tabstop=4
set shiftwidth=4
set autoindent

" mouseは使わない
set mouse=

" filetype check
filetype on

"検索結果のハイライト
set hlsearch

"リアルタイム検索
set incsearch

"文字列の折り返しなし
set nowrap

"swpファイル不要
set noswapfile

"deleteキー聞かない対応"
set backspace=indent,eol,start

"ステータスライン"
"" ファイル名表示
" set statusline=%F

""ステータスラインを常に表示(0:表示しない、1:2つ以上ウィンドウがある時だけ表示)
set laststatus=2

"現在の行の強調なし
set nocursorline

"保存時に行末の空白行を削除
autocmd BufWritePre * :%s/\s\+$//ge

autocmd VimEnter * imap <Nul> <esc>

" 文字コード指定
set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis

" 画面分割は右に開く
set splitright

" vim カーソル遅い時の関数
function! ProfileCursorMove(moveCount) abort
  let profile_file = expand('~/log/vim-profile.log')
  if filereadable(profile_file)
    call delete(profile_file)
  endif

  normal! gg
  normal! zR

  execute 'profile start ' . profile_file
  profile func *
  profile file *

  augroup ProfileCursorMove
    autocmd!
    autocmd CursorHold <buffer> profile pause | q
  augroup END

  for i in range(a:moveCount)
    call feedkeys('j')
  endfor
endfunction

let &statusline = '%f%=(%l,%v) %y'

