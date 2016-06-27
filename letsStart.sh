echo "-----------------------------------------------"
echo "        Setup Script - Netsurf 3.6 dev         "
echo "Crossed Compilation Cygwin (Windows) - AmigaOS3"
echo "                                               "
echo "       Created by DNADNL, EyMenZ & Tygre       "
echo "                                               "
echo "                A big thanks to                "
echo "    Chris Young and the amiga.org forums !     "
echo "                                               "
echo "     *** Script Version : 20160627-1 ***       "
echo "-----------------------------------------------"

echo "Verifying gcc-tools... "
if [ ! -d "/opt/gcc-tools" ]
then
	echo "gcc-tols don't exist. Copying gcc-tools... "
	mkdir /opt/gcc-tools
	cp -R dataFiles/gcc-tools/* /opt/gcc-tools/
	echo "gcc-tools copied !"
else
	echo "gcc-tools already exist."
fi

git clone git://git.netsurf-browser.org/toolchains.git
./scriptFilesUpdate.sh &
cd toolchains/m68k-unknown-amigaos
unlink /usr/bin/autom4te2.64
ln -s /opt/gcc-tools/epoch2/bin/autom4te-2.64 /usr/bin/autom4te2.64
make distclean
make
cd ../sdk
make GCCSDK_INSTALL_CROSSBIN=/opt/netsurf/m68k-unknown-amigaos/cross/bin GCCSDK_INSTALL_ENV=/opt/netsurf/m68k-unknown-amigaos/env distclean
make GCCSDK_INSTALL_CROSSBIN=/opt/netsurf/m68k-unknown-amigaos/cross/bin GCCSDK_INSTALL_ENV=/opt/netsurf/m68k-unknown-amigaos/env
cd ../..

export PATH=/opt/netsurf/m68k-unknown-amigaos/cross/bin:$PATH
export PKG_CONFIG_PATH=/opt/netsurf/m68k-unknown-amigaos/env/lib/pkgconfig:$PKG_CONFIG_PATH

mkdir -p /opt/netsurf/m68k/unknown/amigaos/cross/bin/m68k/unknown/amigaos
cp /opt/netsurf/m68k-unknown-amigaos/cross/m68k-unknown-amigaos/bin/* /opt/netsurf/m68k/unknown/amigaos/cross/bin/m68k/unknown/amigaos

cp /opt/netsurf/m68k/unknown/amigaos/cross/bin/m68k/unknown/amigaos/ar.exe /opt/netsurf/m68k/unknown/amigaos/cross/bin/m68k/unknown/amigaos/-ar.exe
rm /opt/netsurf/m68k/unknown/amigaos/cross/bin/m68k/unknown/amigaos/ar.exe

git clone git://git.netsurf-browser.org/buildsystem.git
cd buildsystem
git pull
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos clean
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos install
cd ..

git clone git://git.netsurf-browser.org/libnsgif.git
cd libnsgif
git pull
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos clean
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos install
cd ..

git clone git://git.netsurf-browser.org/libnsbmp.git
cd libnsbmp
git pull
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos clean
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos install
cd ..

git clone git://git.netsurf-browser.org/libwapcaplet.git
cd libwapcaplet
git pull
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos clean
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos install
cd ..

git clone git://git.netsurf-browser.org/libparserutils.git
cd libparserutils
git pull
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos clean
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos install
cd ..

git clone git://git.netsurf-browser.org/libhubbub.git
cd libhubbub
git pull
rm -Rf examples
rm -Rf perf
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos clean
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos install
cd ..

git clone git://git.netsurf-browser.org/libdom.git
cd libdom
git pull
rm -Rf examples
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos clean
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos install
cd ..

git clone git://git.netsurf-browser.org/libcss.git
cd libcss
git pull
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos clean
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos install
cd ..

git clone git://git.netsurf-browser.org/libsvgtiny.git
cd libsvgtiny
git pull
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos clean
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos install
cd ..

git clone git://git.netsurf-browser.org/libnsutils.git
cd libnsutils
git pull
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos clean
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos install
cd ..

git clone git://git.netsurf-browser.org/libutf8proc.git
cd libutf8proc
git pull
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos clean
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos install
cd ..

git clone git://git.netsurf-browser.org/nsgenbind.git
cd nsgenbind
git pull
make PREFIX=/opt/netsurf/m68k-unknown-amigaos/env clean
make PREFIX=/opt/netsurf/m68k-unknown-amigaos/env
make PREFIX=/opt/netsurf/m68k-unknown-amigaos/env install
cd ..

unlink /usr/bin/nsgenbind
ln -s $(PWD)/nsgenbind/build-i686-pc-cygwin-i686-pc-cygwin-release-binary/nsgenbind /usr/bin/nsgenbind

git clone git://git.netsurf-browser.org/netsurf.git
cd netsurf/
git pull
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env CC=m68k-unknown-amigaos-gcc clean
echo override NETSURF_USE_DUKTAPE := NO >> Makefile.config.example
cp Makefile.config.example Makefile.config
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env CC=m68k-unknown-amigaos-gcc 
cd ..
cp -R dataFiles/resources/* netsurf/resources/