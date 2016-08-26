# dotfiles

### おもなツール
* [zsh](http://www.zsh.org/)
* [tmux](http://tmux.sourceforge.net/)
* [vim](http://www.vim.org/)
* [git](http://git-scm.com/)
* [tig](http://jonas.nitro.dk/tig/)
* [peco](https://github.com/peco/peco)
* [phpbrew](https://github.com/phpbrew/phpbrew)
* [pyenv](https://github.com/yyuu/pyenv)
* [rbenv](https://github.com/sstephenson/rbenv)
* [anyframe](https://github.com/mollifier/anyframe)
* [qfc](https://github.com/pindexis/qfc)


### vimの設定

1. [NeoBundle](https://github.com/Shougo/neobundle.vim)のインストール

    ```
    $ mkdir -p ~/.vim/bundle
    $ git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
    ```

2. プラグインのインストール

    ```
    $ vim
    :NeoBundleInstall
    ```

### antigen, anyframeの設定

1. antigenをインストール

    ```
    $ mkdir ~/.zsh
    $ cd ~/.zsh
    $ git clone https://github.com/zsh-users/antigen.git
    ```

2. .zshrc読み込み時にanyframeが自動でインストールされる
