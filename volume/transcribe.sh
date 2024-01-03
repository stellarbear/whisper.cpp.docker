#!/bin/bash
echo "[logger]: configuration"
echo "${MODEL}"
echo "${LANGUAGE}"

# Model verification
echo "[logger]: model verification"
if [ ! -f "./models/ggml-$MODEL.bin" ]; then
    echo "[logger]: model not found. downloading"
    ./models/download.sh "$MODEL"
else
    echo "[logger]: model found"
fi

# Transcribe
rm ./volume/output/*
shopt -s nullglob
for file in ./volume/input/*; do
    base_name=$(basename -- "$file") 
    extension="${base_name##*.}"
    file_name="${base_name%.*}"
    echo "$file" "$file_name"
    
    echo "[logger]: Covert to wav "$file_name""
    ffmpeg -i "$file" -ar 16000 "./volume/output/$file_name.wav"

    echo "[logger]: Transcribe"
    ./main -m "./models/ggml-$MODEL.bin" -f "./volume/output/$file_name.wav" --language "ru" -otxt -osrt
done