#!/bin/bash
IFS=';'
while read -r url key || [ -n "$url" ]
do
    ffmpeg -re -stream_loop -1 -i $url -codec copy -f flv rtmp://srs/file/$key &
done < /app/urls.txt
wait