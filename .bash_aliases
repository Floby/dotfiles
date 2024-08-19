# aliases
alias gst='git status'
alias git-root='if [ "`git rev-parse --show-cdup`" != "" ]; then cd `git rev-parse --show-cdup`; fi'

alias vi='vim'

function e() {
  if test -z "$*" ; then
      vim -c 'FZF'
  else
      vim $*
  fi
}

function vst () {
  if test -z "$*" ; then
      vim -c 'Git'
  else
      vim -c 'Gdiff' $*
  fi
}

function dokku () {
  ssh dokku $*
}

function pretty_csv {
    column -t -s, -n "$@" | less -F -S -X -K
}

alias docker-clean='docker container prune --force'
alias docker-clean-images='docker image prune --force --all'


alias glc=gcloud

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
