#!/bin/bash

via() (
  iface=$(ip -json route get 8.8.8.8  |jq -r .[0].dev)
  active=$(awk -v pattern="Active Slave" '$0 ~ pattern {print "/"$NF}' /proc/net/bonding/"$iface" 2>/dev/null)
  echo "$iface$active"
)

access() (
  if ping -c 1 -W 1 "$1" >/dev/null 2>&1; then
    echo "true"
  else
    echo "false"
  fi
)

echo "via|string|$(via)"
echo "ts|bool|$(access 100.109.163.60)"
echo "rh|bool|$(access ipa.redhat.com)"
echo ""
