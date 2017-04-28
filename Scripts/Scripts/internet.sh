#!/bin/bash

if [[ $# -eq 0 ]]
  then
    netctl start wlp1s0GIM2
  else
    netctl start $1
fi
ping 8.8.8.8 -c5
