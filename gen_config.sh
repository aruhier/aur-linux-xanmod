#!/bin/bash
TAG="5.11.0-xanmod1"
REPO="https://raw.githubusercontent.com/xanmod/linux/$TAG"

wget -O config "$REPO/.config"
sed -r -f config.sed -i config
