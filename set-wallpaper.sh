#!/bin/zsh

resolutions=($(xrandr | awk '/\*/ {print $1}'))

index=1
for resolution in "${resolutions[@]}"; do
  monitor=$index

  case $resolution in
    "2560x1440")
      command="styli.sh -s nature -w 2560 --monitors $monitor"
      ;;
    "3840x2160")
      command="styli.sh -s nature -w 3840 --monitors $monitor"
      ;;
    "1920x1080")
      command="styli.sh -s nature -w 1920 --monitors $monitor"
      ;;
    "1280x720")
      command="styli.sh -s nature -w 1280  --monitors $monitor"
      ;;
    *)
      command="styli.sh  -s nature -w --monitors $monitor"
      ;;
  esac

  eval "$command"

  index=$((index+1))
done
