#!/bin/bash

source ~/.bashrc

if [ $(sed -n '/^NAME/p' /etc/os-release | tr -d \"NAME=) = Ubuntu ]; then
  eval "$(cat ~/.bashrc | tail +10)"
fi

fnm install --lts
