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

# Backup the characater config in case it gets hosed
# Note: the / at the end of source is important, the lack of / at the end of target is important
CHR_DATA='/home/vry/.xlcore/ffxivConfig/FFXIV_CHR00400000009ED79F/'
GDRIVE="/data/Insync/jwolfe@orphicsolutions.com/Google/Personal/FFXIV/FFXIV_CHR00400000009ED79F"

echo "Rsyncing over data from character file to gdrive"
rsync -a --delete --progress "${CHR_DATA}" "${GDRIVE}"
