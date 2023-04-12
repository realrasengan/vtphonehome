#!/bin/bash
OPENAI_API_KEY="" # put key here
VT_UUID=$(uuidgen)
VT_FOLDER=/tmp/vtphonehome/$VT_UUID
mkdir -p $VT_FOLDER

sox -d $VT_FOLDER/recording.wav silence 1 0.1 2% 1 2.0 2% && lame $VT_FOLDER/recording.wav $VT_FOLDER/recording.mp3 && rm $VT_FOLDER/recording.wav && \
VT_INPUT=$(curl https://api.openai.com/v1/audio/transcriptions \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -H "Content-Type: multipart/form-data" \
  -F file="@$VT_FOLDER/recording.mp3" \
  -F model="whisper-1" | jq .text | sed 's/\"//g')

echo $VT_INPUT
VT_COMMAND=$(osascript -e "tell application \"System Events\" to keystroke \"${VT_INPUT}\"")
VT_COMMAND=$(echo $VT_COMMAND  | sed 's/\\"/"/g' | sed 's/\\\\/\\/g')

echo $VT_COMMAND > $VT_FOLDER/run.sh && chmod u+x $VT_FOLDER/run.sh && $VT_FOLDER/run.sh
  

