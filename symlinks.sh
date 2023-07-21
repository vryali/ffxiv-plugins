#!/bin/sh
FFXIV_DIR="${HOME}/.xlcore/pluginConfigs"
SRC_DIR="${HOME}/Source/personal/ffxiv-plugins"

# Just define them staticly for now
plugins="PatMe.json TeleporterPlugin.json WaymarkPresetPlugin.json BDTHPlugin.json BigPlayerDebuffs.json PartyIcons.json SimpleTweaksPlugin.json SoundFilter.json XIVCombo.json RezPls.json NeatNoter.json DeathRecap.json"
for file in $plugins; do
    if [ ! -h "${FFXIV_DIR}/${file}" ]; then
        # It's not a symlink, move it here and recreate the symlink
        mv ${FFXIV_DIR}/${file} ${SRC_DIR}/${file}
        ln -sf ${SRC_DIR}/${file} ${FFXIV_DIR}/${file}
        echo "... Copied $file to repo"
    else
        echo "${file}: is link."
    fi
done
