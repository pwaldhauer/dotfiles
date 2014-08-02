if [ -f /etc/profile ]; then
    source /etc/profile
fi

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
