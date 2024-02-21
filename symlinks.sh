#!/bin/sh
FFXIV_DIR="${HOME}/.xlcore/pluginConfigs"
SRC_DIR="${HOME}/Source/personal/ffxiv-plugins"

# All the json files here should be plugins, they get overwritten on updates
# and nothing we seem to do will change that, so whatever, just overwrite them
# here when it happens.
plugins="$(ls *.json)"

for file in $plugins; do 
    if [ ! -h "${FFXIV_DIR}/${file}" ]; then
        # It's not a symlink, move it here and recreate the symlink
        mv ${FFXIV_DIR}/${file} ${SRC_DIR}/${file}
        ln -sf ${SRC_DIR}/${file} ${FFXIV_DIR}/${file}
        echo "... Copied $file to repo"
    else
        echo "${file}: already a symlink."
    fi
done

# MapPartyAssist is nested, get those.
MAP_DIR="${FFXIV_DIR}/MapPartyAssist"

for file in `ls ${MAP_DIR}`; do
    if [ ! -h "${MAP_DIR}/${file}" ]; then
        # It's not a symlink, move it here and recreate the symlink
        mv ${MAP_DIR}/${file} ${SRC_DIR}/MapPartyAssist/${file}
        ln -sf ${SRC_DIR}/MapPartyAssist/${file} ${MAP_DIR}/${file}
        echo "... Copied MapPartyAssist/$file to repo"
    else
        echo "MapPartyAssist/${file}: already a symlink."
    fi
done

# Noted is nexted, just one file
if [ ! -h "${FFXIV_DIR}/NOTED/Settings.json" ]; then
    mv ${FFXIV_DIR}/NOTED/Settings.json ${SRC_DIR}/NOTED/Settings.json
    ln -sf ${SRC_DIR}/NOTED/Settings.json ${FFXIV_DIR}/NOTED/Settings.json
    echo "... Copied NOTED/Settings.json to repo"
else
    echo "NOTED/Settings.json: already a symlink."
fi
