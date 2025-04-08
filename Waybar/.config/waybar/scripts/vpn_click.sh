#!/bin/bash

VPN="$(nmcli con show | grep "VPN" | awk -F '  ' '{print $1}')"

if nmcli -f GENERAL.STATE con show "$VPN" | grep 'activated' &>/dev/null; then
  nmcli con down "$VPN" &>/dev/null &
  disown
else
  nmcli con up "$VPN" --ask &>/dev/null &
  disown
fi
