#!/bin/bash

LNG=$(xkblayout-state print %s | awk '{print toupper($0)}')
case $LNG in
  "US")
    CLR=\#00FF00 ;; # green
  "BG")
    CLR=\#FFD700 ;; # gold
  *)
    CLR=\#FFFFFF ;; # all others default-white
esac
echo "$LNG"
echo "$LNG"
echo "$CLR"
