<h1> NetScript </h1>
<em>A script to compile automatically NetSurf for AmigaOS3 (Cross-compilation Windows using Cygwin - AmigaOS3)</em>
<hl>
<strong>Hello and thank you for using NetScript !</strong>


<h2>Important information</h2>
To use NetScript, you need Cygwin installed into your computer with all the developer tools. A tutorial to install cygwin is available below.
For the moment, this version doesn`t include DukTape, as there are some issues with it.

<h2>How to use NetScript ?</h2>
Here is the tutorial to make it work :
<ol>
	<li>Extract the RAR archive into a folder located in your personal directory ; <br/>
	<em>If you don`t change the cygwin install directory, it`s probably C:\cygwin\home\*Name of your windows session²</em></li>
	<li>Open Cygwin and Move to the directory containing the files (via the cd command) ;</li>
	<li>Use this command to start NetScript : ./letsStart.sh ;</li>
</ol>
<h2>What does NetScript contains ?</h2>
NetScript is composed of :
<ul>
	<li>letsStart.sh, the script to launch, which downloads, installs and compiles NetSurf ;</li>
	<li>scriptFilesUpdate.sh, the script used to modify some files during the compilation to fit in Cygwin ;</li>
	<li>the scriptUpdate folder, which goes with scriptFilesUpdate.sh and contains every file modification script ;</li>
	<li>the dataFiles folder, which contains some resources and tools.</li>
</ul>
<h2>How to install Cygwin ?</h2>
Here is the tutorial to install cygwin correctly to be sure NetScript works :
<ol>
	<li>Download cygwin via the official website : https://cygwin.com/install.html (32 or 64 bits version, I advise the 32 one) ;</li>
	<li>Execute the setup file you just downloaded ;</li>
	<li>Click "Next" ;</li>
	<li>Select "Install from Internet", then click "Next" ;</li>
	<li>You can let the default Root Directory and the selected "Install For : All Users" as is (or change it if you need). Click "Next" ;</li>
	<li>You can let the default Local Package Directory as is (or change it if you need). Click "Next" ;</li>
	<li>Select "Direct connection", then click "Next" ;</li>
	<li>Select the "http://cygwin.mirror.constamt.com" available download site, then click "Next". Cygwin downloads some packages... ;</li>
	<li>Look for the "Devel" row and click on the double-arrow drawing on it to display the word "Install" instead of "Default" next to it. Click "Next" ;</li>
	<li>If a "Resolving Dependencies" window appears, tick the "Select Required Packages" box, then click "Next". The cygwin setup should be launched...</li>
</ol>
<strong>Please give credits when you use NetScript.</strong>
<em>Readme Version : 20160627-1.1</em>

