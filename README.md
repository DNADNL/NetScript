<h1> NetScript </h1>
<em>A script to compile automatically NetSurf for AmigaOS3 (Cross-compilation Windows using Cygwin - AmigaOS3)</em>

<strong>Hello and thank you for using NetScript !</strong>

<h2>Important information</h2>
To use NetScript, you need Cygwin installed into your computer with all the developer tools. A tutorial to install cygwin is available below.
For the moment, this version doesn`t include DukTape, as there are some issues with it.

<h2>How to use NetScript ?</h2>
Here is the tutorial to make it work :
1) 	Extract the RAR archive into a folder located in your personal directory 
	(If you don`t change the cygwin install directory, it`s probably C:\cygwin\home\*Name of your windows session²)
2) 	Open Cygwin
3) 	Move to the directory containing the files (via the cd command)
4) 	Use this command to start NetScript : ./letsStart.sh

<h2>What does NetScript contains ?</h2>
NetScript is composed of :
- letsStart.sh, the script to launch, which downloads, installs and compiles NetSurf
- scriptFilesUpdate.sh, the script used to modify some files during the compilation to fit in Cygwin
- the scriptUpdate folder, which goes with scriptFilesUpdate.sh and contains every file modification script
- the dataFiles folder, which contains some resources and tools.

<h2>How to install Cygwin ?</h2>
Here is the tutorial to install cygwin correctly to be sure NetScript works :
1) Download cygwin via the official website : https://cygwin.com/install.html (32 or 64 bits version, I advice the 32 one)
2) Execute the setup file you just downloaded
3) Click "Next"
4) Select "Install from Internet", then click "Next"
5) You can let the default Root Directory and the selected "Install For : All Users" as is (or change it if you need). Click "Next"
6) You can let the default Local Package Directory as is (or change it if you need). Click "Next"
7) Select "Direct connection", then click "Next"
8) Select the "http://cygwin.mirror.constamt.com" available download site, then click "Next". Cygwin downloads some packages...
9) Look for the "Devel" row and click on the double-arrow drawing on it to display the word "Install" instead of "Default" next to it. Click "Next"
10) If a "Resolving Dependencies" window appears, tick the "Select Required Packages" box, then click "Next". The cygwin setup should be launched

<strong>Please give credits when you use NetScript.</strong>
<em>Readme Version : 20160627-1.1</em>

