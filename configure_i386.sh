DEVELOPER="$(xcode-select --print-path)"
ARCH="i386"

ICU_PATH="$(pwd)/icu"
ICU_FLAGS="-I$ICU_PATH/source/common/ -I$ICU_PATH/source/tools/tzcode/ "

export CXX="$DEVELOPER/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang++"
export CC="$DEVELOPER/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang"
export CFLAGS="-arch $ARCH $ICU_FLAGS"
export CXXFLAGS="-stdlib=libc++ -std=c++11 -arch $ARCH $ICU_FLAGS"
export LDFLAGS="-stdlib=libc++ -Wl,-dead_strip -lstdc++"

mkdir -p build-$ARCH && cd build-$ARCH

[ -e Makefile ] && make distclean

sh $ICU_PATH/source/configure --enable-static --disable-shared
