if [ $1 = "toolchains" ]
then
	echo -en "Searching : m68k-unknown-amigaos/Makefile "

	while [ ! -f "toolchains/m68k-unknown-amigaos/Makefile" ]
	do
		echo -en "."
		sleep 0.5
	done
	echo " m68k-unknown-amigaos/Makefile found !"

	sed -f scriptUpdate/scriptUpdate_m68k-unknown-amigaos_Makefile.sed toolchains/m68k-unknown-amigaos/Makefile > toolchains/m68k-unknown-amigaos/MakefileNEW
	cp toolchains/m68k-unknown-amigaos/MakefileNEW toolchains/m68k-unknown-amigaos/Makefile
	rm toolchains/m68k-unknown-amigaos/MakefileNEW






	echo -en "Searching : sdk/Makefile "

	while [ ! -f "toolchains/sdk/Makefile" ]
	do
		echo -en "."
		sleep 0.5
	done
	echo " sdk/Makefile found !"

	sed -f scriptUpdate/scriptUpdate_sdk_Makefile.sed toolchains/sdk/Makefile > toolchains/sdk/MakefileNEW
	cp toolchains/sdk/MakefileNEW toolchains/sdk/Makefile
	rm toolchains/sdk/MakefileNEW






	echo -en "Searching : c-parse.in "

	while [ ! -f "toolchains/m68k-unknown-amigaos/gcc-3.4.6/gcc/c-parse.in" ]
	do
		echo -en "."
		sleep 0.5
	done
	echo " c-parse.in found !"

	sed -f scriptUpdate/scriptUpdate_c-parse.in.sed toolchains/m68k-unknown-amigaos/gcc-3.4.6/gcc/c-parse.in > toolchains/m68k-unknown-amigaos/gcc-3.4.6/gcc/c-parseNEW.in
	cp toolchains/m68k-unknown-amigaos/gcc-3.4.6/gcc/c-parseNEW.in toolchains/m68k-unknown-amigaos/gcc-3.4.6/gcc/c-parse.in
	rm toolchains/m68k-unknown-amigaos/gcc-3.4.6/gcc/c-parseNEW.in







	echo -en "Searching : collect2.c "

	while [ ! -f "toolchains/m68k-unknown-amigaos/gcc-3.4.6/gcc/collect2.c" ]
	do
		echo -en "."
		sleep 0.5
	done
	echo " collect2.c found !"

	sed -f scriptUpdate/scriptUpdate_collect2.c.sed toolchains/m68k-unknown-amigaos/gcc-3.4.6/gcc/collect2.c > toolchains/m68k-unknown-amigaos/gcc-3.4.6/gcc/collect2NEW.c
	cp toolchains/m68k-unknown-amigaos/gcc-3.4.6/gcc/collect2NEW.c toolchains/m68k-unknown-amigaos/gcc-3.4.6/gcc/collect2.c
	rm toolchains/m68k-unknown-amigaos/gcc-3.4.6/gcc/collect2NEW.c

elif [ $1 = "amiga" ]
then
	echo -en "Searching : frontends/amiga/Makefile "

	while [ ! -f "netsurf/frontends/amiga/Makefile" ]
	do
		echo -en "."
		sleep 0.5
	done
	echo " frontends/amiga/Makefile found !"

	sed -f scriptUpdate/scriptUpdate_frontends_amiga_Makefile.sed netsurf/frontends/amiga/Makefile > netsurf/frontends/amiga/MakefileNEW
	cp netsurf/frontends/amiga/MakefileNEW netsurf/frontends/amiga/Makefile
	rm netsurf/frontends/amiga/MakefileNEW

else
	echo "Please specify an argument : toolchains or amiga."
fi

exit