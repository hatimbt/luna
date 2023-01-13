#!/bin/sh

# Build the image
printf 'Attempting to build luna image...\n'
image=$(guix system image --image-type=iso9660 './system/install.scm') 

# Prepare the release .iso file
release_tag=$(date +"%Y%m%d%H%M")
cp "${image}" "./luna-installer-${release_tag}.iso"

printf 'luna .iso succesfully built.\n'
