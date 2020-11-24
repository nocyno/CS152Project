convertPNGToJPG() { convert -quality 33 "$@" "$@".jpg && rm "$@"; }
export -f convertPNGToJPG
find ./faces/ -type f -name "*.png" | parallel --progress convertPNGToJPG
