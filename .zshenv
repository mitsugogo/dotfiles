typeset -U path cdpath fpath manpath
path=(~/.composer/vendor/bin(N-/) ~/.local/bin(N-/) ~/.linuxbrew/bin(N-/) ~/bin(N-/) ~/dotfiles/bin(N-/) /usr/local/bin(N-/) /usr/local/sbin(N-/) /usr/sbin(N-/) /sbin(N-/) $path)
fpath=(~/.zsh/functions $(brew --prefix)/etc/bash_completion.d $(brew --prefix)/share/zsh-completions ${fpath})

# pyenv, pyenv-virtualenv
export PYENV_ROOT="$HOME/.pyenv"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
# eval "$(pyenv virtualenv-init -)"

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

