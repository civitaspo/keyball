#!/usr/bin/env bash

set -euo pipefail

REPO_ROOT=$(cd $(dirname $0); pwd)
TMP_ROOT=$REPO_ROOT/tmp
TMP_QMK_FIRMWARE_ROOT=$TMP_ROOT/qmk_firmware
SUPPORTED_QMK_VERSION=0.22.14

REPO_KEYBALL_ROOT=$REPO_ROOT/qmk_firmware/keyboards/keyball
TMP_QMK_KEYBALL_ROOT=$TMP_QMK_FIRMWARE_ROOT/keyboards/keyball

mkdir -p $TMP_ROOT

if [[ ! -d "$TMP_QMK_FIRMWARE_ROOT" ]]; then
    git clone https://github.com/qmk/qmk_firmware.git --depth 1 --recurse-submodules --shallow-submodules -b $SUPPORTED_QMK_VERSION $TMP_QMK_FIRMWARE_ROOT
fi

rm -rf $TMP_QMK_KEYBALL_ROOT
cp -rf $REPO_KEYBALL_ROOT $TMP_QMK_KEYBALL_ROOT

cd $TMP_QMK_FIRMWARE_ROOT
docker run --rm -it \
	--privileged -v /dev:/dev \
	--user $(id -u):$(id -g) \
	-w /qmk_firmware \
	-v "$TMP_QMK_FIRMWARE_ROOT":/qmk_firmware:z \
	-e SKIP_GIT=true \
	ghcr.io/qmk/qmk_cli \
	make "$@"
