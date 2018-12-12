# aliases
alias gst='git status'
alias git-root='if [ "`git rev-parse --show-cdup`" != "" ]; then cd `git rev-parse --show-cdup`; fi'

function e() {
  if test -z "$*" ; then
      vim -c 'CommandT'
  else
      vim $*
  fi
}

function vst () {
  if test -z "$*" ; then
      vim -c 'Gstatus' .vstatus
  else
      vim $*
  fi
}

function dokku () {
  ssh dokku $*
}

alias docker-clean='docker container prune --force'
alias docker-clean-images='docker image prune --force --all'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
