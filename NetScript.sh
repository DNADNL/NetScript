NETSURF_VERSION="3.6dev"
NETSURF_ARCHIVE_NAME="NetSurf_$NETSURF_VERSION""_AmigaOS3.tar"

echo "-----------------------------------------------"
echo "         NetScript for Netsurf $NETSURF_VERSION"
echo "Crossed Compilation Cygwin (Windows) - AmigaOS3"
echo "                                               "
echo "       Created by DNADNL, EyMenZ & Tygre       "
echo "                                               "
echo "               A big thanks to :               "
echo "          Chris Young, transcode-open          "
echo "           and the amiga.org forums !          "
echo "                                               "
echo "     *** Script Version : 20160719-1 ***       "
echo "-----------------------------------------------"

while [ \( "$compileWithDukTape" != "Y" -a "$compileWithDukTape" != "N" \) -a \( "$compileWithDukTape" != "y" -a "$compileWithDukTape" != "n" \) ]
	do read -p "(1/3) Do you want to compile NetSurf WITH DukTape ?(Y/n) : " compileWithDukTape
done

while [ \( "$keepFiles" != "Y" -a "$keepFiles" != "N" \) -a \( "$keepFiles" != "y" -a "$keepFiles" != "n" \) ]
	do read -p "(2/3) Do you need to KEEP the files used for the compilation at the end of NetScript execution (to dig in the code) ? (Y/n) : " keepFiles
done

while [ \( "$keepOptNetSurf" != "Y" -a "$keepOptNetSurf" != "N" \) -a \( "$keepOptNetSurf" != "y" -a "$keepOptNetSurf" != "n" \) ]
	do read -p "(3/3) Do you want to KEEP the /opt/netsurf folder at the end of NetScript execution ? If you keep it, the future NetScript executions will be shorter. (Y/n) : " keepOptNetSurf
done

if [ "$compileWithDukTape" = "Y" -o "$compileWithDukTape" = "y" ]
	then 
		echo "                                               "
		echo "-----------------------------------------------"
		echo "   You chose to compile NetSurf WITH DukTape   "
		echo "-----------------------------------------------"
		echo "                                               "
	else
		echo "                                               "
		echo "-----------------------------------------------"
		echo " You chose to compile NetSurf WITHOUT DukTape  "
		echo "-----------------------------------------------"
		echo "                                               "
fi

if [ "$keepFiles" = "Y" -o "$keepFiles" = "y" ]
	then 
		echo "                                               "
		echo "-----------------------------------------------"
		echo "       You chose to KEEP the files after       "
		echo "            the NetScript Execution            "
		echo "-----------------------------------------------"
		echo "                                               "
	else
		echo "                                               "
		echo "-----------------------------------------------"
		echo "      You chose to DELETE the files after      "
		echo "            the NetScript Execution            "
		echo "-----------------------------------------------"
		echo "                                               "
fi

if [ "$keepOptNetSurf" = "Y" -o "$keepOptNetSurf" = "y" ]
	then 
		echo "                                               "
		echo "-----------------------------------------------"
		echo "   You chose to KEEP the /opt/netsurf folder   "
		echo "       at the end of NetScript execution       "
		echo "    for future shorter NetScript executions    "
		echo "-----------------------------------------------"
		echo "                                               "
	else
		echo "                                               "
		echo "-----------------------------------------------"
		echo "  You chose to DELETE the /opt/netsurf folder  "
		echo "       at the end of NetScript execution       "
		echo " (future NetScript executions will be longer)  "
		echo "-----------------------------------------------"
		echo "                                               "
fi

echo "                                             "
echo "_/>_/>_/>_/>_/>_/>_/>_/>_/>_/>_/>_/>_/>_/>_/>"
echo "                  Cleaning                   "
echo "_/>_/>_/>_/>_/>_/>_/>_/>_/>_/>_/>_/>_/>_/>_/>"
echo "                                             "

echo "Deleting old NetScript files..."

