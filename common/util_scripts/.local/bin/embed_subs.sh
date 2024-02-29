#!/bin/bash

filename=$1
filename="${filename%.*}"

vidFilename=${filename}.mp4
subFilename=${filename}.srt
outFilename=${filename}_subs.mp4

echo "Embedding for ${filename}"

subberthehut -sofqq ${vidFilename}

if ! [[ -f "$subFilename" ]] ; then
    echo "Failed to download subtitles";
    exit
fi

ffmpeg -hide_banner -loglevel error \
-i ${vidFilename} \
-f srt -sub_charenc ISO-8859-8 -i ${subFilename} \
-map 0:0 -map 0:1 -map 1:0 \
-c:v copy -c:a copy -c:s mov_text \
-metadata:s:s:0 language=eng \
${outFilename}

rm ${subFilename}
