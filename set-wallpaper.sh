#!/bin/bash

resolutions=($(xrandr | grep -oP '\d+x\d+\+\d+\+\d+' | cut -d'x' -f1,2))

max_resolution=0
for resolution in "${resolutions[@]}"; do
  width=$(echo $resolution | cut -d'x' -f1)
  height=$(echo $resolution | cut -d'x' -f2)
  if ((width * height > max_resolution)); then
    max_resolution=$((width * height))
    resolutionAxisX=$width
    resolutionAxisY=$height
  fi
done

echo $resolutionAxisX x $resolutionAxisY
styli.sh -r earthporn -w $resolutionAxisX -h $resolutionAxisY
