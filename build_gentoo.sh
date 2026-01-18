#!/bin/bash

_DIR=$(dirname "$0")
source $_DIR/exports.sh

echo "[$(date '+%d/%m/%Y %H:%M:%S')] Load kernel in memory"
vmtouch -q -t -m 1M /usr/src/linux/{drivers,fs,sound}

sudo --preserve-env="$PRESERVE_ENV_LIST" -- nice -n 15 bash -c '
    cd /usr/src/linux && \
    make nconfig && \
    echo "[$(date "+%d/%m/%Y %H:%M:%S")] Compiling kernel" && \
    make -s -j${_NTHREADS} INSTALL_MOD_STRIP=1 && \
    echo "[$(date "+%d/%m/%Y %H:%M:%S")] Installing modules" && \
    make modules_install -s -j${_NTHREADS} INSTALL_MOD_STRIP=1 && \
    echo "[$(date "+%d/%m/%Y %H:%M:%S")] Installing kernel" && \
    make install && \
    echo "[$(date "+%d/%m/%Y %H:%M:%S")] Rebuidling modules installed via emerge" && \
    emerge --keep-going @module-rebuild'

# Old school genkernel
# sudo CC=clang CXX=clang++ --preserve-env=PATH -- bash -c 'genkernel --kernel-co --nconfig --no-install kernel && cd /usr/src/linux; make modules_install -s -j$(nproc) INSTALL_MOD_STRIP=1 && make install && emerge @module-rebuild; rm -rf /var/tmp/genkernel/*'
# GCC
# sudo --preserve-env=PATH -- bash -c 'genkernel --kernel-config=config --nconfig --no-install kernel && cd /usr/src/linux; make modules_install -s -j && make install; rm /var/tmp/genkernel/*'
