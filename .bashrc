# ~/.bashrc for GitHub Codespaces

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Environment variables
export EDITOR=vim
export NODE_OPTIONS=--openssl-legacy-provider  # Fix for "digital envelope routines::unsupported" error

# History control
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend

# Check window size after each command
shopt -s checkwinsize

# Color prompt
force_color_prompt=yes
PS1='\[\033[01;32m\]\u@codespace\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Enable color support
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Set default Node.js version
nvm alias default lts/*

# Some useful aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cls='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias npm-start='npm start'
alias npm-build='npm run build'
alias npm-dev='npm run dev'
alias npm-test='npm test'
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gl='git pull'

# Node version management (if nvm is installed)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Display welcome message
echo "Welcome to your GitHub Codespace!"
echo "Node.js version: $(node -v)"
echo "npm version: $(npm -v)"
echo "NODE_OPTIONS set to fix digital envelope routines error"