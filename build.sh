
ICU_ROOT=$(pwd)

./configure_i386.sh
mkdir -p build-i386 && cd build-i386 && gnumake

cd $ICU_ROOT

./configure_armv7.sh
mkdir -p build-armv7 && cd build-armv7 && gnumake

cd $ICU_ROOT

./configure_armv7s.sh
mkdir -p build-armv7s && cd build-armv7s && gnumake

cd $ICU_ROOT

echo "Combining i386, armv7, and armv7s libraries."

./make_universal.sh
