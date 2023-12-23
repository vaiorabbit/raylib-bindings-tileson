pushd .
cd ..
git submodule update --init --recursive --depth=1
cd raylib-bindings/raylib_dll
./build_raylib_macos.sh
popd

pushd .
cd ../tileson_dll
rm -r -f build_x86_64
rm -r -f build_arm64
./build_tileson_macos.sh
popd
