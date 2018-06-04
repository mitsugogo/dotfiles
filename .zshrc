export INFOPATH="$(brew --prefix)/share/info:$INFOPATH"
HOMEBREW_INSTALL_PATH=`brew --prefix`

typeset -U path cdpath fpath manpath
fpath=(~/.zsh/functions ${HOMEBREW_INSTALL_PATH}/etc/bash_completion.d ${HOMEBREW_INSTALL_PATH}/share/zsh-completions ${fpath})
path=(~/Library/Python/2.7/bin(N-/) ~/.composer/vendor/bin(N-/) ~/.local/bin(N-/) ${HOMEBREW_INSTALL_PATH}/bin(N-/) ~/bin(N-/) ~/dotfiles/bin(N-/) /sowww/bin/shells(N-/) /usr/local/bin(N-/) /usr/local/sbin(N-/) /usr/sbin(N-/) /sbin(N-/) $path)


export INFOPATH="{$HOMEBREW_INSTALL_PATH}/.linuxbrew/share/info:$INFOPATH"

export CLICOLOR=1
export WORDCHARS="*?_-.[]~&;!#$%^(){}<>"
export EDITOR=vim

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

bindkey -v # Keybind configuration

setopt prompt_subst # プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt auto_cd # 指定したコマンド名がなく、ディレクトリ名と一致した場合 cd する
setopt auto_pushd # cd でTabを押すとdir list を表示
setopt pushd_ignore_dups # ディレクトリスタックに同じディレクトリを追加しないようになる
setopt correct # コマンドのスペルチェックをする
setopt correct_all # コマンドライン全てのスペルチェックをする
setopt no_clobber # 上書きリダイレクトの禁止
setopt list_packed # 補完候補リストを詰めて表示
setopt list_types # auto_list の補完候補一覧で、ls -F のようにファイルの種別をマーク表示
setopt auto_list # 補完候補が複数ある時に、一覧表示する
setopt magic_equal_subst # コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt auto_param_keys # カッコの対応などを自動的に補完する
setopt auto_param_slash # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt brace_ccl # {a-c} を a b c に展開する機能を使えるようにする
setopt auto_menu # 補完キー（Tab,  Ctrl+I) を連打するだけで順に補完候補を自動で補完する
setopt multios # 複数のリダイレクトやパイプなど、必要に応じて tee や cat の機能が使われる
setopt noautoremoveslash # 最後がディレクトリ名で終わっている場合末尾の / を自動的に取り除かない
setopt nolistbeep # beepを鳴らさないようにする
setopt extended_glob
setopt hist_ignore_all_dups # 登録済コマンド行は古い方を削除
setopt share_history # historyの共有
setopt hist_reduce_blanks # 余分な空白は詰める
setopt inc_append_history # add history when command executed.
setopt hist_no_store # history (fc -l) コマンドをヒストリリストから取り除く。
setopt path_dirs # コマンド名に / が含まれているとき PATH 中のサブディレクトリを探す
setopt autopushd # 勝手にpushd
#setopt complete_aliases # aliased ls needs if file/dir completions work
#setopt chase_links # シンボリックリンクは実体を追うようになる
#setopt auto_resume # サスペンド中のプロセスと同じコマンド名を実行した場合はリジュームする
#setopt equals # =command を command のパス名に展開する
#setopt extended_glob # ファイル名で #, ~, ^ の 3 文字を正規表現として扱う
#setopt extended_history # zsh の開始・終了時刻をヒストリファイルに書き込む
#setopt NO_flow_control # Ctrl+S/Ctrl+Q によるフロー制御を使わないようにする
#setopt hash_cmds # 各コマンドが実行されるときにパスをハッシュに入れる
#setopt hist_ignore_space # コマンドラインの先頭がスペースで始まる場合ヒストリに追加しない
#setopt hist_verify # ヒストリを呼び出してから実行する間に一旦編集できる状態になる
#setopt NO_hup # シェルが終了しても裏ジョブに HUP シグナルを送らないようにする
#setopt ignore_eof # Ctrl+D では終了しないようになる（exit, logout などを使う）
#setopt interactive_comments # コマンドラインでも # 以降をコメントと見なす
#setopt mail_warning # メールスプール $MAIL が読まれていたらワーニングを表示する
#setopt mark_dirs # ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
#setopt numeric_glob_sort # ファイル名の展開で、辞書順ではなく数値的にソートされるようになる
#setopt print_exit_value # 戻り値が 0 以外の場合終了コードを表示する
#setopt pushd_to_home # pushd を引数なしで実行した場合 pushd $HOME と見なされる
#setopt rm_star_silent # rm * などの際、本当に全てのファイルを消して良いかの確認しないようになる
#setopt rm_star_wait # rm_star_silent の逆で、10 秒間反応しなくなり、頭を冷ます時間が与えられる
#setopt short_loops # for, repeat, select, if, function などで簡略文法が使えるようになる
#setopt single_line_zle # デフォルトの複数行コマンドライン編集ではなく、１行編集モードになる
#setopt xtrace # コマンドラインがどのように展開され実行されたかを表示するようになる

zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin # sudoも補完の対象
zstyle ':completion:*' list-colors di=34 fi=0 # 色付きで補完する
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:::tig:*' script /usr/local/etc/bash_completion.d/tig-completion.bash
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' #大文字、小文字を区別せず補完する

# historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

bindkey '^R' history-incremental-pattern-search-backward # glob(*)によるインクリメンタルサーチ
bindkey '^S' history-incremental-pattern-search-forward
bindkey "^?" backward-delete-char # Backspace key
bindkey "^B" backward-word # ctrl-w, ctrl-bキーで単語移動
bindkey -a 'q' push-line ## Command Line Stack [Esc]-[q]

# cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

#
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# peco
function peco-git-changed-files(){
    git status --short | peco | awk '{print $2}'
}

alias -g F='$(peco-git-changed-files)'

function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

# prompt
autoload colors && colors
case ${UID} in
0)
    PROMPT="%B%{${fg[red]}%}%/#%{${reset_color}%}%b "
    PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
    SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
    ;;
esac

autoload -Uz select-word-style && select-word-style default # back-wordでの単語境界の設定
zstyle ':zle:*' word-chars " _-./;@"
zstyle ':zle:*' word-style unspecified

autoload -U compinit && compinit -u
autoload -U bashcompinit && bashcompinit
autoload zed
autoload predict-on
autoload -Uz url-quote-magic # URLをコピペしたときに自動でエスケープ
zle -N self-insert url-quote-magic

# terminal configuration
case "${TERM}" in
xterm)
    export TERM=xterm-256color
    ;;
kterm)
    export TERM=kterm-color
    stty erase
    ;;
cons25)
    unset LANG
    export LSCOLORS=ExFxCxdxBxegedabagacad
    export LS_COLORS='di=01;32:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30'
    zstyle ':completion:*' list-colors 'di=;36;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
kterm*|xterm*)
    export CLICOLOR=1
    export LSCOLORS=ExFxCxDxBxegedabagacad
    zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
dumb)
    echo "Welcome Emacs Shell"
    ;;
esac

# zsh の exntended_glob と HEAD^^^ を共存させる。
# http://subtech.g.hatena.ne.jp/cho45/20080617/1213629154
typeset -A abbreviations
abbreviations=(
  "L"    "| $PAGER"
  "G"    "| grep"

  "HEAD^"     "HEAD\\^"
  "HEAD^^"    "HEAD\\^\\^"
  "HEAD^^^"   "HEAD\\^\\^\\^"
  "HEAD^^^^"  "HEAD\\^\\^\\^\\^\\^"
  "HEAD^^^^^" "HEAD\\^\\^\\^\\^\\^"
)

