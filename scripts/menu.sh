#!/bin/bash

function menu {
  ESC=$(printf "\033")
  key_input() { read -s -n3 key 2>/dev/null 
    if [[ $key == $ESC[A ]]; then echo up; fi
    if [[ $key == $ESC[B ]]; then echo down; fi
    if [[ $key == "" ]]; then echo enter; fi }

    printf "$ESC[?25l"

    for opt; do printf "\n"; done
    local lastrow=$(IFS=";" read -sdR -p $'\E[6n' ROW COL; echo ${ROW#*[})
    local startrow=$(( $lastrow - $# ))

    while true; do
      local idx=0
      for opt; do
        printf "$ESC[$(($startrow + $idx));-1H"
        if [[ $idx -eq $selected ]]; then
          printf " ->$opt"
        else
          printf "   $opt"
        fi
        ((idx++))
      done

      case $( key_input ) in
        up)
          ((selected--))
          if [[ $selected -lt 0 ]]; then selected=$(($# - 1)); fi
          ;;
        down)
          ((selected++))
          if [[ $selected -ge $# ]]; then selected=0; fi
          ;;
        enter)
          printf "$ESC[?25h"
          break
          ;;
      esac

    done

    return $selected

}
