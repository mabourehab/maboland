#!/bin/bash

VPN="$(nmcli con show | grep "VPN" | awk -F '  ' '{print $1}')"

if [ -e "/etc/NetworkManager/system-connections/$VPN.nmconnection" ]; then
  if nmcli -f GENERAL.STATE con show "$VPN" | grep 'activated' &>/dev/null; then
    status='{"text": "󱚿", "class": "connected", "tooltip": "VPN Connected"}'
  elif nmcli -f GENERAL.STATE con show "$VPN" | grep 'activating' &>/dev/null; then
    status='{"text": "󱛄", "class": "connecting", "tooltip": "VPN Connecting"}'
  else
    status='{"text": "󱛀", "class": "disconnected", "tooltip": "VPN Disconnected"}'
  fi
else
  status='{"text": ""}'
fi

echo $status
