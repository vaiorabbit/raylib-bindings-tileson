#!/bin/sh

cp fix_raylib_tileson.patch tileson/
cd tileson/
git apply ./fix_raylib_tileson.patch
cd ..

export RAYLIB_DLL_PATH=../raylib-bindings/raylib_dll

export ARCH=aarch64

mkdir -p build_${ARCH}
cd build_${ARCH}
cmake -D CMAKE_C_FLAGS=-isystem\ /usr/aarch64-linux-gnu/include -D CMAKE_BUILD_TYPE=Release -D CMAKE_C_COMPILER_TARGET=aarch64-linux-gnu -D CMAKE_SYSTEM_PROCESSOR=ARM -D BUILD_SHARED_LIBS=ON -D CROSS_BUILD_PLATFORM=${ARCH} -D CMAKE_CXX_COMPILER=aarch64-linux-gnu-g++ -D RAYLIB_DLL_PATH=$RAYLIB_DLL_PATH ../
make

cp tileson.so ../../lib/tileson.${ARCH}.so
