# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Update Path
PATH="~/.local/bin:${PATH}"

# history
HISTFILESIZE=2000000000
HISTSIZE=10000
PROMPT_COMMAND="history -a"
export HISTSIZE PROMPT_COMMAND
shopt -s histappend

# complete
complete -cf doas
complete -cf man

# Set defalut proxy
proxy="http://127.0.0.1:8118"
export http_proxy=$proxy
export https_proxy=$proxy
export no_proxy="localhost, 127.0.0.1, ::1"

# alias
alias open="xdg-open"
alias ll="ls -l"
alias llh="ls -alh"
alias ..='cd ..'
alias ...='cd ..; cd ..'
alias fars='curl -F "c=@-" "http://fars.ee/"'

export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye &> /dev/null
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
