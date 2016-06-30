echo "-----------------------------------------------"
echo "        NetScript for Netsurf 3.6 dev          "
echo "Crossed Compilation Cygwin (Windows) - AmigaOS3"
echo "                                               "
echo "       Created by DNADNL, EyMenZ & Tygre       "
echo "                                               "
echo "                A big thanks to                "
echo "    Chris Young and the amiga.org forums !     "
echo "                                               "
echo "     *** Script Version : 20160630-1 ***       "
echo "-----------------------------------------------"

while [ \( "$duktape" != "Y" -a "$duktape" != "N" \) -a \( "$duktape" != "y" -a "$duktape" != "n" \) ]
do read -p "(1/2) Do you want to compile NetSurf WITH duktape ?(Y/n) : " duktape
done
while [ \( "$deleteOptNetsurf" != "Y" -a "$deleteOptNetsurf" != "N" \) -a \( "$deleteOptNetsurf" != "y" -a "$deleteOptNetsurf" != "n" \) ]
do read -p "(2/2) Do you want to KEEP the /opt/netsurf folder at the end of NetScript execution ? If you keep it, the future NetScript executions will be shorter. (Y/n) : " deleteOptNetsurf
done

if [ "$duktape" = "Y" -o "$duktape" = "y" ]
then 
echo "                                               "
echo "-----------------------------------------------"
echo "  You choose to compile NetSurf WITH DukTape   "
echo "-----------------------------------------------"
echo "                                               "
else
echo "                                               "
echo "-----------------------------------------------"
echo " You choose to compile NetSurf WITHOUT DukTape "
echo "-----------------------------------------------"
echo "                                               "
fi

if [ "$deleteOptNetsurf" = "Y" -o "$deleteOptNetsurf" = "y" ]
then 
echo "                                               "
echo "-----------------------------------------------"
echo "  You choose to keep the /opt/netsurf folder   "
echo "       at the end of NetScript execution       "
echo "    for future shorter NetScript executions    "
echo "-----------------------------------------------"
echo "                                               "
else
echo "                                               "
echo "-----------------------------------------------"
echo " You choose to delete the /opt/netsurf folder  "
echo "       at the end of NetScript execution       "
echo " (future NetScript executions will be longer)  "
echo "-----------------------------------------------"
echo "                                               "
fi

echo "Verifying /opt/netsurf folder... "
if [ ! -d "/opt/netsurf" ]
then
	echo "/opt/netsurf folder doesn't exist."
	echo "NetScript is now going to download and compile the toolchains needed to create /opt/netsurf (the NetScript execution will be longer). "
	git clone git://git.netsurf-browser.org/toolchains.git
	./scriptFilesUpdate.sh toolchains &
	cd toolchains/m68k-unknown-amigaos
	unlink /usr/bin/autom4te2.64
	ln -s /opt/gcc-tools/epoch2/bin/autom4te-2.64 /usr/bin/autom4te2.64
	make distclean
	make
	cd ../sdk
	make GCCSDK_INSTALL_CROSSBIN=/opt/netsurf/m68k-unknown-amigaos/cross/bin GCCSDK_INSTALL_ENV=/opt/netsurf/m68k-unknown-amigaos/env distclean
	make GCCSDK_INSTALL_CROSSBIN=/opt/netsurf/m68k-unknown-amigaos/cross/bin GCCSDK_INSTALL_ENV=/opt/netsurf/m68k-unknown-amigaos/env
	cd ../..
else
	echo "/opt/netsurf folder already exists."
	echo "NetScript doesn't need to download and compile the toolchains (the NetScript execution will be shorter). "
fi

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
./scriptFilesUpdate.sh amiga &
cd netsurf/
git pull
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env CC=m68k-unknown-amigaos-gcc clean

if [ "$duktape" = "Y" -o "$duktape" = "y" ]
then 
echo "                                               "
echo "-----------------------------------------------"
echo "                   REMINDER                    "
echo "  You choosed to compile NetSurf WITH DukTape  "
echo "-----------------------------------------------"
echo "                                               "
else
echo "                                               "
echo "-----------------------------------------------"
echo "                    REMINDER                   "
echo " You choosed to compile NetSurf WITHOUT DukTape"
echo "-----------------------------------------------"
echo "                                               "
echo override NETSURF_USE_DUKTAPE := NO >> Makefile.config.example
cp Makefile.config.example Makefile.config
fi

make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env CC=m68k-unknown-amigaos-gcc package
mv NetSurf_Amiga/netsurf.tar ../NetSurf_3.6_AmigaOS3.tar
cd ..
rm -Rf buildsystem libcss libdom libhubbub libnsbmp libnsgif libnsutils libparserutils libsvgtiny libutf8proc libwapcaplet nsgenbind toolchains
rm -Rf netsurf/*
rm -Rf netsurf

if [ "$deleteOptNetsurf" = "Y" -o "$deleteOptNetsurf" = "y" ]
then 
echo "                                               "
echo "-----------------------------------------------"
echo "                   REMINDER                    "
echo "  You choosed to KEEP the /opt/netsurf folder  "
echo "       at the end of NetScript execution       "
echo "    for future shorter NetScript executions    "
echo "-----------------------------------------------"
echo "                                               "
else
echo "                                               "
echo "-----------------------------------------------"
echo "                   REMINDER                    "
echo " You choosed to DELETE the /opt/netsurf folder "
echo "       at the end of NetScript execution       "
echo " (future NetScript executions will be longer)  "
echo "-----------------------------------------------"
echo "                                               "
rm -Rf /opt/netsurf
fi

echo "                                               "
echo "-----------------------------------------------"
echo "                      END                      "
echo "     Your NetSurf Archive is available in :    "
echo "$(PWD)"
echo "    And is called NetSurf_3.6_AmigaOS3.tar     "
echo "                                               "
echo "     Unpack it into a folder reachable by      "
echo "      your AmigaOS3 and then install it.       "
echo "(LHA Archive Format is not supported by Cygwin,"
echo "         sorry for the inconvenience)          "
echo "                                               "
echo "         Thanks for using NetScript !          "
echo "-----------------------------------------------"
echo "                                               "


