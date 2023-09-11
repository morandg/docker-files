#!/bin/sh
set -e

SRC_DIR=/tmp/spdlog_setup
BUILD_DIR=/tmp/spdlog_setup_build

readonly SRC_DIR
readonly BUILD_DIR

mkdir -p ~/.ssh
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts

git clone --depth 1 --branch v0.3.2 https://github.com/guangie88/spdlog_setup.git "${SRC_DIR}"
mkdir -p "${BUILD_DIR}"
cd "${BUILD_DIR}"
cmake "${SRC_DIR}" -DCMAKE_BUILD_TYPE=Release -DSPDLOG_SETUP_INCLUDE_UNIT_TESTS=OFF
cmake --build . --target install
rm ${SRC_DIR} ${BUILD_DIR} -rf
