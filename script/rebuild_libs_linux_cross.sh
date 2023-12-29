pushd .
cd ../tileson_dll
rm -r -f build_arm64
./build_tileson_linux_cross.sh
popd
