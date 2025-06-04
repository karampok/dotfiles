#!/bin/bash
current_time=$(date +%H%M)
if [[ $(date +%u) -gt 5 ]] || [ "$current_time" -lt 0900 ] || [ "$current_time" -ge 1700 ]; then
  echo "now|string|"
  echo "day|string|"
  echo "allday|string|"
  echo ""
  exit 0
fi

agenda-now-create-org-files() (
  filename="$HOME/myspace/org/gevents.org"
  current_time=$(date '+%H:%M')
  wk=$(date +%V)
  output=$(gcalcli agenda --nodeclined --details all --tsv "$current_time" "$(date -d "23:59" '+%H:%M')" --military |
    grep -v "^id" | tr '\t' ',')
  # output=$(gcalcli agenda --nodeclined --details all --tsv "$(date '+%H:%M')" "$(date -d "now + 1 min" '+%H:%M')" --military |
  #   grep -v "^id" | tr '\t' ',')

  now=""
  day=""
  allday=""
  while IFS=',' read -r id start_date start_time end_date end_time html_link hangout_link conference_type conference_uri title location description calendar email action; do

    [[ -z "$title" || $title == "AFK" || $title == "Cal" || $title == "Remote Switzerland (Office)" ]] && continue
    if [[ -z "$start_time" || -z "$end_time" ]]; then
      allday+="$title "
      continue
    fi

    current_num=${current_time/:/}
    start_num=${start_time/:/}
    end_num=${end_time/:/}

    # in base 10 (decimal), regardless of any leading zeros.
    if ((10#$current_num >= 10#$start_num && 10#$current_num <= 10#$end_num)); then
      now+="| $title ($start_time-$end_time) "
    else
      day+="| ${title:0:20} ($start_time-$end_time) "
    fi

    header="$title <$start_date $start_time-$end_time>"
    if grep -q "$header" "$filename" 2>/dev/null; then
      continue
    fi

    formatted_description=$(echo "${description:-missing description}" | sed ':a;N;$!ba;s/\n/\n+/g')

    template="* $header (ona) :event:
  :PROPERTIES:
  :LOCATION: ${location:-Virtual}
  :ATTENDEES: ${email:-Not specified}
  :LINK: ${html_link:-""}
  :MEET: ${hangout_link:-""}
  :RECURRING: ${action:-Once}
  :CALENDAR: ${calendar:-""}
  :DSCR: ${formatted_description:-"missing description"}
  :END:

** note

"

    printf "%s\n\n\n$(cat "$filename")" "$template" | sponge "$filename"
  done <<<"$output"

  echo "now|string|$now"
  echo "day|string|$day"
  echo "allday|string|wk$wk 󰧞 $allday"
  echo ""
)

agenda-now-create-org-files

# agenda() (
#   gcalcli agenda --nostarted --nodeclined --tsv "$(date '+%H:%M')" "$(date -d "23:59" '+%H:%M')" --military |
#     grep -v "Remote Switzerland (Office)" |
#     grep -v "AFK" |
#     grep -v start_time |
#     awk -F'\t' ' length($2) > 0 {print substr($5, 1, 20)"  ("$2"-"$4") "}' |
#     awk 'NR>1{printf "| "} {printf "%s", $0}'
# )
#
# agenda-now() (
#   gcalcli agenda --nodeclined --tsv "$(date '+%H:%M')" "$(date -d "now + 1 min" '+%H:%M')" --military |
#     grep -v "Remote Switzerland (Office)" |
#     grep -v start_time |
#     awk -F'\t' ' length($2) > 0 {print $5"  ("$2"-"$4") "}' |
#     awk 'NR>1{printf "| "} {printf "%s", $0}'
# )
#
# agenda-allday() (
#   gcalcli agenda --nodeclined --tsv "$(date '+%H:%M')" "$(date -d "now + 1 min" '+%H:%M')" --military |
#     grep -v "Remote Switzerland (Office)" |
#     grep -v start_time |
#     awk -F'\t' ' length($2) == 0 {print $5}' |
#     awk 'NR>1{printf "| "} {printf "%s", $0}'
# )
#
# now=$(agenda-now)
# allday=$(agenda-allday)
# day=$(agenda)
# echo "now|string|$now"
# echo "day|string|$day"
# echo "allday|string|${allday:0:50}"
# echo ""
