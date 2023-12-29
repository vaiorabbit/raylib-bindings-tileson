@echo off
pushd %CD%
cd ..
call gem.cmd build raylib-bindings-tileson.gemspec
call gem.cmd build raylib-bindings-tileson.gemspec --platform arm64-darwin
call gem.cmd build raylib-bindings-tileson.gemspec --platform x86_64-darwin
call gem.cmd build raylib-bindings-tileson.gemspec --platform aarch64-linux
call gem.cmd build raylib-bindings-tileson.gemspec --platform x86_64-linux
call gem.cmd build raylib-bindings-tileson.gemspec --platform x64-mingw
popd
