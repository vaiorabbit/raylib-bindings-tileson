#!/bin/sh
pushd .
cd ..
for i in `ls raylib-bindings-tileson-*.gem`; do
    echo gem push $i
done
popd
