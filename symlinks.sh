#!/bin/sh
FFXIV_DIR="${HOME}/.xlcore/pluginConfigs"
SRC_DIR="${HOME}/Source/personal/ffxiv-plugins"

# Just define them staticly for now
plugins="PatMe.json TeleporterPlugin.json WaymarkPresetPlugin.json"
for file in $plugins; do
    ln -sf ${SRC_DIR}/${file} ${FFXIV_DIR}/${file}
done
