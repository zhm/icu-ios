## ICU for iOS - armv7 / armv7s / arm64 / i386 / x86 64

This is a static universal build of ICU 54.1.1 for armv7, armv7s, arm64, x86 64 and i386 suitable for using in iOS apps. The `icu` directory is taken from [here](http://download.icu-project.org/files/icu4j/54.1.1/icu4j-54_1_1.tgz).

## Setting it up

I recommend putting this repo under a `Vendor` directory inside your project folder so it remains portable.

    $ git submodule add git@github.com:zhm/icu-ios.git YourAppName/Vendor/icu-ios

## Compiling the static library

    $ cd YourAppName/Vendor/icu-ios
    $ ./build.sh

## Adding it to your project

Add all of the `.a` files from the `build-universal` directory to your project from the `Link Binary With Libraries` section under
the `Build Phases` tab in Xcode.

Under the `Build Settings` tab, add the path to the header files. Here are the header paths if you've placed this project inside a `Vendor` folder in your project:

    $(SRCROOT)/YourAppName/Vendor/icu-ios/icu/source/i18n
    $(SRCROOT)/YourAppName/Vendor/icu-ios/icu/source/common
