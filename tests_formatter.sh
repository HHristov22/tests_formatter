#!/bin/bash

# Black:   '\033[0;30m'
# Red:     '\033[0;31m'
# Green:   '\033[0;32m'
# Yellow:  '\033[0;33m'
# Blue:    '\033[0;34m'
# Magenta: '\033[0;35m'
# Cyan:    '\033[0;36m'
# White:   '\033[0;37m'

function format_file(){

    local color_formater='\033[0;36m'
    local color_name_file='\033[0;31m'
    local reset='\033[0m'

    echo -e "\n"
    print_lines $1
    echo -e "\n--------| ${color_name_file}$1${reset} |--------"
    print_lines $1
    echo -e "\n"

    local extension="${1: -3}"
    if [[ ! $extension == ".py" ]]; then
        echo "The file extension is not .py"
        exit 1
    fi

    echo -e "\n${color_formater}>_ isort...${reset}"
    isort $1

    echo -e "\n${color_formater}>_ black --line-length=140...${reset}"
    black --line-length=140 $1

    echo -e "\n${color_formater}>_ flake8 --max-line=140...${reset}"
    flake8 --max-line=140 $1
}

function newest_file() {
    local current_file=$(basename "$0")
    local file_name=""

    for file in *; do
        if [[ -f $file && $file != $current_file ]]; then
        if [[ -z $file_name || $file -nt $file_name ]]; then
            file_name=$file
        fi
        fi
    done
    format_file $file_name
}

function print_lines() {
  local input="$1"
  local length=${#input}
  
  echo -n "----------"
  for ((i=0; i<length; i++)); do
      echo -n "-"
  done
  echo -n "----------"
}

if [ $# -eq 0 ]; then
  newest_file
elif [ $# -eq 1 ]; then
  format_file $1
else
  echo "More than one parameter has been submitted."
fi
