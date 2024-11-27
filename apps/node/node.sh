#!/bin/bash

source ~/.bashrc

eval "$(cat ~/.bashrc | tail +10)"

fnm install --lts
