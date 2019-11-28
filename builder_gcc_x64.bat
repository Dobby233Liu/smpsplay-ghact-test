@echo off
rem set GNUMAKEFLAGS=-j4 before running the script to speed up the build on multicore systems
set BUILD_DIR="build_GCC"
set BASE_DIR="%cd%\download"
set INST_DIR="%cd%\install"
set CXXFLAGS="-m64"
set CFLAGS="-m64"

rem create clean folder structure
rmdir %BUILD_DIR%
mkdir %BUILD_DIR%
cd %BUILD_DIR%


rem ---- build/install libvgm ---
mkdir libvgm
cd libvgm

set LIBVGM_CMAKE_OPTS="-D CMAKE_BUILD_TYPE=Release -D BUILD_TESTS=OFF -D BUILD_PLAYER=OFF -D BUILD_LIBAUDIO=ON -D BUILD_LIBEMU=ON -D BUILD_LIBPLAYER=OFF -D SNDEMU_ALL=OFF -D SNDEMU_YM2612_GPGX=ON -D SNDEMU_SN76496_MAME=ON -D SNDEMU_UPD7759_ALL=ON"
cmake -G "MSYS Makefiles" -D CMAKE_INSTALL_PREFIX="%INST_DIR%" %LIBVGM_CMAKE_OPTS% "%BASE_DIR%/libvgm"
sh -c make install

cd ..

echo Done.
