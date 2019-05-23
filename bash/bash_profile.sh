# NODE_ENV
export NODE_ENV=development

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# add color and format ls
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -alGFh'

# format PS1
source ~/.format_ps1_prompt.sh
export PS1=$(format_ps1)

# bluevine environment
source ~/Documents/bv_venv/bin/activate
source ~/bluevine/development/env-development.sh

######### AUTOCOMPLETES #####################
# npm autocomplete
source ~/.npm_autocomplete.sh

# aws cli
# complete -C '/Users/barak/Documents/bv_venv/bin/aws_completer' aws

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/barak/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/barak/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/barak/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/barak/Downloads/google-cloud-sdk/completion.bash.inc'; fi

# brew bash_completion (docker, git)
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
# short syntax with calculated brew location
# [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
