" 新しい行のインデントを現在の行と同じにする
set autoindent
" vi互換を切る
set nocompatible
" タブの代わりに空白文字を挿入する
set expandtab
" 変更中のファイルでも、保存しないで他のファイルを表示
set hidden
" インクリメンタルサーチを行う
set incsearch
" 行番号を表示する
set number
" シフト移動幅
set shiftwidth=4
" 対応する括弧を表示する
set showmatch
"検索時に大文字を含んでいたら大/小を区別
"set smartcase
"高度な自動インデントを行う
set smartindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"ファイル内の <Tab> が対応する空白の数
set tabstop=4
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"検索をファイルの先頭へループしない
set nowrapscan
"256色配色を用いる
set t_Co=256

"行移動キーを入れ替える（利便性がよいため）
nnoremap k   gk
nnoremap j   gj
vnoremap k   gk
vnoremap j   gj
nnoremap gk  k
nnoremap gj  j
vnoremap gk  k
vnoremap gj  

"文字列検索のnとNの挙動を合わせる
" n:前方検索 N:後方検索
nnoremap <expr> n <SID>search_forward_p() ? 'nzv' : 'Nzv'
nnoremap <expr> N <SID>search_forward_p() ? 'Nzv' : 'nzv'
vnoremap <expr> n <SID>search_forward_p() ? 'nzv' : 'Nzv'
vnoremap <expr> N <SID>search_forward_p() ? 'Nzv' : 'nzv'

function! s:search_forward_p()
    return exists('v:searchforward') ? v:searchforward : 1
endfunction

"挙動が危ないキーをunbindしておく
"ZZ:ファイルを保存して終了(wq) ZQ:ファイルを保存せずに終了(wq!)
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

