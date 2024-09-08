#!/bin/sh
FFXIV_DIR="${HOME}/.xlcore/pluginConfigs"
SRC_DIR="${HOME}/Source/personal/ffxiv-plugins"

# All the json files here should be plugins, copy them over
# the config will onyl be read if the plugin is installed
plugins="$(ls *.json)"

for file in $plugins; do 
    cp ${SRC_DIR}/${file} ${FFXIV_DIR}/${file}
    echo "... Copied $file to FFXIV" 
done

