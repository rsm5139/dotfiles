test -r /sw/bin/init.sh && . /sw/bin/init.sh
export MACPORTS_ROOT=/Volumes/macports
export PATH=${MACPORTS_ROOT}/bin:$HOME/macports/sbin:$PATH
export MANPATH=${MACPORTS_ROOT}/share/man:$MANPATH
export NCARG_ROOT=${MACPORTS_ROOT}

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export GEM_HOME="$HOME/.gems"
export GEM_PATH="$HOME/.gems"
export PATH="$HOME/.gems/bin:$PATH"
export PATH=$HOME/.local/bin:$HOME/.local/lib:$PATH
export PATH=/Applications/R.app/Contents/MacOS:$PATH
umask 002
