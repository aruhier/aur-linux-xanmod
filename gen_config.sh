#!/bin/bash
TAG="5.12.8-xanmod1"
REPO="https://raw.githubusercontent.com/xanmod/linux/$TAG"

wget -O config "$REPO/.config"
sed -r -f config.sed -i config
