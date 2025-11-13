#!/run/current-system/sw/bin/bash

# Directory containing wallpaper images
kitty="/home/$(whoami)/knakto/nixosConfig/home/config/kitty"
WALLPAPER_DIR="$kitty/wallpaper"
check=$(ls "$WALLPAPER_DIR" | grep "$1")
if [ $# != "0" ]; then
	if [ "$1" != "$check" ]; then
		echo "No images found in $1"
		exit 1
	fi
	RANDOM_IMAGE="$1"
	rm -rf "~/random_wallpaper"
	cp "$WALLPAPER_DIR/$RANDOM_IMAGE" "~/random_wallpaper"
	exit 0
fi

# IMAGE_FILES=($(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \)))
IMAGE_FILES=($(find "$WALLPAPER_DIR" -type f \( -iname "*" \)))

if [ ${#IMAGE_FILES[@]} -eq 0 ]; then
    echo "No images found in $WALLPAPER_DIR"
    exit 1
fi

RANDOM_IMAGE="${IMAGE_FILES[RANDOM % ${#IMAGE_FILES[@]}]}"

rm -rf ~/.random_wallpaper
cp "$RANDOM_IMAGE" ~/.random_wallpaper
