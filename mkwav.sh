# Copyright (c) 2017, Berk Ozbalci, Fatih Akca, Yagmur Oymak
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
# 
# * Redistributions of source code must retain the above copyright notice, this
#   list of conditions and the following disclaimer.
# 
# * Redistributions in binary form must reproduce the above copyright notice,
#   this list of conditions and the following disclaimer in the documentation
#   and/or other materials provided with the distribution.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

count=0

for track in /tmp/nurullah/*
do
    find $track/*.wav -print0 | xargs -0 -i -P $(nproc) -n 1 sox -v 0.50 '{}' -t s16 -r 44100 -c 1 '{}'.raw
    cat $track/*.raw > $track/out.pcm
    sox -t s16 -r 44100 -c 1 $track/out.pcm /tmp/nurullah/out_${track##*/}.wav
    count=$((count+1))
done

if [ "$count" -ne 1 ]
then
    sox -m $(
    for out in `seq 0 $((count -1))`
    do
        echo "/tmp/nurullah/out_$out.wav"
    done
    ) output.wav
else
    mv /tmp/nurullah/out_*.wav output.wav
fi

rm -rf /tmp/nurullah
