#!/bin/bash

# set the drive's mountpoint, UUID, and filesystem type.
DRIVE_UUID = "efec76d8-d283-41ba-bd8c-59c4c4c55d58"
MOUNT_POINT = "/mnt/data"
FS_TYPE = "btrfs"

# check if the drive is already mounted
if ! mountpoint -q "$MOUNT_POINT"; then
    # create the mountpoint if it doesn't exist
    if [ ! -d "$MOUNT_POINT" ]; then
        sudo mkdir -p "$MOUNT_POINT"
    fi

# mount the drive
    sudo mounbt -t "$FS_TYPE" -U "$DRIVE_UUID" "$MOUNT_POINT"

    if [$? -eq 0]; then
        echo "Drive mounted successfully at $MOUNT_POINT"
    else
        echo "Failed to mount drive"
    fi
else
    echo "Drive is already mounted at $MOUNT_POINT"
fi