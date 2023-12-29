<!-- -*- mode:markdown; coding:utf-8; -*- -->

# raylib-tileson wrapper for Ruby #

*   Created : 2023-12-23
*   Last modified : 2023-12-29

Provides Ruby bindings for raylib-tileson ( https://github.com/RobLoach/raylib-tileson )

## Features ##

*   Based on Ruby/FFI ( https://github.com/ffi/ffi )
*   Pre-built binaries are inside:
    *   Windows (x86_64)
    *   macOS (x86_64, ARM64)
    *   Linux (x86_64, ARM64)

## Quick Start ##

```
D:\> gem install raylib-bindings
D:\> gem install raylib-bindings-tileson
...
D:\> cd examples
D:\> ruby test.rb
```

## Prerequisites ##

*   Ruby interpreter
    *   Tested on:
        *   [macOS] https://rvm.io
            *   ruby 3.3.0 (2023-12-25 revision 5124f9ac75) [arm64-darwin23]
        *   [Windows] https://rubyinstaller.org/downloads/ Ruby+Devkit
            *   ruby 3.3.0 (2023-12-25 revision 5124f9ac75) [x64-mingw-ucrt]
        *   [Linux/x86_64 WSL] https://github.com/rvm/ubuntu_rvm
            *   ruby 3.2.0preview1 (2022-04-03 master f801386f0c) [x86_64-linux]
        *   [Linux/ARM64 Chromebook] https://github.com/rvm/ubuntu_rvm
            *   ruby 3.2.0 (2022-12-25 revision a528908271) [aarch64-linux]

## License ##

Shared libraries in `lib` directory are built on top of these products and are available under the terms of these licenses:

*   raylib-tileson
    *   <https://github.com/RobLoach/raylib-tileson/blob/master/LICENSE>

All ruby codes here are available under the terms of the 2-clause BSD License:

    BSD 2-Clause License

    Copyright (c) 2023 vaiorabbit <http://twitter.com/vaiorabbit>
    All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are met:

    1. Redistributions of source code must retain the above copyright notice, this
       list of conditions and the following disclaimer.

    2. Redistributions in binary form must reproduce the above copyright notice,
       this list of conditions and the following disclaimer in the documentation
       and/or other materials provided with the distribution.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
    AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
    IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
    DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
    FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
    DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
    SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
    CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
    OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
    OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
