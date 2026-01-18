#!/bin/bash

_DIR=$(dirname "$0")
source $_DIR/exports.sh

sudo cp aruhier.config /usr/src/linux/arch/x86/configs/aruhier.config
cd /usr/src/linux
sudo --preserve-env=$PRESERVE_ENV_LIST make cachyos_defconfig aruhier.config
