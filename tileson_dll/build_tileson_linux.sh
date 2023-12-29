#!/bin/sh

cp fix_raylib_tileson.patch tileson/
cd tileson/
git apply ./fix_raylib_tileson.patch
cd ..

export RAYLIB_DLL_PATH=../raylib-bindings/raylib_dll

arch=`uname -a`

mkdir -p build_$(arch)
cd build_$(arch)
cmake -D CMAKE_C_FLAGS="" -D CMAKE_BUILD_TYPE=Release -D BUILD_SHARED_LIBS=ON -D CMAKE_C_COMPILER=clang -D RAYLIB_DLL_PATH=$RAYLIB_DLL_PATH ../
make
cp tileson.so ../../lib/tileson.$(arch).so
