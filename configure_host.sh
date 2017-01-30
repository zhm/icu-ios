DEVELOPER="$(xcode-select --print-path)"
SDKROOT="$(xcodebuild -version -sdk macosx10.11 | grep -E '^Path' | sed 's/Path: //')"
ARCH="x86_64"

ICU_PATH="$(pwd)/icu"
ICU_FLAGS="-I$ICU_PATH/source/common/ -I$ICU_PATH/source/tools/tzcode/ "

export CXX="$DEVELOPER/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang++"
export CC="$DEVELOPER/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang"
export CFLAGS="-isysroot $SDKROOT -I$SDKROOT/usr/include/ -I./include/ -arch $ARCH $ICU_FLAGS"
export CXXFLAGS="-stdlib=libc++ -std=c++11 -isysroot $SDKROOT -I$SDKROOT/usr/include/ -I./include/ $ICU_FLAGS"
export LDFLAGS="-stdlib=libc++ -L$SDKROOT/usr/lib/ -isysroot $SDKROOT -Wl,-dead_strip -lstdc++"

mkdir -p build-host && cd build-host

[ -e Makefile ] && make distclean

sh $ICU_PATH/source/configure --enable-static --disable-shared
