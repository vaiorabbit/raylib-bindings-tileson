#!/bin/sh
export MACOSX_DEPLOYMENT_TARGET=13.0

cp fix_raylib_tileson.patch tileson/
cd tileson/
git apply ./fix_raylib_tileson.patch
cd ..

export RAYLIB_DLL_PATH=../raylib-bindings/raylib_dll

mkdir -p build_x86_64
cd build_x86_64
cmake -D CMAKE_C_FLAGS="" -D CMAKE_BUILD_TYPE=Release -D CMAKE_OSX_ARCHITECTURES="x86_64" -D BUILD_SHARED_LIBS=ON -D BUILD_PLATFORM="x86_64" -D CMAKE_C_COMPILER=clang -D RAYLIB_DLL_PATH=$RAYLIB_DLL_PATH ../
make
cp tileson.dylib ../../lib/tileson.x86_64.dylib

cd ..

mkdir -p build_arm64
cd build_arm64
cmake -D CMAKE_C_FLAGS="" -D CMAKE_BUILD_TYPE=Release -D CMAKE_OSX_ARCHITECTURES="arm64" -D BUILD_SHARED_LIBS=ON -D BUILD_PLATFORM="arm64" -D CMAKE_C_COMPILER=clang -D RAYLIB_DLL_PATH=$RAYLIB_DLL_PATH ../
make
cp tileson.dylib ../../lib/tileson.arm64.dylib