rm -Rf buildsystem libcss libdom libhubbub libnsbmp libnsgif libnsutils libparserutils libsvgtiny libutf8proc libwapcaplet nsgenbind toolchains NetSurf_*_AmigaOS3.tar
rm -Rf netsurf/*
rm -Rf netsurf

echo "Old NetScript files deleted !"

echo "                                              "
echo "<><><><><><><><><><><><><><><><><><><><><><><>"
echo "                 Cygwin Tools                 "
echo "<><><><><><><><><><><><><><><><><><><><><><><>"
echo "                                              "

echo "Installing Cygwin tools..."

lynx -source rawgit.com/transcode-open/apt-cyg/master/apt-cyg > apt-cyg
install apt-cyg /bin
rm apt-cyg
apt-cyg install wget git make patch pkg-config apache2 python subversion gperf flex bison autoconf gcc-g++ gcc-tools-epoch2-automake libidn-devel kde-dev-scripts

echo "Cygwin tools installed !"

echo "                                               "
echo "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo "                  Toolchains                   "
echo "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo "                                               "

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

echo "                                               "
echo "$;$;$;$;$;$;$;$;$;$;$;$;$;$;$;$;$;$;$;$;$;$;$;$"
echo "                 Build System                  "
echo "$;$;$;$;$;$;$;$;$;$;$;$;$;$;$;$;$;$;$;$;$;$;$;$"
echo "                                               "

git clone git://git.netsurf-browser.org/buildsystem.git
cd buildsystem
git pull
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos clean
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos install
cd ..

echo "                                               "
echo "/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/"
echo "                   Libnsgif                    "
echo "/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/"
echo "                                               "

git clone git://git.netsurf-browser.org/libnsgif.git
cd libnsgif
git pull
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos clean
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos install
cd ..

echo "                                               "
echo "^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^"
echo "                   Libnsbmp                    "
echo "^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^"
echo "                                               "

git clone git://git.netsurf-browser.org/libnsbmp.git
cd libnsbmp
git pull
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos clean
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos install
cd ..

echo "                                               "
echo "%|%|%|%|%|%|%|%|%|%|%|%|%|%|%|%|%|%|%|%|%|%|%|%"
echo "                  Libwapcaplet                 "
echo "%|%|%|%|%|%|%|%|%|%|%|%|%|%|%|%|%|%|%|%|%|%|%|%"
echo "                                               "

git clone git://git.netsurf-browser.org/libwapcaplet.git
cd libwapcaplet
git pull
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos clean
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos install
cd ..

echo "                                               "
echo "?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?"
echo "                 Libparserutils                "
echo "?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?"
echo "                                               "

git clone git://git.netsurf-browser.org/libparserutils.git
cd libparserutils
git pull
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos clean
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos install
cd ..

echo "                                               "
echo "OoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoO"
echo "                   Libhubbub                   "
echo "OoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoO"
echo "                                               "

git clone git://git.netsurf-browser.org/libhubbub.git
cd libhubbub
git pull
rm -Rf examples
rm -Rf perf
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos clean
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos install
cd ..

echo "                                               "
echo "#:#:#:#:#:#:#:#:#:#:#:#:#:#:#:#:#:#:#:#:#:#:#:#"
echo "                    Libdom                     "
echo "#:#:#:#:#:#:#:#:#:#:#:#:#:#:#:#:#:#:#:#:#:#:#:#"
echo "                                               "

git clone git://git.netsurf-browser.org/libdom.git
cd libdom
git pull
rm -Rf examples
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos clean
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos install
cd ..

echo "                                               "
echo "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"
echo "                    Libcss                     "
echo "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"
echo "                                               "

git clone git://git.netsurf-browser.org/libcss.git
cd libcss
git pull
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos clean
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos install
cd ..

echo "                                               "
echo "_&_&_&_&_&_&_&_&_&_&_&_&_&_&_&_&_&_&_&_&_&_&_&_"
echo "                   Libsvgtiny                  "
echo "_&_&_&_&_&_&_&_&_&_&_&_&_&_&_&_&_&_&_&_&_&_&_&_"
echo "                                               "

git clone git://git.netsurf-browser.org/libsvgtiny.git
cd libsvgtiny
git pull
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos clean
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos install
cd ..

echo "                                               "
echo "@¨@¨@¨@¨@¨@¨@¨@¨@¨@¨@¨@¨@¨@¨@¨@¨@¨@¨@¨@¨@¨@¨@¨@"
echo "                  Libnsutils                   "
echo "@¨@¨@¨@¨@¨@¨@¨@¨@¨@¨@¨@¨@¨@¨@¨@¨@¨@¨@¨@¨@¨@¨@¨@"
echo "                                               "

git clone git://git.netsurf-browser.org/libnsutils.git
cd libnsutils
git pull
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos clean
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos install
cd ..

echo "                                               "
echo "=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*="
echo "                  Libutf8proc                  "
echo "=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*="
echo "                                               "

git clone git://git.netsurf-browser.org/libutf8proc.git
cd libutf8proc
git pull
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos clean
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env HOST=m68k-unknown-amigaos install
cd ..

echo "                                               "
echo "{=}~{=}~{=}~{=}~{=}~{=}~{=}~{=}~{=}~{=}~{=}~{=}"
echo "                   Nsgenbind                   "
echo "{=}~{=}~{=}~{=}~{=}~{=}~{=}~{=}~{=}~{=}~{=}~{=}"
echo "                                               "

git clone git://git.netsurf-browser.org/nsgenbind.git
cd nsgenbind
git pull
make PREFIX=/opt/netsurf/m68k-unknown-amigaos/env clean
make PREFIX=/opt/netsurf/m68k-unknown-amigaos/env
make PREFIX=/opt/netsurf/m68k-unknown-amigaos/env install
cd ..

unlink /usr/bin/nsgenbind
ln -s $(PWD)/nsgenbind/build-i686-pc-cygwin-i686-pc-cygwin-release-binary/nsgenbind /usr/bin/nsgenbind

echo "                                               "
echo "~.~'~.~'~.~'~.~'~.~'~.~'~.~'~.~'~.~'~.~'~.~'~.~"
echo "                    NetSurf                    "
echo "~.~'~.~'~.~'~.~'~.~'~.~'~.~'~.~'~.~'~.~'~.~'~.~"
echo "                                               "

git clone git://git.netsurf-browser.org/netsurf.git
./scriptFilesUpdate.sh amiga &
cd netsurf/
git pull
make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env CC=m68k-unknown-amigaos-gcc clean

if [ "$compileWithDukTape" = "Y" -o "$compileWithDukTape" = "y" ]
	then 
		echo "                                               "
		echo "-----------------------------------------------"
		echo "                   REMINDER                    "
		echo "   You chose to compile NetSurf WITH DukTape   "
		echo "-----------------------------------------------"
		echo "                                               "
	else
		echo "                                               "
		echo "-----------------------------------------------"
		echo "                    REMINDER                   "
		echo "  You chose to compile NetSurf WITHOUT DukTape "
		echo "-----------------------------------------------"
		echo "                                               "
		echo override NETSURF_USE_DUKTAPE := NO >> Makefile.config.example
		cp Makefile.config.example Makefile.config
fi

make TARGET=amigaos3 PREFIX=/opt/netsurf/m68k-unknown-amigaos/env CC=m68k-unknown-amigaos-gcc package
mv NetSurf_Amiga/netsurf.tar ../$NETSURF_ARCHIVE_NAME
cd ..

if [ "$keepFiles" = "Y" -o "$keepFiles" = "y" ]
	then 
		echo "                                               "
		echo "-----------------------------------------------"
		echo "                    REMINDER                   "
		echo "       You chose to KEEP the files after       "
		echo "            the NetScript Execution            "
		echo "-----------------------------------------------"
		echo "                                               "
	else
		echo "                                               "
		echo "-----------------------------------------------"
		echo "                    REMINDER                   "
		echo "      You chose to DELETE the files after      "
		echo "            the NetScript Execution            "
		echo "-----------------------------------------------"
		echo "                                               "
		rm -Rf buildsystem libcss libdom libhubbub libnsbmp libnsgif libnsutils libparserutils libsvgtiny libutf8proc libwapcaplet nsgenbind toolchains
		rm -Rf netsurf/*
		rm -Rf netsurf
fi

if [ "$keepOptNetSurf" = "Y" -o "$keepOptNetSurf" = "y" ]
	then 
		echo "                                               "
		echo "-----------------------------------------------"
		echo "                   REMINDER                    "
		echo "   You chose to KEEP the /opt/netsurf folder   "
		echo "       at the end of NetScript execution       "
		echo "    for future shorter NetScript executions    "
		echo "-----------------------------------------------"
		echo "                                               "
	else
		echo "                                               "
		echo "-----------------------------------------------"
		echo "                   REMINDER                    "
		echo "  You chose to DELETE the /opt/netsurf folder  "
		echo "       at the end of NetScript execution       "
		echo " (future NetScript executions will be longer)  "
		echo "-----------------------------------------------"
		echo "                                               "
		rm -Rf /opt/netsurf
fi

if [ -f "$NETSURF_ARCHIVE_NAME" ]
	then
		echo "                                               "
		echo "-----------------------------------------------"
		echo "                  GOOD ENDING                  "
		echo "     Your NetSurf Archive is available in :    "
		echo "     $(PWD)"
		echo "   And is called $NETSURF_ARCHIVE_NAME"
		echo "                                               "
		echo "     Unpack it into a folder reachable by      "
		echo "      your AmigaOS3 and then install it.       "
		echo "(LHA Archive Format is not supported by Cygwin,"
		echo "         sorry for the inconvenience)          "
		echo "                                               "
		echo "         Thanks for using NetScript !          "
		echo "             Spread the world ! ^^             "
		echo "-----------------------------------------------"
		echo "                                               "
	else
		echo "                                               "
		echo "-----------------------------------------------"
		echo "                  BAD ENDING                   "
		echo "    The NetSurf Archive hasn't been created.   "
		echo "       That means an issue has been done       "
		echo "          during the compilation. :-(          "
		echo "                                               "
		echo "      Please try to launch NetScript again     "
		echo "    in order to compile the toolchains again   "
		echo "      by deleting the /opt/netsurf folder      "
		echo "         (this could solve the issue).         " 
		echo "                                               "
		echo "    Then, if you see again this bad ending,    "
		echo "            please create an issue             "
		echo "      on the GitHub NetScript repository.      "
		echo "                                               "
		echo "         Sorry for the inconvenience !         "
		echo "-----------------------------------------------"
		echo "                                               "

		while [ \( "$deleteOptNetSurf" != "Y" -a "$deleteOptNetSurf" != "N" \) -a \( "$deleteOptNetSurf" != "y" -a "$deleteOptNetSurf" != "n" \) ]
			do read -p "(1/1) Do you want to DELETE the /opt/netsurf folder now in order to recompile it (this could solve the issue encountered) ? This question is asked even if you already deleted it, in that case, NetScript can't make the folder reappear. (Y/n) : " deleteOptNetSurf
		done

		if [ "$deleteOptNetSurf" = "Y" -o "$deleteOptNetSurf" = "y" ]
			then 
				echo "                                               "
				echo "-----------------------------------------------"
				echo "  You chose to DELETE the /opt/netsurf folder  "
				echo "-----------------------------------------------"
				echo "                                               "
				rm -Rf /opt/netsurf
				echo "                                               "
				echo "-----------------------------------------------"
				echo "         /opt/netsurf folder deleted !         "
				echo "-----------------------------------------------"
				echo "                                               "
			else
				echo "                                               "
				echo "-----------------------------------------------"
				echo "   You chose to KEEP the /opt/netsurf folder   "
				echo "-----------------------------------------------"
				echo "                                               "
		fi

		echo "                                               "
		echo "-----------------------------------------------"
		echo "        Now, you can relaunch NetScript        "
		echo "    by using the \"./NetScript.sh\" command    "
		echo "     (sorry again for the inconvenience !)     "
		echo "                                               "
		echo "         Thanks for using NetScript !          "
		echo "             Spread the world ! ^^             "
		echo "-----------------------------------------------"
		echo "                                               "
fi