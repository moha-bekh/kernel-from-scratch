#!/usr/bin/env bash

set -e

sudo apt-get update

sudo apt-get install -y \
  build-essential \
  nasm \
  gcc \
  gcc-multilib \
  g++-multilib \
  grub-common \
  grub-pc-bin \
  xorriso \
  mtools \
  qemu-system-x86
