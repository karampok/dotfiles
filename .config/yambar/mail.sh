#!/bin/bash

current_time=$(date +%H%M)
if [[ $(date +%u) -gt 5 ]] || [ "$current_time" -lt 0900 ] || [ "$current_time" -ge 1700 ]; then
  echo "count|int|$count"
  echo ""
  exit 0
fi

export NOTMUCH_CONFIG=$HOME/.config/mutt/redhat/rh.notmuch2
notmuch new 2>&1 >/dev/null
count=$(notmuch count -- '(tag:inbox or tag:new) and tag:unread')
echo "count|int|$count"
echo ""
