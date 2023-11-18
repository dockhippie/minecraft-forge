#!/usr/bin/env bash

if [ ! -d ${MINECRAFT_MODS_DIR} ]; then
    echo "> creating mods dir"
    mkdir -p ${MINECRAFT_MODS_DIR}
fi

if [ -f ${MINECRAFT_OPTIONALS_DIR}/${DYNMAP_JAR} ]; then
    if [[ "${MINECRAFT_ENABLE_DYNMAP}" == "true" || "${MINECRAFT_ENABLE_DYNMAP}" == "1" ]]; then
        echo "> enabling dynmap mod"
        cp -f ${MINECRAFT_OPTIONALS_DIR}/${DYNMAP_JAR} ${MINECRAFT_MODS_DIR}/${DYNMAP_JAR}

        if [ ! -d ${MINECRAFT_DYNMAP_DIR} ]; then
            echo "> creating dynmap dir"
            mkdir -p ${MINECRAFT_DYNMAP_DIR}
        fi

        if [ ! -L ${MINECRAFT_GAME_DIR}/dynmap ]; then
            echo "> creating dynmap symlink"
            ln -sf ${MINECRAFT_DYNMAP_DIR} ${MINECRAFT_GAME_DIR}/dynmap
        fi
    else
        echo "> disabling dynmap mod"
        rm -f ${MINECRAFT_MODS_DIR}/${DYNMAP_JAR}
    fi
fi
