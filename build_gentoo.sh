#!/bin/bash

sudo rm /usr/src/linux/.config

# CLANG and LTO
sudo CC=clang CXX=clang++ --preserve-env=PATH -- bash -c 'genkernel --kernel-config=config --nconfig --no-install kernel && cd /usr/src/linux; make modules_install -s -j$(nproc) INSTALL_MOD_STRIP=1 && make install && emerge @module-rebuild; rm -rf /var/tmp/genkernel/*'

# GCC
# sudo --preserve-env=PATH -- bash -c 'genkernel --kernel-config=config --nconfig --no-install kernel && cd /usr/src/linux; make modules_install -s -j && make install; rm /var/tmp/genkernel/*'
