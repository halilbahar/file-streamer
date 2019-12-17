#!/bin/bash

download_file() {
    curl -s "$1" -o "$2_temp.mp4"
    mv -f "$2_temp.mp4" "$2.mp4"
}

IFS=';'
while read -r url key || [ -n "$url" ]
do
    download_file "$url" "$key"
    urls+=("$url")
    keys+=("$key")
    printf "ffconcat version 1.0\nfile '%s.mp4'\nfile '%s.txt'" "$key" "$key" > "$key.txt"
    ffmpeg -nostdin -re -f concat -i "$key.txt" -codec copy -f flv "rtmp://srs/file/$key" &
done < urls.txt

while true
do
    sleep 900
    for i in "${!urls[@]}"
    do
        download_file "${urls[$i]}" "${keys[$i]}"
    done
done