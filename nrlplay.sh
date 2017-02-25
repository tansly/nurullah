#!/bin/sh

/usr/bin/env python3 $1 | xargs --max-procs $(lscpu | grep "CPU(s):" | cut -d: -f2 | tr -d ' ') -L 1 xargs
wait
sh mkwav.sh
aplay output.wav
