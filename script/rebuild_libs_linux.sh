arch=`uname -a`
pushd .
cd ../tileson_dll
rm -r -f build_$(arch)
./build_tileson_linux.sh
popd
