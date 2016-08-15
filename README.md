<h1>NetScript</h1>
<em>A script to compile automatically NetSurf for AmigaOS3 (Cross-compilation Windows using Cygwin - AmigaOS3)</em>

<h2>Important Information</h2>
To use NetScript, you need Cygwin installed into your computer. A tutorial to install cygwin is available below.<br/>

NetScript includes the choice to compile NetSurf with or without DukTape, as there are some issues with it.<br/>
You can also choose to keep the files needed to compile NetSurf, to dig in the code.<br/>

Since the 20160808-1 version, it is possible to execute NetScript in QUICK MODE.<br/>
This mode only compiles the netsurf folder (useful for those who often modify or debug it).<br/>
You need to use NetScript normally at least once to be able to use the QUICK MODE.<br/>
This version is also more dev-friendly : as a developer, you can compile NetSurf easily with your files modification.<br/>

<strong>If you only need to get NetSurf already compiled for AmigaOS3,</strong> you can <a href="https://github.com/DNADNL/NetScript/raw/master/NetSurf_3.6dev_AmigaOS3_2016-08-05.tar">download the NetSurf_XXX_AmigaOS3_CompilationDate.tar only</a>. 
This version doesn't contain DukTape and might be obsolete as it isn't updated every day. 

<h2>How to use NetScript ?</h2>
Here is the tutorial to make it work :
<ol>
	<li>Download the ZIP archive from the branch you want by selecting the branch, <br/>
	then clicking the "Clone or download" button, then "Download ZIP".<br/>
	You can <a href="https://github.com/DNADNL/NetScript/archive/master.zip">download the files from the master branch</a> by clicking this link.</li>
	<li>Open Cygwin as an Administrator (right click on the Cygwin shortcut, then select "Open as an Administrator").<br/>
	This will create automatically your personal directory. ;</li>
	<li>Extract the ZIP archive into a folder located in your personal directory ; <br/>
	<em>If you don`t change the cygwin install directory, it`s probably C:\cygwin\home\*Name of your windows session*</em></li>
	<li>On your Cygwin window, Move to the directory containing the files (via the cd command) ;</li>
	<li>Use this command between the quotation marks to start NetScript : "./NetScript.sh". <br/>
	If you want to use the QUICK MODE, use this command "./NetScript.sh -q" or this one "./NetScript.sh --quick".<br/>
	<em>Please see the "Important Information" part before</em></li>
</ol>

<h2>What does NetScript contains ?</h2>
NetScript is composed of :
<ul>
	<li>NetScript.sh, the script to launch, which creates the LOG file, useful if you reach the bad ending </em>(since the 20160808-1 version)</em> ;</li>
	<li>NS.sh, the script which downloads, installs and compiles NetSurf </em>(since the 20160808-1 version)</em> ;</li>
	<li>updateFiles.sh, the script used to modify some files during the compilation to fit in Cygwin ;</li>
	<li>the updateFile folder, which goes with scriptFilesUpdate.sh and contains every file modification script ;</li>
</ul>

<h2>How to install Cygwin ?</h2>
Here is the tutorial to install cygwin correctly to be sure NetScript works :
<ol>
	<li>Download cygwin via <a href="https://cygwin.com/install.html">the official website</a> (32 or 64 bits version, I advise the 32 one) ;</li>
	<li>Execute the setup file you just downloaded ;</li>
	<li>Click "Next" ;</li>
	<li>Select "Install from Internet", then click "Next" ;</li>
	<li>You can let the default Root Directory and the selected "Install For : All Users" as is (or change it if you need). Click "Next" ;</li>
	<li>You can let the default Local Package Directory as is (or change it if you need). Click "Next" ;</li>
	<li>Select "Direct connection", then click "Next" ;</li>
	<li>Select the available download site you want (for example, "http://cygwin.mirror.constant.com"), then click "Next". Cygwin downloads some packages... ;</li>
	<li>You can let the "Default" installation on every row as is (or change it if you need). Click "Next" ;</li>
	<li>If a "Resolving Dependencies" window appears, verify the "Select Required Packages" box is checked, then click "Next". The cygwin setup should be launched and won't last too long...</li>
	<li>At the end of the installation, you can check the "Create icon on Desktop" and/or the "Add icon to Start Menu" boxes if you want, finally click "Finish". Cygwin should be installed properly !</li>
</ol>
<strong>Thank you for using NetScript !</strong><br/>
<em>Please give credits when you use NetScript.</em>

<em>*** Readme Version : 20160814-1 ***</em>

