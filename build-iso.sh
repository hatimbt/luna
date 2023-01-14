#!/bin/sh

# Error handling
die() {
	printf '%s\n' "$@" >&2
	exit 1
}

# Copy channels file
guix time-machine -C './luna/channels.scm' -- \
	describe -f channels > './channels.scm'

# Build the image
printf 'Attempting to build luna image...\n'
image=$(guix time-machine -C './channels.scm' -- system image --image-type=iso9660 './luna/install.scm') 

# Prepare the release .iso file
release_tag=$(date +"%Y%m%d%H%M")
cp "${image}" "./luna-installer-${release_tag}.iso"

printf 'Image `%s` was succesfully built.\n' "${image}"

# Cleanup
rm -f ./channels.scm
unset -f die
unset -v image release_tag
