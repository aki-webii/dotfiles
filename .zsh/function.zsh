# fg - ghq
fg() {
  local selected
  selected=$(ghq list | fzf)

  if [ "x$selected" != "x" ]; then
    cd $(ghq root)/$selected
  fi
}

# fh - repeat history
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# fkill - kill process
fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fda - including hidden directories
fda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

# select-tmux-session - Select tmux session from active ssion list
select-tmux-session () {
    session=$(tmux ls | peco | cut -d: -f 1)
    if [ -n "$session" ] ; then
        tmux at -t "$session"
    fi
}
