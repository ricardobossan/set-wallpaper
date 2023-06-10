#!/bin/bash

string="$(xrandr --listmonitors)"
resolutions=()
highest_resolution=0

while IFS= read -r line; do
  if [[ $line =~ ^.*[0-9]+: ]]; then
    resolution=$(echo "$line" | awk '{split($3,arr, "/"); print arr[1]}')
    resolutions+=("$resolution")

    if (( resolution > highest_resolution )); then
      highest_resolution=$resolution
    fi
  fi

done <<< "$string"

styli.sh -s earthporn -w "$highest_resolution" -h 1080
