#!/bin/sh

/usr/bin/env python3 $1 | xargs --max-procs $(nproc) -L 1 xargs
wait
sh mkwav.sh
aplay output.wav
