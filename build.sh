#!/usr/bin/env bash

set -euo pipefail

REPO_ROOT=$(cd $(dirname $0); pwd)
TMP_ROOT=$REPO_ROOT/tmp
TMP_QMK_FIRMWARE_ROOT=$TMP_ROOT/qmk_firmware
TMP_BUILD_OUTPUT_ROOT=$TMP_ROOT/build_output
# NOTE: If you want to use a different version of qmk_firmware, you can set the QMK_FIRMWARE_VERSION environment variable.
# QMK_FIRMWARE_VERSION=0.26.4 build.sh keyball/keyball39:default
QMK_FIRMWARE_VERSION=${QMK_FIRMWARE_VERSION:-0.22.14}
TMP_QMK_FIRMWARE_VERSIONING_ROOT=$TMP_QMK_FIRMWARE_ROOT/${QMK_FIRMWARE_VERSION}

REPO_KEYBALL_ROOT=$REPO_ROOT/qmk_firmware/keyboards/keyball
TMP_QMK_KEYBALL_ROOT=$TMP_QMK_FIRMWARE_VERSIONING_ROOT/keyboards/keyball

mkdir -p $TMP_ROOT

if [[ ! -d "$TMP_QMK_FIRMWARE_VERSIONING_ROOT" ]]; then
    git clone https://github.com/qmk/qmk_firmware.git --depth 1 --recurse-submodules --shallow-submodules -b $QMK_FIRMWARE_VERSION $TMP_QMK_FIRMWARE_VERSIONING_ROOT
fi

rm -rf $TMP_QMK_KEYBALL_ROOT
cp -rf $REPO_KEYBALL_ROOT $TMP_QMK_KEYBALL_ROOT

cd $TMP_QMK_FIRMWARE_VERSIONING_ROOT
docker run --rm -it \
	--privileged -v /dev:/dev \
	--user $(id -u):$(id -g) \
	-w /qmk_firmware \
	-v "$TMP_QMK_FIRMWARE_VERSIONING_ROOT":/qmk_firmware:z \
	-e SKIP_GIT=true \
	ghcr.io/qmk/qmk_cli \
	make "$@"

mkdir -p $TMP_BUILD_OUTPUT_ROOT
cp -rf $TMP_QMK_FIRMWARE_VERSIONING_ROOT/.build/*.hex $TMP_BUILD_OUTPUT_ROOT
