#!/bin/bash

if ! [ -x "$(command -v avconv)" ]; then
  echo 'Error: avconv, provided by libav, is required but not installed.' >&2
  echo 'Homebrew users can install libav and avconv by running the following command:' >&2
  echo '  $ brew install libav' >&2
  exit 1
fi

for mkv in *.mkv; do
  mp4="$(basename -s .mkv "$mkv").mp4"
  # avconv -i "$mkv" -c:v copy -c:a aac -strict experimental -threads auto "$mp4"
  avconv -i "$mkv" -c:v copy -c:a copy "$mp4"
done
