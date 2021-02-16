#!/bin/bash
TAG="5.10.9-xanmod1"
REPO="https://raw.githubusercontent.com/xanmod/linux/$TAG"

wget -O config "$REPO/.config"
sed -r -f config.sed -i config
