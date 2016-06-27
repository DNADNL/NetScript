echo -en "Recherche : m68k-unknown-amigaos/Makefile "

while [ ! -f "toolchains/m68k-unknown-amigaos/Makefile" ]
do
	echo -en "."
	sleep 0.5
done
echo " m68k-unknown-amigaos/Makefile trouvé !"

sed -f scriptUpdate/scriptUpdate_m68k-unknown-amigaos_Makefile.sed toolchains/m68k-unknown-amigaos/Makefile > toolchains/m68k-unknown-amigaos/MakefileNEW
cp toolchains/m68k-unknown-amigaos/MakefileNEW toolchains/m68k-unknown-amigaos/Makefile
rm toolchains/m68k-unknown-amigaos/MakefileNEW






echo -en "Recherche : sdk/Makefile "

while [ ! -f "toolchains/sdk/Makefile" ]
do
	echo -en "."
	sleep 0.5
done
echo " sdk/Makefile trouvé !"

sed -f scriptUpdate/scriptUpdate_sdk_Makefile.sed toolchains/sdk/Makefile > toolchains/sdk/MakefileNEW
cp toolchains/sdk/MakefileNEW toolchains/sdk/Makefile
rm toolchains/sdk/MakefileNEW






echo -en "Recherche : c-parse.in "

while [ ! -f "toolchains/m68k-unknown-amigaos/gcc-3.4.6/gcc/c-parse.in" ]
do
	echo -en "."
	sleep 0.5
done
echo " c-parse.in trouvé !"

sed -f scriptUpdate/scriptUpdate_c-parse.in.sed toolchains/m68k-unknown-amigaos/gcc-3.4.6/gcc/c-parse.in > toolchains/m68k-unknown-amigaos/gcc-3.4.6/gcc/c-parseNEW.in
cp toolchains/m68k-unknown-amigaos/gcc-3.4.6/gcc/c-parseNEW.in toolchains/m68k-unknown-amigaos/gcc-3.4.6/gcc/c-parse.in
rm toolchains/m68k-unknown-amigaos/gcc-3.4.6/gcc/c-parseNEW.in







echo -en "Recherche : collect2.c "

while [ ! -f "toolchains/m68k-unknown-amigaos/gcc-3.4.6/gcc/collect2.c" ]
do
	echo -en "."
	sleep 0.5
done
echo " collect2.c trouvé !"

sed -f scriptUpdate/scriptUpdate_collect2.c.sed toolchains/m68k-unknown-amigaos/gcc-3.4.6/gcc/collect2.c > toolchains/m68k-unknown-amigaos/gcc-3.4.6/gcc/collect2NEW.c
cp toolchains/m68k-unknown-amigaos/gcc-3.4.6/gcc/collect2NEW.c toolchains/m68k-unknown-amigaos/gcc-3.4.6/gcc/collect2.c
rm toolchains/m68k-unknown-amigaos/gcc-3.4.6/gcc/collect2NEW.c

exit