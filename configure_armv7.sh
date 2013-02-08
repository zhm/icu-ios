DEVELOPER=/Applications/Xcode.app/Contents/Developer
DEVROOT=$DEVELOPER/Platforms/iPhoneOS.platform/Developer
SDKROOT=$DEVROOT/SDKs/iPhoneOS6.1.sdk
SYSROOT=$SDKROOT

ICU_PATH="$(pwd)/icu"
ICU_FLAGS="-I$ICU_PATH/source/common/ -I$ICU_PATH/source/tools/tzcode/ "

export CXXPP=
export CXXPPFLAGS=
export CPPFLAGS="-I$SDKROOT/usr/include/ -I./include/ -miphoneos-version-min=2.2 $ICU_FLAGS"

export CFLAGS="-arch armv7 $CPPFLAGS -pipe -no-cpp-precomp -isysroot $SDKROOT"
export CPP=""
export CXXFLAGS="$CFLAGS"
export CC="$DEVELOPER/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang"
export CXX="$DEVELOPER/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang"
export LDFLAGS="-L$SDKROOT/usr/lib/ -isysroot $SDKROOT -Wl,-dead_strip -miphoneos-version-min=2.0 -lstdc++"

mkdir -p build-armv7 && cd build-armv7

[ -e Makefile ] && make distclean

sh $ICU_PATH/source/configure --host=arm-apple-darwin --enable-static --disable-shared -with-cross-build=$ICU_PATH/../build-i386
