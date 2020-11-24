#. ~/src/torch/install/bin/torch-activate
upscaleWaifu2x() {
    SIZE1=$(identify -format "%h" "$@")
    SIZE2=$(identify -format "%w" "$@");

    if (( $SIZE1 < 512 && $SIZE2 < 512  )); then
	   echo "$SIZE1"
	   echo "$SIZE2"
	   echo
           fi;  }

export -f upscaleWaifu2x
find ./faces/ -type f | parallel --progress --jobs 1 upscaleWaifu2x