magic-abbrev-expand () {
  local MATCH
  LBUFFER=${LBUFFER%%(#m)[-_a-zA-Z0-9^]#}
  LBUFFER+=${abbreviations[$MATCH]:-$MATCH}
}

magic-abbrev-expand-and-insert () {
  magic-abbrev-expand
  zle self-insert
}

magic-abbrev-expand-and-accept () {
  magic-abbrev-expand
  zle accept-line
}

no-magic-abbrev-expand () {
  LBUFFER+=' '
}

zle -N magic-abbrev-expand
zle -N magic-abbrev-expand-and-insert
zle -N magic-abbrev-expand-and-accept
zle -N no-magic-abbrev-expand
bindkey "\r"  magic-abbrev-expand-and-accept # M-x RET はできなくなる
bindkey "^J"  accept-line # no magic
bindkey " "   magic-abbrev-expand-and-insert
bindkey "."   magic-abbrev-expand-and-insert
bindkey "^x " no-magic-abbrev-expand

alias ll='ls -l'
alias less='less -r'
alias 'gr'='grep --color=auto -ERUIn'
alias 'ps?'='pgrep -l -f'

alias pon='predict-on'
alias poff='predict-off'

alias g='git'
compdef g='git'
alias gst='git status'
alias gg='git grep'
alias vimdiff="vimdiff -c 'set diffopt+=iwhite'"

alias t='tig'
compdef t='tig'


# extract http://d.hatena.ne.jp/jeneshicc/20110215/1297778049
extract () {
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.tar.xz)    tar xvJf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       unrar x $1     ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *.lzma)      lzma -dv $1    ;;
          *.xz)        xz -dv $1      ;;
          *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}
alias ex='extract'

grepvim() {
    XFS=`grep -ERUInl $* | uniq | xargs`
    if [ "$XFS" ] ; then
      vim `grep -ERUInl $* | uniq | xargs`
    fi
}
alias grv='grepvim'

case "${OSTYPE}" in
darwin*)
    alias ls="ls -alG"

    export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
    alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    ;;
linux*)
    alias ls='ls -alh --color'
    alias la="ls -al"
    alias vi="vim"
    ;;
esac

# antigen
if [[ -f ~/.zsh/antigen/antigen.zsh ]]; then
    source ~/.zsh/antigen/antigen.zsh
    antigen-bundles <<EOBUNDLES
    mollifier/anyframe
    git
    git-flow
    zsh-users/zsh-syntax-highlighting
EOBUNDLES
    antigen apply
fi

# anyframe
bindkey '^xb' anyframe-widget-cdr
bindkey '^x^b' anyframe-widget-checkout-git-branch

bindkey '^xr' anyframe-widget-execute-history
bindkey '^x^r' anyframe-widget-execute-history

bindkey '^xp' anyframe-widget-put-history
bindkey '^x^p' anyframe-widget-put-history

bindkey '^xg' anyframe-widget-cd-ghq-repository
bindkey '^x^g' anyframe-widget-cd-ghq-repository

bindkey '^xk' anyframe-widget-kill
bindkey '^x^k' anyframe-widget-kill

bindkey '^xi' anyframe-widget-insert-git-branch
bindkey '^x^i' anyframe-widget-insert-git-branch

bindkey '^xf' anyframe-widget-insert-filename
bindkey '^x^f' anyframe-widget-insert-filename

# direnv
eval "$(direnv hook zsh)"

# phpbrew
if [[ -f ~/.phpbrew/bashrc ]]; then source ~/.phpbrew/bashrc; fi

# pyenv, pyenv-virtualenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
# eval "$(pyenv virtualenv-init -)"

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# powerline
#if which powerline-daemon > /dev/null; then
#    powerline-daemon -q
#    source ~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh
#fi
function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}
function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}
if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi



# qfc
[[ -s "$HOME/.qfc/bin/qfc.sh" ]] && source "$HOME/.qfc/bin/qfc.sh"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tmuxinator
#if gem which tmuxinator 1>/dev/null 2>/dev/null; then
#    source $(dirname $(dirname `gem which tmuxinator`))/completion/tmuxinator.zsh
#else
#    echo "tmuxinator is not installed ?"
#fi
if [ "$TERM" = "xterm-color" ]; then
    # No it isn't, it's gnome-terminal
    export TERM=xterm-256color
fi
