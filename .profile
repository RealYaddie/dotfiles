[[ -f ~/.bashrc ]] && . ~/.bashrc

# Default Programs
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave"

# XDG Base Directory Specification
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}
export HISTFILE="$XDG_DATA_HOME"/bash/history

# XDG Workarounds
# Zoom
export SSB_HOME="$XDG_DATA_HOME"/zoom

# NPM
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

# Python-pylint
export PYLINTHOME="$XDG_CACHE_HOME"/pylint

# Rust
export CARGO_HOME="$XDG_DATA_HOME"/cargo

# Java
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# export EDITOR=/usr/bin/nvim
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

PATH="$HOME/.local/bin:$PATH"
# export npm_config_prefix="$HOME/.local"
