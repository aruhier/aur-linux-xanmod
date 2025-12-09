#!/bin/bash
TAG="6.17"

cp /var/db/repos/localrepo/sys-kernel/cachyos-sources/files/$TAG/config-bore config
sed -r -f config.sed -i config
