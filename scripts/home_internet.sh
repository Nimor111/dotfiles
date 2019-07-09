netctl stop-all && netctl restart wlp1s0-$1
ping -c 5 8.8.8.8
