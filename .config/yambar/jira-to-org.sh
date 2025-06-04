#!/bin/bash

filename="$HOME/myspace/org/jira.org"
cmd="jira sprint list --plain --columns key,status,summary --show-all-issues --current -s~Closed"
output=$($cmd "-a$(jira me)" | grep -v "^KEY" | sed 's/In Progress/InProgress/g')

while read -r line; do
  key=$(echo "$line" | awk '{print $1}')
  status=$(echo "$line" | awk '{print $2}')
  summary=$(echo "$line" | awk '{$1=""; $2=""; print $0}' | tr -s ' ' | xargs)

  header="[[https://issues.redhat.com/browse/$key][$key]] $summary"
  if grep -F -q "$header" "$filename" 2>/dev/null; then
    continue
  fi

  echo "$header"
  template="* $header  :jira:
     :PROPERTIES:
     :STATUS: ${status:-"not"}
     :END:
   "

  printf "%s\n\n\n$(cat "$filename")" "$template" | sponge "$filename"
done <<<"$output"
