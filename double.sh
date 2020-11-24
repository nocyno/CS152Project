#. ~/src/torch/install/bin/torch-activate
upscaleWaifu2x() {
    SIZE1=$(identify -format "%h" "$@")
    SIZE2=$(identify -format "%w" "$@");

    if (( $SIZE1 < 512 && $SIZE2 < 512  )); then
        TMP=$(mktemp "/tmp/XXXXXX.png")
        CUDA_VISIBLE_DEVICES="$((RANDOM % 2 < 1))" nice ./waifu2x-ncnn-vulkan-20200818-linux/waifu2x-ncnn-vulkan \
            -i "$@" -o "$TMP"
        convert "$TMP" "$@"
        rm "$TMP"
    fi;  }

export -f upscaleWaifu2x
find ./faces/ -type f | parallel --progress --jobs 1 upscaleWaifu2x
