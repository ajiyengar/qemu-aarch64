#!/usr/bin/env bash

set -e

###############
# Sync Toolchain
###############
#mkdir -p tools
#curl -sSL https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/binrel/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu.tar.xz | tar -C tools -xJ


export CROSS_COMPILE=$PWD/tools/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/bin/aarch64-none-linux-gnu-

###############
# Build gnu-efi
###############
make -C gnu-efi ARCH=aarch64 CROSS_COMPILE=$CROSS_COMPILE gnuefi

###############
# Build Apps
###############
make ARCH=aarch64 CROSS_COMPILE=$CROSS_COMPILE
