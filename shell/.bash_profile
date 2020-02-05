# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave

#=============================System python===============
# export PATH=/Library/Frameworks/Python.framework/Versions/3.6/bin:$PATH

#==========Homebrew
export PATH=/usr/local/Cellar/iftop/1.0pre4/sbin:$PATH

#=========manually added Anaconda3
# export PATH=/Users/dangbo/anaconda3/bin:$PATH

# Bash prompt
# export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "

#==========wo ye bu zhi dao zhe shi sha=============
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

#========conda: uncomment if needed====================
## >>> conda initialize >>>
## !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/Users/dangbo/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/Users/dangbo/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/Users/dangbo/anaconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/Users/dangbo/anaconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
## <<< conda initialize <<<

export PATH=$PATH:/Users/dangbo/anaconda3/bin
