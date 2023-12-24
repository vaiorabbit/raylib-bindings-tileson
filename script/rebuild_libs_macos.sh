pushd .
cd ..
git submodule update --init --recursive --depth=1
popd

pushd .
cd ../tileson_dll
rm -r -f build_x86_64
rm -r -f build_arm64
./build_tileson_macos.sh
popd
