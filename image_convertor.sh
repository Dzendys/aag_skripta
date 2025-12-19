#!/bin/bash

if ! command -v magick &> /dev/null; then
    echo "Error: ImageMagick is not installed."
    exit 1
fi

KEEP_ORIGINAL=true

while getopts "d" opt; do
  case ${opt} in
    d )
      KEEP_ORIGINAL=false
      ;;
    \? )
      echo "Usage: $0 [-d] <soubor>"
      exit 1
      ;;
  esac
done

shift $((OPTIND -1))

INPUT_FILE="$1"
if [ -z "$INPUT_FILE" ] || [ ! -f "$INPUT_FILE" ]; then
    echo "Error: No input file provided."
    echo "Usage: $0 [-d] <input_file>"
    exit 1
fi

EXTENSION="${INPUT_FILE##*.}"
case "${EXTENSION,,}" in
    png|jpg|jpeg|webp|bmp|tiff|svg) ;;
    *) echo "Error: Unsupported file format."; exit 1 ;;
esac

FILENAME="${INPUT_FILE%.*}"
WHITE_OUT="${FILENAME}_white.png"
BLACK_OUT="${FILENAME}_black.png"

magick "$INPUT_FILE" \
    -alpha off \
    -white-threshold 70% \
    -negate \
    -transparent black \
    -write "$WHITE_OUT" \
    -fuzz 45% -fill black -opaque white \
    "$BLACK_OUT"

echo "Vytvořeno: $WHITE_OUT a $BLACK_OUT"

if [ "$KEEP_ORIGINAL" = false ]; then
    rm "$INPUT_FILE"
fi