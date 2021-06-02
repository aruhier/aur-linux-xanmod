#!/bin/bash

# CLANG and LTO
sudo LLVM=1 LLVM_IAS=1 genkernel --kernel-config=config --nconfig all

# GCC
# sudo genkernel --kernel-config=config --nconfig all
