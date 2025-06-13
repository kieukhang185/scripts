#!/bin/bash

read -p "Enter personal github token: " -s TOKEN

REPO="$(basename `git rev-parse --show-toplevel`)"
EMAIL="kieukhang1805@gmail.com"
USERNAME="kieukhang185"

if [[ $REPO == "" ]]; then
  echo Please input the repository need to remote to! Exiting...
  exit 1
fi

git --version || eval "sudo apt update & sudo apt-get install -y git"

git config --global user.email 
git config --global user.name 

git remote set-url origin https://${TOKEN}@github.com/${USERNAME}/${REPO}.git
