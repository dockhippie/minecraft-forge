#!/bin/bash

if [[ "${SERVER_DYNMAP}" == "true" || "${SERVER_DYNMAP}" == 1 ]]
then
  echo "> enabling dynmap mod"
  cp -f /minecraft/optional/DYNMAP.jar /minecraft/mods/DYNMAP.jar
else
  echo "> disabling dynmap mod"
  rm -f /minecraft/mods/DYNMAP.jar
fi
