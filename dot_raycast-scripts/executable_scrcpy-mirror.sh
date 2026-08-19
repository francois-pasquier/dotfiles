#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Mirror Android (scrcpy)
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 📱
# @raycast.packageName Android
# @raycast.argument1 { "type": "text", "placeholder": "serial (optional)", "optional": true }

# Documentation:
# @raycast.description Mirror the connected Android device with scrcpy
# @raycast.author Francois Pasquier

ADB="$HOME/Library/Android/sdk/platform-tools/adb"
SCRCPY="$HOME/.nix-profile/bin/scrcpy"

SERIAL="$1"

if [ -z "$SERIAL" ]; then
  SERIAL=$("$ADB" devices | awk '$2 == "device" { print $1; exit }')
fi

if [ -z "$SERIAL" ]; then
  echo "No Android device connected"
  exit 1
fi

PATH="$(dirname "$ADB"):$PATH" \
  nohup "$SCRCPY" --serial "$SERIAL" --window-title "$SERIAL" \
  >/tmp/scrcpy-"$SERIAL".log 2>&1 &

echo "Mirroring $SERIAL"
