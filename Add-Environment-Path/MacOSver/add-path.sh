#!/bin/bash

# The directory you want to add to the PATH, passed as an argument
DirectoryToAdd="$1"

# Get the current PATH environment variable value
CurrentPath="$PATH"

# Check if the directory is already in the PATH
if [[ ":$CurrentPath:" != *":$DirectoryToAdd:"* ]]; then
    # If not, append the directory to the PATH
    export PATH="$CurrentPath:$DirectoryToAdd"
    
    # The following line is for persisting the PATH change across sessions and reboots
    # It appends the export command to the end of ~/.bashrc and ~/.profile
    # Remove or comment out these lines if you don't want to persist the change
    echo "export PATH=\"$PATH\"" >> ~/.bashrc
    echo "export PATH=\"$PATH\"" >> ~/.profile

    echo "The directory has been added to the PATH."
else
    echo "The directory is already in the PATH."
fi
